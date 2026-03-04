rm(list=ls())
library(dplyr)
library(stringr)

resSPSS <- readRDS("results_spss.Rds")
resR <- readRDS("outputR/resultsR.Rds")
cdbk <- readRDS("codebook.Rds")

# Start of loop -----------
res_comp <- lapply(1:length(resR), function(i){  #length(resR), function(i){
## Common manipulation --------------
  xR <- resR[[i]]
  xS <- resSPSS[[i]]
  
  # Basic check: no processing of NAs or results not working
  if(all(is.na(xR)) | all(is.na(xS))) return(NA)
  if(all(is.atomic(xR)) | all(is.atomic(xS)) ) return(NA)
  
  # Change all strings to capital letters and names
  names(xR) <- toupper(names(xR))
  names(xS) <- toupper(names(xS))
  
  xR <- xR %>%
    mutate(across(where(is.character), toupper))
  xS <- xS %>%
    mutate(across(where(is.character), toupper))
  
  # Equalize the names for the averages
  xR <- xR %>%
    mutate(GROUP = recode(GROUP,
                          "COMPOSITE" = "TABLE AVERAGE"))
  
  if(!unique(xR$STATISTIC) == unique(xS$STATISTIC)) stop("Results follow different order")
  
  stats <- unique(xR$STATISTIC)
  
  
  # Re-order table by country + Table average at last
  xR <- xR %>%
    mutate(
      GROUP = factor(
        GROUP,
        levels = c(sort(setdiff(unique(GROUP), "TABLE AVERAGE")),
                   "TABLE AVERAGE")
      )
    ) %>%
    arrange(GROUP)
  
  xS <- xS %>%
    mutate(
      IDCNTRY = factor(
        IDCNTRY,
        levels = c(sort(setdiff(unique(IDCNTRY), "TABLE AVERAGE")),
                   "TABLE AVERAGE")
      )
    ) %>%
    arrange(IDCNTRY)
  
# Benchmark ---------------------
  if(stats %in% "BENCHMARK"){
    
    message(unique(xR$STUDY), "-",unique(xR$POPULATION), " ",
            unique(xR$YEAR), " ",unique(xR$STATISTIC))
    
    # Run this is cutoffs have decimals...
    if(any(str_detect(xS$CUTVAR, "\\d+\\.\\d+"))){
      tmp.cutvarR <- as.numeric(str_extract(xR$CUTVAR, "\\d+\\.\\d+"))
      tmp.cutvarS <- as.numeric(str_extract(xS$CUTVAR, "\\d+\\.\\d+"))
      
      xS <- xS %>%
        mutate(
          cutoff_num = str_extract(CUTVAR, "\\d+\\.\\d+"),
          CUTOFF = case_when(
            str_detect(CUTVAR, "^1\\.BELOW") ~ paste0("<", cutoff_num),
            str_detect(CUTVAR, "FROM")       ~ paste0(">=", cutoff_num),
            str_detect(CUTVAR, "AT OR ABOVE") ~ paste0(">=", cutoff_num)
          )
        ) %>%
        select(-cutoff_num)
    } else {
    # Run this if cutoffs are integers
      # Equalize the cutvars
      tmp.cutvarR <- as.numeric(str_extract(xR$CUTVAR, "\\d+\\.?\\d*"))
      tmp.cutvarS <- as.numeric(str_extract(xS$CUTVAR, "\\d{3}(?!.*\\d{3})"))
      
      # Harmonize the cutoffs into CUTOFF
      xS <- xS %>%
        mutate(
          cutoff_num = str_extract(CUTVAR, "\\d{3}"),
          CUTOFF = case_when(
            str_detect(CUTVAR, "BELOW") & str_detect(CUTVAR, "^1\\.") ~ 
              paste0("<", cutoff_num),
            
            str_detect(CUTVAR, "FROM") ~ 
              paste0(">=", cutoff_num),
            
            str_detect(CUTVAR, "AT OR ABOVE") ~ 
              paste0(">=", cutoff_num)
          )
        ) %>%
        select(-cutoff_num)
    }
    

    
    # Check if they are the same cutvars
    if(any(sort(unique(tmp.cutvarR)) != sort(unique(tmp.cutvarS)))) stop("Different",
                                                                         " number of cutoffs. Loop number: ", i)
    min_cut <- min(tmp.cutvarR)
    max_cut <- max(tmp.cutvarR)
    
    
    xR$CUTOFF <- xR$CUTVAR
    
    xR2 <- xR %>%
      select(STUDY, YEAR, POPULATION, STATISTIC, GROUP, CUTOFF, PCT, PCT_SE)
    
    xS2 <- xS %>%
      select(STUDY, YEAR, POPULATION, STATISTIC, IDCNTRY, CUTOFF, PCT, PCT_SE) %>%
      mutate(PCT = PCT / 100,
             PCT_SE = PCT_SE / 100) %>%
      rename(
        GROUP = IDCNTRY
      )
    
    return(full_join(xR2, xS2, 
                     join_by(STUDY, YEAR, POPULATION, STATISTIC, CUTOFF,GROUP),
                     suffix = c("_R","_SPSS")) %>%
      mutate(
        PCT_DIF = PCT_R - PCT_SPSS,
        PCT_SE_DIF = PCT_SE_R - PCT_SE_SPSS
      ))
  }

# Correlations -------------------
  if(stats %in% c("COR_PEARSON", "COR_SPEARMAN", "COR_PEARSON_NOPV")){
    
    # Recode in Spearman because IDB for some reason changes the variable name
    if(stats %in% "COR_SPEARMAN"){
      xS$XVAR <- sub("^R", "", xS$XVAR)
      xS$YVAR <- sub("^R", "", xS$YVAR)
    }
    
  # check if variables are the same
    if(any(sort(unique(c(xR$VARIABLE1, xR$VARIABLE2))) !=
       sort(unique(c(xS$XVAR, xS$YVAR))))) stop(
         "Variables in R and SPSS results are different. ",
         "R variables: ",paste(sort(unique(c(xR$VARIABLE1, xR$VARIABLE2))), collapse = " "),
         ". SPSS variables: ",paste(sort(unique(c(xS$XVAR, xS$YVAR))), collapse  = " ")
       )
    
    # Merge the tables
    return(xR %>% full_join(xS, 
                            join_by(STUDY, YEAR, POPULATION, STATISTIC,
                                    VARIABLE1 == XVAR,
                                    VARIABLE2 == YVAR,
                                    GROUP == IDCNTRY),
                            suffix = c("_R", "_SPSS")) %>%
             select(-c(N, TVALUE, PVALUE)) %>%
             mutate(RHO_DIF = RHO_R - RHO_SPSS,
                    RHO_SE_DIF = RHO_SE_R - RHO_SE_SPSS))
  }
  
  
# OLS --------------------------------
  if(stats %in% "OLS"){
    params <- cdbk[[i]]
  
    PVRoots <- ifelse(is.na(params$PVRoots),
                      NA_character_,
                      strsplit(params$PVRoots, " ", fixed = TRUE)[[1]])
    if(is.na(PVRoots)) PVTails <- NA_character_ else PVTails <- 
      ifelse(is.na(params$PVTails),
             "",
             strsplit(params$PVTails, " ", fixed = TRUE)[[1]])
    
    # Fix xR: change the PV independent variable to the correct format
    tmp.id.change <- paste0(PVRoots, 1, PVTails)
    tmp.change.to <- paste0(PVRoots, "_", PVTails)
    
    xR_2 <- as.data.frame(xR) %>% select(-c(B.T, PVALUE)) %>%
      rename(B_SE = B.SE)
    for(j in tmp.id.change){
      xR_2 <- xR_2 %>% mutate(
        EQVAR = case_when(
          EQVAR %in% !!j ~ tmp.change.to,
          TRUE ~ EQVAR
        ),
        XVAR = gsub(tmp.id.change, tmp.change.to, XVAR)
      ) 
    }

    # Fix xS: convert VARIABLE_D2 → VARIABLE2, and (CONSTANT) → (INTERCEPT)
    xS_2 <- xS %>%
      select(-c(BETA, B.T)) %>%
      mutate(EQVAR = gsub("_D(\\d+)", "\\1", EQVAR),       # ASDGSATR_D2 → ASDGSATR2
             EQVAR = ifelse(EQVAR == "(CONSTANT)", "(INTERCEPT)", EQVAR)) %>%
      rename(B_SE = B.SE)
    
    
    return(xR_2 %>% full_join(xS_2, 
                       join_by(STUDY, YEAR, STATISTIC, GROUP == IDCNTRY, EQVAR),
                       suffix = c("_R", "_SPSS")) %>%
      mutate(B_DIF = B_R - B_SPSS,
             B_SE_DIF = B_SE_R - B_SE_SPSS))
  }
  
# Mean difference ------------------------
  if(stats %in% c("GROUP_DIF_PV", "GROUP_DIF_NOPV")){
    
    params <- cdbk[[i]]
    
    return(    xR %>% 
                 select(-c(TVALUE, DF, PVALUE)) %>%
                 mutate(ALMVARS = params$almvars) %>%
                 full_join(xS %>%
                             select(-c(T)), 
                           join_by(STUDY, YEAR, POPULATION, STATISTIC, 
                                   GROUP == IDCNTRY,
                                   BYVAR == GROUP),
                           suffix = c("_R","_SPSS")) %>%
                 mutate(MEAN_DIF = MEAN_R - MEAN_SPSS,
                        SE_DIF = SE_R - SE_SPSS)
               )
    
  }
  
# Percentiles ---------------------------------------------
  
  if(stats %in% "PERCENTILES"){
    
    return(
      xR %>%
        full_join(xS %>% select(-c(DVAR, N)),
                  join_by(STUDY, YEAR, POPULATION, STATISTIC, 
                          BYVAR == GROUP, 
                          GROUP == IDCNTRY,
                          PERCENTILE),
                  suffix = c("_R", "_SPSS")) %>%
        mutate(EST_DIF = EST_R - EST_SPSS,
               SE_DIF = SE_R - SE_SPSS)
    )
    
  }
  
  return(NA)
  
})

