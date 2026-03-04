if (!"pacman" %in% rownames(installed.packages())) install.packages("pacman")
pacman::p_load(dplyr)
rm(list=ls())

# Load arguments ------------
cdbk <- readRDS("codebook.Rds")
outputdir <- "output"


# Import results -----------------------------------

res <- lapply(cdbk, function(x){
  stats <- x$STATISTIC
  study <- x$STUDY
  year <- x$YEAR
  
  if(stats == "BENCHMARK") filen <- "BENCHMARK"
  
  if(stats == "COR_PEARSON") filen <-
    ifelse(!is.na(x$xvar0),
           paste0("COR_PEARSON_", gsub(" ","", x$xvar0),"_Corr"),
           "COR_PEARSON_PVS_Corr")
  
  if(stats == "COR_PEARSON_NOPV") filen <- "COR_PEARSON_NOPV_Corr"
  
  if(stats == "COR_SPEARMAN") filen <- "COR_SPEARMAN_Corr"
  
  if(stats == "OLS") filen <- "OLS_Coef"
  
  if(stats == "LOGIT") filen <- "LOGIT_Coef"
  
  if(stats == "GROUP_DIF_PV") filen <- 
    paste0("GROUP_DIF_PV_", x$rootpv, 
           ifelse(!is.na(x$tailpv), x$tailpv, ""),
           "_by_", x$almvars, "_Sig")
  
  if(stats == "GROUP_DIF_NOPV") filen <-
    paste0("GROUP_DIF_NOPV_", x$xvar, "_by_", x$almvars, "_Sig")
  
  if(stats == "PERCENTILES") filen <- "PERCENTILES"
  
  if(study %in% "TIMSS") {
    filename <- paste0(study,"_",x$POPULATION,"_",year,"_", filen, ".csv")
  } else { 
    filename <- paste0(study, year,"_", filen, ".csv")
  }
  
  # Check if file exists, if not give message and go next
  if(!file.exists(file.path(outputdir, filename))){
    message("File ", filename, "does not exist. Returning NA.")
    df <- NA
    
    attr(df, "study") <- study
    attr(df, "year") <- year
    attr(df, "statistics") <- stats
    attr(df, "parameters") <- x

    return(df)    
  }
  
  df <- read.csv2(file.path(
    outputdir, filename
  ))
  
  attr(df, "study") <- study
  attr(df, "year") <- year
  attr(df, "statistics") <- stats
  attr(df, "parameters") <- x
  
  df
})

