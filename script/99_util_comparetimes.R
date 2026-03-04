rm(list=ls())
library(dplyr)
library(stringr)


timesR <- readRDS("outputR/timesR.Rds")
timesSPSS <- readRDS("timesSPSS.Rds") %>% filter(analysis != "t0")


# Adapt SPSS times to merge -----------

tmp.SPSS <- (function(times = timesSPSS){
  tab <- lapply(times$analysis, function(x){
  
    # Study, year and population  
    study = str_extract(x, "TIMSS|PIRLS|ICCS|ICILS")
    
    year = str_extract(x, "\\d{4}")
    
    if(study %in% "TIMSS"){
      population = substr(x, 7,7)
    } else {
      population = ifelse(study %in% "PIRLS", "4", "8")
    }
    
    # Recognize analysis type to equalize the names
    analysis = str_extract(x, "(?<=\\d{4}_).*")
    
    tmp.indic <- str_detect(analysis, "COR_PEARSON")
    
    if(tmp.indic){
      if(str_detect(analysis, "COR_PEARSON_PVS")){
        analysis <- "COR_PEARSON_2PV"
      } else {
        if(!str_detect(analysis, "COR_PEARSON_NOPV")) {
          analysis <- "COR_PEARSON_1PV"  
        }
      }
    }
    
    
    list(ORIGINAL = x, 
         STUDY = study,
         POPULATION = population,
         YEAR = year,
         ANALYSIS = analysis)
  })

  as.data.frame(bind_rows(tab))  

})() %>% full_join(timesSPSS %>% select(analysis, time_single),
                   join_by(ORIGINAL == analysis)) %>%
  rename(TIME_SPSS = time_single)


# Adapt R times to compare -----------------

tmp.R <-  (function(times = timesR){
  tmp.indic <- strsplit(times$PVRoots, " ", fixed = TRUE)
  tmp.indic
  
  x <- times$STATISTIC

  
  for(i in 1:nrow(times)){
    
    if(x[i] == "COR_PEARSON"){
      if(length(tmp.indic[[i]]) > 1) {
        x[i] <- "COR_PEARSON_2PV"
        } else {
        x[i] <- "COR_PEARSON_1PV"
      } 
    }
    
  }
  
  times$ANALYSIS <- x
  
  as.data.frame(times %>% 
                  select(STUDY, YEAR, POPULATION, ANALYSIS, time) %>%
                  rename(TIME_R = time))
  
})()

# Merge and save ----------
times_comparison <- full_join(tmp.R, tmp.SPSS, 
  join_by(STUDY, YEAR, POPULATION, ANALYSIS)) %>%
  select(-ORIGINAL) %>% 
  mutate(TIME_R = case_when(
    ANALYSIS == "LOGIT" ~ NA_real_,
    TRUE ~ TIME_R
  ))

# Calculate number of countries, schools and students for plots ---------

cdbk <- readRDS("codebook.Rds")
cdbk_2 <- bind_rows(cdbk) %>% 
  group_by(STUDY, YEAR, POPULATION) %>%
  slice(1) %>%
  select(STUDY, YEAR, POPULATION, nrwgt) %>%
  ungroup()
  
i <- 1
datstats <- lapply(1:nrow(cdbk_2), function(i){
  x <- as.list(cdbk_2[i, ])
  
  if(x$STUDY %in% "TIMSS"){
    dat <- haven::read_sav(file.path("DB",
                                     paste0("TIMSS_",x$POPULATION,"_", x$YEAR,".sav")),
                           col_select = c(IDCNTRY, IDSCHOOL, IDSTUD))
  } else {
    dat <- haven::read_sav(file.path("DB",
                                     paste0(x$STUDY, x$YEAR,".sav")),
                           col_select = c(IDCNTRY, IDSCHOOL, IDSTUD))
  }

  rwgt <- as.numeric(x$nrwgt)
    
  dat %>%
    summarise(
      STUDY = x$STUDY,
      YEAR = x$YEAR,
      POPULATION = x$POPULATION,
      N_CNTRY = n_distinct(IDCNTRY),
      N_SCHOOLS = n_distinct(IDCNTRY, IDSCHOOL),
      N_STUDENTS = n(),
      N_RWGT = rwgt,
      N_REPS_NOPV = N_CNTRY * N_RWGT + 1,
      N_REPS_PV = N_CNTRY * N_RWGT * 5 + 5
    )
}) %>% bind_rows()