# Save ----
saveRDS(res_comp, "outputR/results_compared.Rds")

# Arrange by kind of analysis -------------

tmp.stats <- unique(sapply(1:length(cdbk), function(i) cdbk[[i]]$STATISTIC))
tmp.stats

res_agg <- setNames(lapply(tmp.stats, function(i) list()), tmp.stats)
for(i in 1:length(res_agg)){
  stat <- tmp.stats[i]
  
  j <- 1
  for(k in 1:length(cdbk)){
   
    xstat <- cdbk[[k]]$STATISTIC
    
    if(xstat == stat){
      res_agg[[i]][[j]] <- res_comp[[k]]
      j <- j + 1
    } else next
     
  }
  
}

saveRDS(res_agg, "outputR/res_comp_bystatistic.Rds")


# Merge by analysis --------------------------

res_agg2 <- lapply(res_agg, function(i) {
  
  if(all(is.na(i))) return(NULL)

  for(j in 1:length(i)) if(all(is.na(i[[j]]))) i[[j]] <- NULL
  
  bind_rows(i)

  })
saveRDS(res_agg2, "outputR/res_comp_merged.Rds")

## Save to excel -------
library(openxlsx)

# Define your decimals variable
N.decimals <- 4  # change as needed
Decimals.critical <- 0.0001  # change as needed


