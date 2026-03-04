if (!"pacman" %in% rownames(installed.packages())) install.packages("pacman")
pacman::p_load(openxlsx,
               tidyverse,
               dplyr)
rm(list=ls())

# Load arguments ------------
codebook.csv <- read.csv("arguments/matrix_codebook.csv") %>%
  filter(!STUDY %in% "template")
min.args <- read.csv("arguments/matrix_arguments.csv")
study.args <- read.csv("arguments/matrix_study.csv")

# Folders for data and output -------------
datadir <- Sys.getenv("DB")
outputdir <- Sys.getenv("output")
macrofolder <-  Sys.getenv("macrofolder")

# Generate codebook --------------------------------
cdbk <- (function(x = codebook.csv){
  
  args <- list()
  
  for(i in 1:nrow(x)){
    
    statistic <- x[i, "STATISTIC"][[1]]
    
    colselect <- min.args |>
      filter(ANALYSIS %in% statistic) |>
      pull(ARGUMENTS) |>
      strsplit(";") |>
      unlist()
    
    colselect <- c("STUDY", "YEAR", "POPULATION", "STATISTIC",
                   colselect)

    study <- x[i, "STUDY"][[1]]
    year <- x[i, "YEAR"][[1]]
    colstudy <- study.args |>
      filter(STUDY %in% study & YEAR %in% year) |>
      select(-any_of(c("X","STUDY", "YEAR"))) |> unlist()
    
   args[[i]] <- c(
     as.list(codebook.csv[i, colselect]),
     colstudy
   )
   
  }
  
  # eliminate whitespaces
  args <- lapply(args, function(i) lapply(i, trimws))
  args
})()

saveRDS(cdbk, "codebook.Rds")

# Check if all variables exist --------------------
cdbk.vars <- lapply(cdbk, function(x){
  
columns.vars <- c(  "cvar",
                    "rootpv",
                    "almvars",
                    "xvar",
                    "xvar0",
                    "PVRoots",
                    "dvar0",
                    "convar",
                    "catvar")

var2 <- c(character(0))

for(var in columns.vars){
  if(var %in% names(x)){
    
    if(!var %in% c("PVRoots", "rootpv")){
      if(is.na(x[[var]])) next
      
      tmp.var <- strsplit(x[[var]], " ", fixed = TRUE)[[1]]
      
      var2 <- c(var2, tmp.var)
    }
    
    if(var %in% "PVRoots"){
      
      if(is.na(x[[var]])) next
      
      tmp.var1 <- strsplit(x[[var]], " ", fixed = TRUE)[[1]]
      tmp.var2 <- ifelse(!is.na(x[["PVTails"]]),
                         strsplit(x[["PVTails"]], " ", fixed = TRUE)[[1]],
                         "")
      
      var2 <- c(var2, paste0(tmp.var1, "1", tmp.var2))
    }
    
    if(var %in% "rootpv"){
      if(is.na(x[[var]])) next
      
      tmp.var1 <- strsplit(x[[var]], " ", fixed = TRUE)[[1]]
      tmp.var2 <- ifelse(!is.na(x[["tailpv"]]),
                         strsplit(x[["tailpv"]], " ", fixed = TRUE)[[1]],
                         "")
      
      var2 <- c(var2, paste0(tmp.var1, "1", tmp.var2))
    }
  } else next
  
}

list(study = x$STUDY,
     year = x$YEAR,
     population = x$POPULATION,
     variables =  unique(var2))
})

for(x in cdbk.vars){
  
  filen <- ifelse(x$study %in% "TIMSS",
                  paste0("TIMSS_",x$population,"_",x$year,".sav"),
                  paste0(x$study,x$year,".sav"))

  dat <- haven::read_sav(file.path(datadir, filen),
                         n_max = 10,
                         .name_repair = "minimal")
  
  if(all(x$variables %in% names(dat))){
    message(x$study, " ", x$year, " (",x$population,"): .... OK!")
  } else {
    which.vars <- setdiff(x$variables, names(dat))
    message(x$study, " ", x$year, " (",x$population,"): ", 
            paste(which.vars), " missing.")
  }
}
rm(dat)
gc()

# SPSS syntaxes ------------------