# Merge the statistics to the times table --------------
tmp.analyses <- unique(times_comparison$ANALYSIS)

tmp.analyses.noPV <- c("COR_PEARSON_NOPV", "COR_SPEARMAN", "GROUP_DIF_NOPV")

tmp.table <- datstats %>%
  slice(rep(row_number(), 
            each = length(tmp.analyses)))
tmp.table$ANALYSIS <- rep(tmp.analyses, nrow(datstats))
tmp.table$N_REPS <- ifelse(
  tmp.table$ANALYSIS %in% tmp.analyses.noPV,
  tmp.table$N_REPS_NOPV,
  tmp.table$N_REPS_PV
)

times_comparison <- times_comparison %>% left_join(select(tmp.table, -c(N_REPS_NOPV, N_REPS_PV)),
                               join_by(STUDY, YEAR, POPULATION, ANALYSIS))

# Save ----------------
saveRDS(times_comparison, "outputR/times_comparison.Rds")


# Plot ------------
library(ggplot2)
library(ggrepel)
# 
# times_long <- times_comparison %>%
#   pivot_longer(
#     cols = c(TIME_R, TIME_SPSS),
#     names_to = "SOFTWARE",
#     values_to = "TIME"
#   ) %>%
#   mutate(
#     SOFTWARE = recode(SOFTWARE,
#                       TIME_R = "R",
#                       TIME_SPSS = "SPSS")
#   )
# 
# 
# 
# times_long$STUDY_YEAR_POP = ifelse(!times_long$STUDY %in% "TIMSS",
#                                    paste0(times_long$STUDY,"-", times_long$YEAR),
#                                    paste0(times_long$STUDY,times_long$POPULATION,"-", times_long$YEAR))
# 
# tmp.analyses.noPV <- c("COR_PEARSON_NOPV", "COR_SPEARMAN", "GROUP_DIF_NOPV")
# 
# ggplot(times_long %>% filter(ANALYSIS %in%  tmp.analyses.noPV), aes(
#   x = N_REPS,
#   y = TIME,
#   color = SOFTWARE
# )) + 
#   facet_wrap(~ANALYSIS) +
#   geom_point() +
#   geom_text_repel(
#     aes(label = STUDY_YEAR_POP),
#     size = 3,
#     show.legend = FALSE) +
#   # geom_smooth(
#   #   method = "lm",
#   #   se = FALSE
#   # ) +
#   scale_y_continuous(limits=c(-500, 2500)) +
#   labs(
#     x = "Number of replications x Country",
#     y = "Time (in seconds)",
#     title = "Processing time ILSAStats (R) vs IDB-Analyzer (SPSS)",
#     subtitle = "Statistic without PV scales"
#   ) +
#   scale_color_manual(
#     values = c(
#       "R" = "#d91a15",
#       "SPSS" = "#0071b9"
#     )
#   ) +
#   theme_bw()
# ggsave("outputR/time_nopv.pdf", dpi = 300, width = 16, height = 10, units = "cm",
#        scale = 1.5)
# 
# 
# 
# ggplot(times_long %>% filter(!ANALYSIS %in%  c(tmp.analyses.noPV, "LOGIT")), aes(
#   x = N_REPS,
#   y = TIME,
#   color = SOFTWARE
# )) + 
#   facet_wrap(~ANALYSIS) +
#   geom_point() +
#   geom_text_repel(
#     aes(label = STUDY_YEAR_POP),
#     size = 3,
#     show.legend = FALSE) +
#   # geom_smooth(
#   #   method = "lm",
#   #   se = FALSE
#   # ) +
#   scale_y_continuous(limits=c(-1000, 10000)) +
#   labs(
#     x = "Number of replications x Country",
#     y = "Time (in seconds)",
#     title = "Processing time ILSAStats (R) vs IDB-Analyzer (SPSS)",
#     subtitle = "Statistic with PV scales"
#   ) +
#   scale_color_manual(
#     values = c(
#       "R" = "#d91a15",
#       "SPSS" = "#0071b9"
#     )
#   ) +
#   theme_bw()
# ggsave("outputR/time_pv.pdf", dpi = 300, width = 16, height = 10, units = "cm",
#        scale = 1.5)
# 