res_transformed <- lapply(res, function(x){
  
  param <- attributes(x)$parameters
  
  stats <- attributes(x)$statistics
  
  if("idcntry" %in% names(x)) x <- x %>% rename(IDCNTRY = idcntry)
  
  if(all(is.na(x))) return(NA)
  
  if(stats == "BENCHMARK") return(
    x %>% select(IDCNTRY, cutvar, n, pct, pct_se) %>%
      mutate(study = param$STUDY,
             year = param$YEAR,
             population = param$POPULATION,
             statistic = stats,
             .before = IDCNTRY)
  )
  
  if(stats %in% c("COR_PEARSON", "COR_SPEARMAN", "COR_PEARSON_NOPV")) {
    vars <- strsplit(trimws(unique(x$xvar)), " ", fixed = TRUE)[[1]]
    xvar <- vars[1]
    yvar <- vars[2]
    
    return(x %>% filter(Variable %in% !!xvar) %>%
      select(IDCNTRY, all_of(c(yvar, paste0(yvar, ".se")))) %>%
      rename(rho = !!yvar,
             rho_se = paste0(yvar,".se")) %>%
        mutate(xvar = xvar, 
               yvar = yvar,
               .before = rho) %>%
        mutate(study = param$STUDY,
               year = param$YEAR,
               population = param$POPULATION,
               statistic = stats,
               .before = IDCNTRY))
  }
  
  if(stats %in% "OLS") return(
    x %>% select(IDCNTRY, EqVar, b, beta, b.se, b.t) %>%
      mutate(study = param$STUDY,
             year = param$YEAR,
             statistic = stats,
             .before = IDCNTRY)
  )
  
  if(stats %in% "LOGIT") return(
    x %>% select(IDCNTRY, EqVar, b, ExpB, b.se, ExpB.se, b.wald, b.sig) %>%
      mutate(study = param$STUDY,
             year = param$YEAR,
             population = param$POPULATION,
             statistic = stats,
             .before = IDCNTRY)
  )
  
  if(stats %in% c("GROUP_DIF_PV")){
    
    cats <- unique(c(x$refgroup, x$compgroup))
    
    tmp.df <- x %>% filter(refgroup %in% cats[1] & compgroup %in% cats[2]) %>%
                   select(IDCNTRY, dvar, groupvar, refgroup, compgroup,
                          mnpv, mnpv_se, cmnpv, cmnpv_se,
                          mnpvdiff, mnpvdiff_se, mnpvdiff_t)
    
    return(
      list(
        tmp.df %>% select(IDCNTRY, dvar, mnpv, mnpv_se) %>%
          mutate(GROUP = cats[1], .after = dvar) %>%
          rename(mean = mnpv, se = mnpv_se),
        tmp.df %>% select(IDCNTRY, dvar, cmnpv, cmnpv_se) %>%
          mutate(GROUP = cats[2], .after = dvar) %>%
          rename(mean = cmnpv, se = cmnpv_se),
        tmp.df %>% select(IDCNTRY, dvar, mnpvdiff, mnpvdiff_se, mnpvdiff_t) %>%
          mutate(GROUP = paste0(cats[2],"-",cats[1]), .after = dvar) %>%
          rename(mean = mnpvdiff, se = mnpvdiff_se, t = mnpvdiff_t)) %>% 
        bind_rows() %>%
        mutate(study = param$STUDY,
               year = param$YEAR,
               population = param$POPULATION,
               statistic = stats,
               .before = IDCNTRY)
    )
    
    
  }
  
  if(stats %in% c("GROUP_DIF_NOPV")){
    
    cats <- unique(c(x$refgroup, x$compgroup))
    
    tmp.df <- x %>% filter(refgroup %in% cats[1] & compgroup %in% cats[2]) %>%
      select(IDCNTRY, dvar, groupvar, refgroup, compgroup,
             mnx, mnx_se, cmnx, cmnx_se,
             mnxdiff, mnxdiff_se, mnxdiff_t)
    
    return(
      list(
        tmp.df %>% select(IDCNTRY, dvar, mnx, mnx_se) %>%
          mutate(GROUP = cats[1], .after = dvar) %>%
          rename(mean = mnx, se = mnx_se),
        tmp.df %>% select(IDCNTRY, dvar, cmnx, cmnx_se) %>%
          mutate(GROUP = cats[2], .after = dvar) %>%
          rename(mean = cmnx, se = cmnx_se),
        tmp.df %>% select(IDCNTRY, dvar, mnxdiff, mnxdiff_se, mnxdiff_t) %>%
          mutate(GROUP = paste0(cats[2],"-",cats[1]), .after = dvar) %>%
          rename(mean = mnxdiff, se = mnxdiff_se, t = mnxdiff_t)) %>% 
        bind_rows() %>%
        mutate(study = param$STUDY,
               year = param$YEAR,
               population = param$POPULATION,
               statistic = stats,
               .before = IDCNTRY)
    )
  }
  
  
  if(stats %in% c("PERCENTILES")) {
    
    xvar <- trimws(gsub("IDCNTRY ", "", param$cvar))
    
    df <- x %>% rename(GROUP = !!xvar) %>%
      select(IDCNTRY, GROUP, dvar, n,
             p10, p10_se, p50, p50_se, p90, p90_se)
    
    return(    list(
      df %>% select(IDCNTRY, GROUP, dvar, n, p10, p10_se) %>% 
        rename(est = p10, se = p10_se) %>%
        mutate(PERCENTILE = "p10", .before = est),
      df %>% select(IDCNTRY, GROUP, dvar, n, p50, p50_se) %>% 
        rename(est = p50, se = p50_se) %>%
        mutate(PERCENTILE = "p50", .before = est),
      df %>% select(IDCNTRY, GROUP, dvar, n, p90, p90_se) %>% 
        rename(est = p90, se = p90_se) %>%
        mutate(PERCENTILE = "p90", .before = est)
    ) %>% bind_rows() %>%
      mutate(study = param$STUDY,
             year = param$YEAR,
             population = param$POPULATION,
             statistic = stats,
             .before = IDCNTRY)
    )
  }
  
})

saveRDS(res_transformed,
        "results_spss.Rds")
saveRDS(res_transformed,
        file.path(
          r"(D:\RandA Dropbox\Projects\Research Projects\46_ILSAreport\02_ILSAstats\02_Checks)",
          "results_SPSS.Rds"
        ))