syntax.list <- list(
  BENCHMARK = 
    'include file = "{{macro.folder}}\\JB_Bnch.ieasps".

JB_bnch 	 infile="{{origin.path}}"/
	 cvar={{cvar}} /
	 rootpv={{rootpv}}/
	 tailpv={{tailpv}}/
	 npv=5/
	 bnchmrk={{bnchmrk}} /
	 incnopv=N/
	 wgt={{wgt}}/
	 nrwgt={{nrwgt}} /
	 rwgt=/
	 jkz={{jkz}}/
	 jkr={{jkr}}/
	 jk2type={{jk2type}}/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut={{shrtcut}}/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=N/
	 selcrit = /
	 selvar = /
	 outdir="{{output.folder}}"/
	 outfile="{{output.file}}".',
  
  COR_PEARSON = 
    'include file = "{{macro.folder}}\\JB_CorP.ieasps".

JB_CorP 	 infile="{{origin.path}}"/
	 cvar={{cvar}} /
	 xvar0={{xvar0}} /
	 PVRoots={{PVRoots}} /
	 PVTails={{PVTails}}/
	 npv=5/
	 wgt={{wgt}}/
	 nrwgt={{nrwgt}} /
	 rwgt=/
	 jkz={{jkz}}/
	 jkr={{jkr}}/
	 jk2type={{jk2type}}/
	 stratvar={{stratvar}}/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 pairwise=N/
	 kfac=0/
	 shrtcut={{shrtcut}}/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="{{output.folder}}"/
	 outfile="{{output.file}}".',
  
  COR_PEARSON_NOPV = 
    'include file = "{{macro.folder}}\\JB_Cor.ieasps".

JB_Cor 	 infile="{{origin.path}}"/
	 cvar={{cvar}} /
	 xvar={{xvar}} /
	 wgt={{wgt}}/
	 jkz={{jkz}}/
	 jkr={{jkr}}/
	 jk2type={{jk2type}}/
	 stratvar={{stratvar}}/
	 nrwgt={{nrwgt}}/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 corrtype=PEARSON/
	 pairwise=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="{{output.folder}}"/
	 outfile="{{output.file}}".',
  
  COR_SPEARMAN = 
    'include file = "{{macro.folder}}\\JB_Cor.ieasps".

JB_Cor 	 infile="{{origin.path}}"/
	 cvar={{cvar}} /
	 xvar={{xvar}} /
	 wgt={{wgt}}/
	 jkz={{jkz}}/
	 jkr={{jkr}}/
	 jk2type={{jk2type}}/
	 stratvar={{jkz}}/
	 nrwgt={{nrwgt}}/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 corrtype=SPEARMAN/
	 pairwise=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="{{output.folder}}"/
	 outfile="{{output.file}}".',
  
  OLS = 
    'include file = "{{macro.folder}}\\JB_RegGP.ieasps".

JB_RegGP 	 infile="{{origin.path}}"/
	 cvar={{cvar}} /
	 convar={{convar}} /
	 catvar={{catvar}} /
	 codings={{codings}}/
	 refcats={{refcats}}/
	 ncats={{ncats}}/
	 PVRoots={{PVRoots}}/
	 PVTails={{PVTails}}/
	 dvar0={{dvar0}}/
	 rootpv={{rootpv}} /
	 tailpv={{tailpv}}/
	 npv=5/
	 wgt={{wgt}}/
	 nrwgt={{nrwgt}} /
	 rwgt=/
	 jkz={{jkz}}/
	 jkr={{jkr}}/
	 jk2type={{jk2type}}/
	 stratvar={{stratvar}}/
	 nomiss=Y/
	 method=JRR/
	 missing=listwise/
	 kfac=0/
	 shrtcut={{shrtcut}}/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 viewprgs=Y/
	 viewlbl=Y/
	 qcstats=Y/
	 newout=Y/
	 intavg = Y/
	 selcrit = /
	 selvar = /
	 outdir="{{output.folder}}"/
	 outfile="{{output.file}}".',
  
  LOGIT = 
    'include file = "{{macro.folder}}\\JB_LogRegP2.ieasps".

JB_LogRegP2 infile="{{origin.path}}"/
	 cvar={{cvar}} /
	 convar={{convar}} /
	 catvar={{catvar}} /
	 contrast={{contrast}}/
	 refcats={{refcats}}/
	 interact=/
	 interwpv=/
	 PVRoots = {{PVRoots}}/
	 PVTails = {{PVTails}}/
	 rootpv = {{rootpv}} /
	 tailpv = {{tailpv}}/
	 cutpoint={{cutpoint}}/
	 npv=5/
	 wgt={{wgt}}/
	 nrwgt={{nrwgt}} /
	 rwgt=/
	 jkz={{jkz}}/
	 jkr={{jkr}}/
	 jk2type={{jk2type}}/
	 stratvar={{stratvar}}/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut={{shrtcut}}/
	 viewcod=N/
	 viewprgs=Y/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 viewlbl=Y/
	 qcstats=Y/
	 report=Y/
	 newout=Y/
	 intavg = Y/
	 onegrp=N/
	 selcrit = /
	 selvar = /
	 outdir="{{output.folder}}"/
	 outfile="{{output.file}}".',
  
  GROUP_DIF_PV = 
    'include file = "{{macro.folder}}\\JB_PV.ieasps".

JB_PV 	 infile="{{origin.path}}"/
	 cvar={{cvar}} /
	 almvars={{almvars}} /
	 rootpv={{rootpv}} /
	 tailpv={{tailpv}}/
	 npv=5/
	 wgt={{wgt}}/
	 nrwgt={{nrwgt}} /
	 rwgt=/
	 jkz={{jkz}}/
	 jkr={{jkr}}/
	 jk2type={{jk2type}}/
	 stratvar={{stratvar}}/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut={{shrtcut}}/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=Y/
	 selcrit = /
	 selvar = /
	 outdir="{{output.folder}}"/
	 outfile="{{output.file}}".',
  
  GROUP_DIF_NOPV = 
    'include file = "{{macro.folder}}\\JB_Gen.ieasps".

JB_gen 	 infile="{{origin.path}}"/
	 cvar={{cvar}} /
	 almvars={{almvars}} /
	 xvar={{xvar}} /
	 wgt={{wgt}}/
	 jkz={{jkz}}/
	 jkr={{jkr}}/
	 jk2type={{jk2type}}/
	 stratvar={{stratvar}}/
	 nrwgt={{nrwgt}}/
	 nomiss=Y/
	 method=JRR/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=Y/
	 selcrit = /
	 selvar = /
	 outdir="{{output.folder}}"/
	 outfile="{{output.file}}".',
  
  PERCENTILES = 
    'include file = "{{macro.folder}}\\JB_PctilesP.ieasps".

JB_PctilesP infile="{{origin.path}}"/
	 cvar={{cvar}} /
	 pctiles=10 50 90 /
	 rootpv={{rootpv}} /
	 tailpv={{tailpv}}/
	 npv=5/
	 wgt={{wgt}}/
	 nrwgt={{nrwgt}} /
	 rwgt=/
	 jkz={{jkz}}/
	 jkr={{jkr}}/
	 jk2type={{jk2type}}/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut={{shrtcut}}/
	 viewcod=N/
	 ndec=2/
	 clean=Y/
	 strctry=N/
	 graphs = Y/
	 outdir="{{output.folder}}"/
	 outfile="{{output.file}}".'
)