# Option 2
# Get the ordered combinations
ordered_levels <- times_comparison %>%
  filter(ANALYSIS == "OLS") %>%
  arrange(desc(TIME_R)) %>%
  transmute(id = ifelse(STUDY %in% "TIMSS",
                        paste0(STUDY,"-",POPULATION, " ", YEAR),
                        paste0(STUDY," ", YEAR))) %>%  pull(id)
times_comparison2 <- times_comparison %>%
  mutate(
    id = ifelse(STUDY %in% "TIMSS",
                paste0(STUDY,"-",POPULATION, " ", YEAR),
                paste0(STUDY," ", YEAR)),
    id_factor = factor(id, levels = ordered_levels)
  ) %>% select(-id)

times_long <- times_comparison2 %>%
  pivot_longer(
    cols = c(TIME_R, TIME_SPSS),
    names_to = "Software",
    values_to = "TIME"
  ) %>%
  mutate(
    Software = recode(Software,
                      TIME_R = "R",
                      TIME_SPSS = "SPSS")
  )

ggplot(times_long %>% filter(!ANALYSIS %in% c("OLS", "LOGIT")), 
       aes(x = forcats::fct_rev(id_factor), y = TIME, color = Software)) +
  geom_point(size = 3) +
  geom_line(aes(group = id_factor), color = "grey50") +
  theme_minimal() +
  facet_wrap(~ANALYSIS, nrow = 2 ) +
  scale_y_continuous(limits = c(-500, 7000)) +
  scale_color_manual(
    values = c(
      "R" = "#d91a15",
      "SPSS" = "#0071b9"
    )
  ) +
  # labels above SPSS points
  geom_text(
    data = times_long %>% 
      filter(!ANALYSIS %in% c("OLS", "LOGIT"), Software == "SPSS"),
    aes(label = round(TIME, 0)),
    vjust = -0.8,
    size = 3,
    show.legend = FALSE
  ) +
  # labels below R points
  geom_text(
    data = times_long %>% 
      filter(!ANALYSIS %in% c("OLS", "LOGIT"), Software == "R"),
    aes(label = round(TIME, 1)),
    vjust = 1.6,
    size = 3,
    show.legend = FALSE
  ) +
  theme_bw() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)  
  ) +
  labs(
    x = "Study", y = "Time (in seconds)",
    title = "Processing time ILSAStats (R) vs IDB-Analyzer (SPSS)",
    caption = "BENCHMARK = Proportion of each proficiency level.
    COR_PEARSON_1PV = Correlation between one achievement scale and background questionnaire scale.
    COR_PEARSON_2PV = Correlation between two achievement scales.
    COR_PEARSON_NOPV = Correlation between two background questionnaire scales.
    COR_SPEARMAN = Spearman correlation between two background questionnaire scales.
    GROUP_DIF_NOPV = Mean difference between groups of continuous variable without plausible values
    GROUP_DIF_PV = Mean difference between groups of scale with plausible values.
    PERCENTILES = Calculation of three percentiles.")
ggsave("outputR/time_nomodel.pdf", width = 16, height = 12, unit = "cm", scale = 2)


ggplot(times_long %>% filter(ANALYSIS %in% c("OLS")), 
       aes(x = forcats::fct_rev(id_factor), y = TIME, color = Software)) +
  geom_point(size = 3) +
  geom_line(aes(group = id_factor), color = "grey50") +
  theme_minimal() +
  scale_y_continuous(limits = c(-500, 10000)) +
  scale_color_manual(
    values = c(
      "R" = "#d91a15",
      "SPSS" = "#0071b9"
    )
  ) +
  # labels above SPSS points
  geom_text(
    data = times_long %>% 
      filter(ANALYSIS %in% c("OLS"), Software == "SPSS"),
    aes(label = round(TIME, 0)),
    vjust = -0.8,
    size = 3,
    show.legend = FALSE
  ) +
  # labels below R points
  geom_text(
    data = times_long %>% 
      filter(ANALYSIS %in% c("OLS"), Software == "R"),
    aes(label = round(TIME, 1)),
    vjust = 1.6,
    size = 3,
    show.legend = FALSE
  ) +
  theme_bw() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)  
  ) +
  labs(
    x = "Study", y = "Time (in seconds)",
    title = "Processing time ILSAStats (R) vs IDB-Analyzer (SPSS)",
    subtitle = "Regression analysis (PV scale as dependent variable)")
ggsave("outputR/time_OLS.pdf", width = 16, height = 9, unit = "cm", scale = 2)