# Create number format string
num_fmt <- paste0("0.", paste(rep("0", N.decimals), collapse = ""))

# Styles for conditional formatting
flag_style <- createStyle(
  bgFill = "#F2DCDB",
  fontColour = "#632523"
)

wb <- createWorkbook()

for (sheet_name in names(res_agg2)) {
  df <- res_agg2[[sheet_name]]
  
  addWorksheet(wb, sheet_name)
  freezePane(wb, sheet_name, firstRow = TRUE)  # <-- add this
  writeData(wb, sheet_name, df)
  
  # Find columns ending in _R, _SPSS, or _DIF
  target_cols <- which(grepl("(_R|_SPSS|_DIF)$", names(df)))
  
  # Apply number format to those columns
  for (col in target_cols) {
    addStyle(wb, sheet_name,
             style = createStyle(numFmt = num_fmt),
             rows = 2:(nrow(df) + 1),
             cols = col,
             gridExpand = TRUE)
  }
  
  # Conditional formatting for _DIF columns
  dif_cols <- which(grepl("_DIF$", names(df)))
  
  for (col in dif_cols) {
    # Above +Decimals.critical
    conditionalFormatting(wb, sheet_name,
                          cols = col,
                          rows = 2:(nrow(df) + 1),
                          rule = paste0(">", Decimals.critical),
                          style = flag_style,
                          type = "expression")
    
    # Below -Decimals.critical
    conditionalFormatting(wb, sheet_name,
                          cols = col,
                          rows = 2:(nrow(df) + 1),
                          rule = paste0("<", -Decimals.critical),
                          style = flag_style,
                          type = "expression")
  }
}

saveWorkbook(wb, "outputR/res_comp_bystatistic.xlsx", overwrite = TRUE)