# Replace arguments and generate syntax -------------------------------

new.syntax <- (function(codebook = cdbk, syntaxes = syntax.list,
                        data.dir = datadir, 
                        output.folder = outputdir,
                        macro.folder = macrofolder){
  new.syntax <- c(
    "SHOW.\nOUTPUT SAVE OUTFILE='{{outputdir}}\\output_t0.spv'.\n\n" )
  
  new.syntax <- gsub("{{outputdir}}", outputdir, new.syntax, fixed = TRUE)
  
  if(!is.list(codebook)) codebook <- list(codebook) # so the loop below works
  
  
  ## First level loop (by codebook) ----
  for(i in 1:length(codebook)){
    
    x <- codebook[[i]]
    
    message(x$STUDY, x$YEAR, x$STATISTIC)
    
    syntax <- syntaxes[[x$STATISTIC]]
    
    x$macro.folder <- macro.folder
    
    x$origin.path <- ifelse(x$STUDY %in% "TIMSS",
                            paste0(data.dir, "\\", x$STUDY,"_",x$POPULATION,"_",x$YEAR, ".sav"),
                            paste0(data.dir, "\\", x$STUDY,x$YEAR,".sav"))
    
    x$output.folder <- output.folder
    
    x$output.file <- ifelse(x$STUDY %in% "TIMSS",
                            paste0(x$STUDY,"_",x$POPULATION,"_",x$YEAR,"_",x$STATISTIC),
                            paste0(x$STUDY,x$YEAR,"_",x$STATISTIC))
    if(x$STATISTIC %in% "COR_PEARSON"){
      x$output.file <- ifelse(!is.na(x$xvar0),
                              paste0(x$output.file, "_", gsub(" ","", x$xvar0)),
                              paste0(x$output.file, "_PVS"))
    }
    
    args <- c(
      "macro.folder",
      "origin.path",
      "cvar",
      "rootpv",
      "tailpv",
      "almvars",
      "xvar",
      "xvar0",
      "PVRoots",
      "PVTails",
      "bnchmrk",
      "dvar0",
      "cutpoint",
      "convar",
      "catvar",
      "ncats",
      "refcats","codings","contrast",
      "wgt",
      "nrwgt",
      "jkz",
      "jkr",
      "jk2type",
      "shrtcut",
      "stratvar",
      "output.folder",
      "output.file"
    )
    
    ## Second level loop (arguments) ---------
    for(arg in args){
      
      # message(arg)
      
      if(!arg %in% names(x)) next
      
      toreplace <- paste0("{{", arg, "}}")
      
      x[[arg]] <- ifelse(is.na(x[[arg]]), "", x[[arg]])
      
      syntax <- gsub(toreplace, x[[arg]], syntax, fixed = TRUE)
      
    }
    
    new.syntax <- paste0(
      new.syntax,
      "\n\n",
      syntax,
      "\n\n * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. \n\n"
    )
    
  }

  new.syntax    
  })()

# Save syntax -----------------------------
writeLines(new.syntax,
           con = file("script/01b_SPSSsyntax.sps", encoding = "UTF-8"))
