if (!"pacman" %in% rownames(installed.packages())) install.packages("pacman")
pacman::p_load(openxlsx,
               tidyverse,
               sjlabelled,
               tictoc)
rm(list=ls())
#remotes::install_github("dopatendo/ILSAstats", force = TRUE)
library(ILSAstats)

# Paths, codebook, and basic function ------------
datadir <- "DB"
outputdir <- "outputR"
cdbk <- readRDS("codebook.Rds")

# Country to string
cnt.tostring <- function(x){
  lbs <- attributes(x)$labels
  
  names(lbs)[match(x, lbs)]
}

# Start loop to store results -----
results <- as.list(1:length(cdbk))

# Start to store the times
cdbk_2 <- lapply(cdbk, function(x){
  for(arg in c("rootpv", "tailpv", "PVRoots", "PVTails")){
    if(arg %in% names(x)) next else x[[arg]] <- NA_character_ 
  }
  x
})

times <- bind_rows(cdbk_2) %>%
  select(STUDY, YEAR, POPULATION, STATISTIC, rootpv, tailpv, PVRoots, PVTails) %>%
  mutate(time = NA_real_) 

# Load data and prepare ----------------
tic("Total time")
for(i in 1:length(cdbk)){
  tic()
  params <- cdbk[[i]]
  
  message(params$STUDY,"-",params$POPULATION," ",params$YEAR,
          ": ", params$STATISTIC)
  
  if(params$STATISTIC %in% "LOGIT"){
    results[[i]] <- NA
    t <- toc()
    times[i, "time"] <- t$toc - t$tic 
    next
  }
  
  if(params$STUDY %in% "TIMSS"){
    dat <- haven::read_sav(file.path(datadir, 
                                     paste0("TIMSS_",params$POPULATION,
                                            "_",params$YEAR,".sav")),
                           user_na = FALSE)  
  } else {
    dat <- haven::read_sav(file.path(datadir, 
                                     paste0(params$STUDY,params$YEAR,".sav")),
                           user_na = FALSE)  
  }
  
  
  # String country variable
  dat <- dat %>% mutate(CNTRY = cnt.tostring(IDCNTRY), .after = IDCNTRY)
  
  
  # Some basic arguments
  stats <- params$STATISTIC 
  
  # Identify the PV names
  ## rootpv and tailpv format
  if("rootpv" %in% names(params)){
    rootpv <- strsplit(params$rootpv, " ")[[1]]
    if(is.na(params$tailpv)) tailpv <- rep("", length(rootpv)) else {
      tailpv <- strsplit(params$tailpv, " ")[[1]]
    }
  }
  
  ## PVRoots and PVTails format
  if("PVRoots" %in% names(params)){
    PVRoots <- strsplit(params$PVRoots, " ")[[1]]
    if(is.na(params$PVTails)) PVTails <- rep("", length(PVRoots)) else {
      PVTails <- strsplit(params$PVTails, " ")[[1]]
    }
  }
  
  # Replicate weights and repsetup 
  rwgt <- repcreateILSA(study = params$STUDY,
                        year = as.numeric(params$YEAR),
                        df = dat,
                        repwtname = "RWT")
  rsetup <- repsetupILSA(study = params$STUDY,
                         year = as.numeric(params$YEAR),
                         repwt = rwgt,
                         df = dat,
                         group = "CNTRY")
  
  # Benchmark --------------
  if(stats %in% "BENCHMARK"){
    bnchmrk <- strsplit(params$bnchmrk, " ", fixed = TRUE)[[1]]
    bnchmrk <- as.numeric(gsub(",", ".", bnchmrk)) # in case it has commas as decimal
    
    # Generate PV variable
    for(pv in 1:5){
      tmp.pv <- dat[[paste0(rootpv, pv, tailpv)]] 
      
      dat[[paste0("PVd", pv)]] <- paste0("<", bnchmrk[1])
      for(b in bnchmrk){
        dat[[paste0("PVd", pv)]] <- ifelse(
          tmp.pv >= b,
          paste0(">=", b),
          dat[[paste0("PVd", pv)]]
        )
      }
    }
    
    res <- repprop(paste0("PVd", 1:5),
                   setup = rsetup)
    
    results[[i]] <- repprop.table(res, type = "long") %>%
      select(group, prop, se, category) %>% 
      rename(pct = prop, pct_se = se, cutvar = category) %>%
      mutate(study = params$STUDY,
             year = params$YEAR,
             population = params$POPULATION,
             statistic = params$STATISTIC,
             .before = group)
  }
  
  if(stats %in% "COR_PEARSON"){
    # Pearson correlation - PV and normal variable ---------
    if(length(PVRoots) == 1) {
      
      if(length(strsplit(params$xvar0, " ")[[1]]) > 1) stop("More than two variables specified")
      
      res <- reprho(
        x = params$xvar0,
        pv = paste0(PVRoots, 1:5, PVTails),
        setup = rsetup,
        rho = "pearson",
        aggregates = "composite"
      )
      
      results[[i]] <-  res %>% mutate(
        variable2 = paste0(PVRoots,"_", PVTails)
      ) %>%
        rename(rho_se = se) %>%
        mutate(study = params$STUDY,
               year = params$YEAR,
               population = params$POPULATION,
               statistic = params$STATISTIC,
               .before = group)
    }
    
    # Pearson correlation - PV and PV --------
    if(length(PVRoots) == 2){
      if(!is.na(params$xvar0)) stop("More than two variables specified")
      
      res <- reprho(
        pv = paste0(PVRoots[1], 1:5, PVTails[1]),
        pv2 = paste0(PVRoots[2], 1:5, PVTails[2]),
        setup = rsetup,
        rho = "pearson",
        aggregates = "composite"
      )
      
      results[[i]] <- res %>% mutate(
        variable1 = paste0(PVRoots[1], "_", PVTails[1]),
        variable2 = paste0(PVRoots[2], "_", PVTails[2]),
        .before = rho) %>%
        rename(rho_se = se) %>%
        mutate(study = params$STUDY,
               year = params$YEAR,
               population = params$POPULATION,
               statistic = params$STATISTIC,
               .before = group)
    }
  }
  
  # Pearson correlation - no PVs -----------
  if(stats %in% "COR_PEARSON_NOPV"){
    
    tmp.varn <- strsplit(params$xvar, " ")[[1]]
    
    if(length(tmp.varn) != 2) stop("Need 2 xvar defined")
    
    # Temporary fix because if not ILSAstat bugs
    countries_all_na <- list()
    
    for (var in tmp.varn) {
      countries_all_na[[var]] <- dat %>%
        group_by(CNTRY) %>%
        summarise(all_na = all(is.na(.data[[var]])), .groups = "drop") %>%
        filter(all_na) %>%
        pull(CNTRY)
    }
    
    dat <- dat %>% 
      filter(!CNTRY %in% unlist(unique(countries_all_na)))
    # Replicate weights and repsetup 
    rwgt <- repcreateILSA(study = params$STUDY,
                          year = as.numeric(params$YEAR),
                          df = dat,
                          repwtname = "RWT")
    rsetup <- repsetupILSA(study = params$STUDY,
                           year = as.numeric(params$YEAR),
                           repwt = rwgt,
                           df = dat,
                           group = "CNTRY")
    res <- reprho(
      x = tmp.varn,
      setup = rsetup,
      rho = "pearson",
      aggregates = "composite"
    )
    
    results[[i]] <- res %>% mutate(
      variable1 = tmp.varn[1],
      variable2 = tmp.varn[2],
      .after = group) %>%
      rename(rho_se = se) %>%
      mutate(study = params$STUDY,
             year = params$YEAR,
             population = params$POPULATION,
             statistic = params$STATISTIC,
             .before =1 )
  }
  
  # Spearman correlation -----------
  if(stats %in% "COR_SPEARMAN"){
    
    tmp.varn <- strsplit(params$xvar, " ")[[1]]
    
    if(length(tmp.varn) != 2) stop("Need 2 xvar defined")
    
    # Temporary fix because if not ILSAstat bugs
    countries_all_na <- list()
    
    for (var in tmp.varn) {
      countries_all_na[[var]] <- dat %>%
        group_by(CNTRY) %>%
        summarise(all_na = all(is.na(.data[[var]])), .groups = "drop") %>%
        filter(all_na) %>%
        pull(CNTRY)
    }
    
    dat <- dat %>% 
      filter(!CNTRY %in% unlist(unique(countries_all_na)))
    # Replicate weights and repsetup 
    rwgt <- repcreateILSA(study = params$STUDY,
                          year = as.numeric(params$YEAR),
                          df = dat,
                          repwtname = "RWT")
    rsetup <- repsetupILSA(study = params$STUDY,
                           year = as.numeric(params$YEAR),
                           repwt = rwgt,
                           df = dat,
                           group = "CNTRY")
    res <- reprho(
      x = tmp.varn,
      setup = rsetup,
      rho = "spearman",
      aggregates = "composite"
    )
    
    results[[i]] <- res %>% mutate(
      variable1 = tmp.varn[1],
      variable2 = tmp.varn[2],
      .after = group) %>%
      rename(rho_se = se) %>%
      mutate(study = params$STUDY,
             year = params$YEAR,
             population = params$POPULATION,
             statistic = params$STATISTIC,
             .before =1 )
  }
  
  
  # Mean difference by group PV -------------
  if(stats %in% "GROUP_DIF_PV"){
    
    if(length(strsplit(params$almvars, " ")[[1]]) > 1) stop("Only 1 almvar accepted")
    
    cats <- attributes(dat[[params$almvars]])$labels
    
    ncats <- setdiff(unique(dat[[params$almvars]]), NA)
    
    if(length(ncats) > 2){
      message("Variable in almvar ",
                                  params$almvars,
                                  " has more than 2 categories in data. ",
                                  "The first two values will be kept")
      
      tmp.vals <- sort(unique(dat[[params$almvars]]))
      
      dat[[params$almvars]] <- ifelse(dat[[params$almvars]] > tmp.vals[2],
                                      NA,
                                      dat[[params$almvars]])
    }
    
    if(length(ncats) < 2) stop("Variable in almvar has less than ",
    "2 categories in data")
    
      
    res <- repmean(x = paste0(rootpv, 1:5, tailpv),
                   PV = TRUE,
                   setup = rsetup,
                   by = params$almvars,
                   aggregates = "composite")
    
    res_1 <- res[[paste0(params$almvars,"==", cats[1])]] %>%
      select(group, N, mean, se) %>%
      mutate(byvar = names(cats)[match(cats[1], cats)],
             .before = 1)
    
    res_2 <- res[[paste0(params$almvars,"==", cats[2])]] %>%
      select(group, N, mean, se) %>%
      mutate(byvar = names(cats)[match(cats[2], cats)],
             .before = 1)
    
    tmp.varname <- paste0(c("meandiff_", "meandiffse_", "tvalue_", "df_", "pvalue_"), cats[1])
    res_dif <-   res[[paste0(params$almvars,"==", cats[2])]] %>%
      select(group, all_of(!!tmp.varname)) %>%
      mutate(byvar = paste0(names(cats)[match(cats[2], cats)],
                            "-",
                            names(cats)[match(cats[1], cats)]),
             .before = 1)
    names(res_dif) <- gsub(paste0("_", cats[1]), "", names(res_dif))
    names(res_dif) <- gsub("meandiff", "mean", names(res_dif))
    names(res_dif) <- gsub("meanse", "se", names(res_dif))
    
    results[[i]] <- bind_rows(list(res_1, res_2, res_dif)) %>%
      mutate(study = params$STUDY,
             year = params$YEAR,
             population = params$POPULATION,
             statistic = params$STATISTIC,
             .before =1 )
    
  }
  
  # Mean difference No PV ------------------
  if(stats %in% "GROUP_DIF_NOPV"){
    
    if(length(strsplit(params$almvars, " ")[[1]]) > 1) stop("Only 1 almvar accepted")
    
    cats <- attributes(dat[[params$almvars]])$labels
    
    ncats <- setdiff(unique(dat[[params$almvars]]), NA)
    
    # Check if number of possible responses is only 2
    # if more, then just keep the first two
    if(length(ncats) > 2){
      message("Variable in almvar ",
              params$almvars,
              " has more than 2 categories in data. ",
              "The first two values will be kept")
      
      tmp.vals <- sort(unique(dat[[params$almvars]]))
      
      dat[[params$almvars]] <- ifelse(dat[[params$almvars]] > tmp.vals[2],
                                      NA,
                                      dat[[params$almvars]])
    }
    
    # if less than 2, error
    if(length(ncats) < 2) stop("Variable in almvar has less than ",
                               "2 categories in data")
    
    res <- repmean(x = params$xvar,
                   PV = FALSE,
                   setup = rsetup,
                   by = params$almvars,
                   aggregates = "composite")
    
    res_1 <- res[[paste0(params$almvars,"==", cats[1])]] %>%
      select(group, N, mean, se) %>%
      mutate(byvar = names(cats)[match(cats[1], cats)],
             .before = 1)
    
    res_2 <- res[[paste0(params$almvars,"==", cats[2])]] %>%
      select(group, N, mean, se) %>%
      mutate(byvar = names(cats)[match(cats[2], cats)],
             .before = 1)
    
    tmp.varname <- paste0(c("meandiff_", "meandiffse_", "tvalue_", "df_", "pvalue_"), cats[1])
    res_dif <-   res[[paste0(params$almvars,"==", cats[2])]] %>%
      select(group, all_of(!!tmp.varname)) %>%
      mutate(byvar = paste0(names(cats)[match(cats[2], cats)],
                            "-",
                            names(cats)[match(cats[1], cats)]),
             .before = 1)
    names(res_dif) <- gsub(paste0("_", cats[1]), "", names(res_dif))
    names(res_dif) <- gsub("meandiff", "mean", names(res_dif))
    names(res_dif) <- gsub("meanse", "se", names(res_dif))
    
    results[[i]] <- bind_rows(list(res_1, res_2, res_dif))  %>%
      mutate(study = params$STUDY,
             year = params$YEAR,
             population = params$POPULATION,
             statistic = params$STATISTIC,
             .before =1 )
  }
  
  # Percentiles -----------
  
  if(stats %in% "PERCENTILES"){
    
    groupvar <- strsplit(params$cvar, " ", fixed = TRUE)[[1]]
    
    if(length(groupvar) == 1){
      ress <- repquant(x = paste0(rootpv, 1:5, tailpv),
                       qtl = c(.1, .5, .9),
                       PV = TRUE,
                       setup = rsetup) %>%
        rename(dvar = variable) %>%
        mutate(byvar = NA_character_,
               dvar = paste0(rootpv,"_",tailpv),
               .before = 1)
    } 
    if(length(groupvar) == 2){
      # recognize the number of categories
      ncats <- setdiff(unique(dat[[groupvar[2]]]), NA)
      
      cats <- attributes(dat[[groupvar[2]]])$labels
      
      res <- repquant(x = paste0(rootpv, 1:5, tailpv),
                      qtl = c(.1, .5, .9),
                      PV = TRUE,
                      setup = rsetup,
                      by = groupvar[2])  
      
      ress <- setNames(lapply(1:length(ncats), function(j){
        
        res[[paste0(groupvar[2],"==", cats[j])]] %>%
          select(group, P10, P10se, P50, P50se, P90, P90se) %>%
          mutate(dvar = paste0(rootpv, "_", tailpv),
                 byvar = names(cats)[match(cats[j], cats)],
                 .before = 1)
        
      }),
      names(cats)[cats %in% ncats]
      ) %>% bind_rows()
    }
    if(length(groupvar) > 2) stop("Only two variables accepted in 'cvar'")
    
    # Pass to long
    results[[i]] <-  list(
      ress %>% select(dvar, byvar, group, P10, P10se) %>% 
        rename(est = P10, se = P10se) %>%
        mutate(PERCENTILE = "p10", .before = est),
      ress %>% select(dvar, byvar, group, P50, P50se) %>% 
        rename(est = P50, se = P50se) %>%
        mutate(PERCENTILE = "p50", .before = est),
      ress %>% select(dvar, byvar, group, P90, P90se) %>% 
        rename(est = P90, se = P90se) %>%
        mutate(PERCENTILE = "p90", .before = est)
    ) %>% bind_rows() %>%
      filter(!group %in% "Pooled") %>%
      mutate(study = params$STUDY,
             year = params$YEAR,
             population = params$POPULATION,
             statistic = params$STATISTIC,
             .before =1 )
  }

  # OLS ------------------------
  if(stats %in% "OLS"){
    # Continuous variables
    convars <- strsplit(params$convar, " ")[[1]]
    
    # PVs variables - dependent
    pv_dep1 <- strsplit(rootpv, " ", fixed = TRUE)[[1]]
    if(is.na(params$tailpv)) pv_dep2 <- ifelse(!is.na(pv_dep1), "", "" ) else {
      pv_dep2 <- strsplit(tailpv, " ", fixed = TRUE)[[1]]
    }
    pv_dep <- c(list(paste0(pv_dep1, 1:5, pv_dep2)))
    names(pv_dep) <- paste0(pv_dep1, "_", pv_dep2)
    
    # PVs variables - independent
    if(!is.na(PVRoots)){
      pv_ind1 <- strsplit(PVRoots, " ", fixed = TRUE)[[1]]
      if(is.na(params$PVTails)) pv_ind2 <- ifelse(!is.na(pv_dep1), "", "" ) else {
        pv_ind2 <- strsplit(PVTails, " ", fixed = TRUE)[[1]]
      }
      pv_ind <- c(
        lapply(1:length(pv_ind1), function(j) paste0(pv_ind1[j], 1:5, pv_ind2[j]))
      )
      names(pv_ind) <- paste0(pv_ind1, "_", pv_ind2)
    } else {
      pv_ind1 <- pv_ind2 <- NULL
      pv_ind <- NULL
    }
    
    # Factorize the categorical variables
    catvars <- strsplit(params$catvar, " ")[[1]]
    refs <- as.numeric(strsplit(params$refcats, " ")[[1]])
    
    for(j in 1:length(catvars)){
      var <- catvars[j]
      
      ## Pass to factor
      dat[[paste0("f",var)]] <- sjlabelled::as_factor(dat[[var]])

      ## Set reference value
      tmp.levels <- levels(dat[[paste0("f",var)]])
      dat[[paste0("f",var)]] <- relevel(dat[[paste0("f",var)]],
                                        ref = tmp.levels[refs[j]])
    }

    # Formula
    reg.formula <- paste0(names(pv_dep), " ~ 1")
    
    if(length(convars) >= 1) reg.formula <- paste(
      reg.formula, paste(convars, collapse = " + "), sep = " + " 
    )
    
    if(length(catvars) >= 1) reg.formula <- paste(
      reg.formula, paste(paste0("f", catvars), collapse = " + "), sep = " + "
    )
    
    if(!is.na(PVRoots)) reg.formula <- paste(
      reg.formula, paste(names(pv_ind), collapse  = " + "), sep = " + "
    ) 
    
    reg.formula <- as.formula(reg.formula)
   
   # Run regression
    res <- replm2(formula = reg.formula,
          setup = rsetup,
          pvs = c(pv_dep, pv_ind),
          summarize = TRUE,
          na.action = na.omit,
          aggregates = "composite")
     
    # Change order to long
    cnts <- c("Composite", rownames(res$Coefficients))
    
    res2 <- lapply(cnts, function(cnt){
      
      if(cnt == "Composite") {
        mat <- res[[cnt]] 
        
        return(tibble(
          group = rep(cnt, nrow(mat)),
          EqVar = rownames(mat),
          b = mat[, "Estimate"],
          b.se = mat[, "Std. Error"],
          b.t = mat[, "t value"]
        ))
      } else {
        mat <- res[[cnt]]$repmodel 
        
      return(tibble(
        group = rep(cnt, nrow(mat)),
        EqVar = rownames(mat),
        b = mat[, "Estimate"],
        b.se = mat[, "Std. Error"],
        b.t = mat[, "t value"],
        pvalue = mat[, "Pr(>|t|)"]
      ))
    }
        }) %>% bind_rows() 
    
    # Restore the name of factor variables
    tmp <- res2$EqVar
    for(var in catvars){
      tmp.pattern <- paste0("^", "f", var, "[0-9]+$")
      tmp[grepl(tmp.pattern, tmp)] <- gsub(paste0("f", var),
                                       var,
                                       tmp[grepl(tmp.pattern, tmp)])
    }
    res2$EqVar <- tmp

    # Return final object    
    results[[i]] <- res2 %>%
      mutate(
        xvar = paste(
          setdiff(
            unique(res2$EqVar), 
            "(Intercept)"), 
          collapse = " "
          ),
        dvar = names(pv_dep)
             )  %>%
      mutate(study = params$STUDY,
             year = params$YEAR,
             population = params$POPULATION,
             statistic = params$STATISTIC,
             .before =1 )
  }
  
  # Logistic regression -------------
  if(stats %in% "LOGIT"){
    # # Continuous variables
    # convars <- strsplit(params$convar, " ")[[1]]
    # 
    # # PVs variables - dependent an with cutoff
    # pv_dep1 <- strsplit(rootpv, " ", fixed = TRUE)[[1]]
    # if(is.na(params$tailpv)) pv_dep2 <- ifelse(!is.na(pv_dep1), "", "" ) else {
    #   pv_dep2 <- strsplit(tailpv, " ", fixed = TRUE)[[1]]
    # }
    # for(pv in 1:5){
    #   tmp.name <- paste0(pv_dep1, pv, pv_dep2) 
    #   dat[[paste0("PVd",pv)]] <- ifelse(dat[[tmp.name]] >= as.numeric(params$cutpoint),
    #                                     1,
    #                                     0)
    # }
    # pv_dep <- list(PVdummy = paste0("PVd", 1:5))
    # 
    # # PVs variables - independent
    # if(!is.na(PVRoots)){
    #   pv_ind1 <- strsplit(PVRoots, " ", fixed = TRUE)[[1]]
    #   if(is.na(params$PVTails)) pv_ind2 <- ifelse(!is.na(pv_dep1), "", "" ) else {
    #     pv_ind2 <- strsplit(PVTails, " ", fixed = TRUE)[[1]]
    #   }
    #   pv_ind <- c(
    #     lapply(1:length(pv_ind1), function(j) paste0(pv_ind1[j], 1:5, pv_ind2[j]))
    #   )
    #   names(pv_ind) <- paste0(pv_ind1, "_", pv_ind2)
    # } else {
    #   pv_ind1 <- pv_ind2 <- NULL
    #   pv_ind <- NULL
    # }
    # 
    # # Factorize the categorical variables
    # # Logit in IDB does not change reference value, so it's constant in 1
    # catvars <- strsplit(params$catvar, " ")[[1]]
    # refs <- rep(1, length(catvars))
    # 
    # for(j in 1:length(catvars)){
    #   var <- catvars[j]
    #   
    #   ## Pass to factor
    #   dat[[paste0("f",var)]] <- sjlabelled::as_factor(dat[[var]])
    #   
    #   ## Set reference value
    #   tmp.levels <- levels(dat[[paste0("f",var)]])
    #   dat[[paste0("f",var)]] <- relevel(dat[[paste0("f",var)]],
    #                                     ref = tmp.levels[refs[j]])
    # }
    # 
    # # Formula
    # reg.formula <- paste0(names(pv_dep), " ~ 1")
    # 
    # if(length(convars) >= 1) reg.formula <- paste(
    #   reg.formula, paste(convars, collapse = " + "), sep = " + " 
    # )
    # 
    # if(length(catvars) >= 1) reg.formula <- paste(
    #   reg.formula, paste(paste0("f", catvars), collapse = " + "), sep = " + "
    # )
    # 
    # if(!is.na(PVRoots)) reg.formula <- paste(
    #   reg.formula, paste(names(pv_ind), collapse  = " + "), sep = " + "
    # ) 
    # 
    # reg.formula <- as.formula(reg.formula)
    # 
    # # Run regression
    # res <- repglm(reg.formula,
    #               family = stats::binomial,
    #               pvs = c(pv_dep, pv_ind),
    #               setup = rsetup,
    #               na.action = na.omit)
        
    results[[i]] <- NA
    
    
  }

  t <- toc()
  times[i, "time"] <- t$toc - t$tic 
}
# End of loop -----------
toc()

saveRDS(results, "outputR/resultsR.Rds")
saveRDS(times, "outputR/timesR.Rds")

