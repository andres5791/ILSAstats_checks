rm(list=ls())
library(dplyr)
outputdir <- "outputSPSS"

# Get all .spv files
files <- list.files(outputdir, 
                    pattern = "*.spv", full.names = FALSE)
files <- setdiff(files, "output_t0.spv")

# Get modification times
mtimes <- file.info(paste0(outputdir,"\\",files))$mtime
mtime0 <- file.info(paste0(outputdir,"\\","output_t0.spv"))$mtime

# Data of times
times <- data.frame(analysis = c("t0",
                        gsub(".spv","", files)),
           last.modif = c(mtime0, mtimes)) |>
  arrange(last.modif) |>
  mutate(time_single = NA_real_, time_accum_s = NA_real_)  %>%   
  filter(last.modif >= mtime0)

times[1, "time_single"] <- times[1, "time_accum_s"] <- 0

for(i in 2:nrow(times)){
  diff_time <- difftime(times[i, "last.modif"], 
                        times[i-1, "last.modif"], 
                        units = "secs")
  times[i, "time_single"]  <- as.numeric(diff_time)
  
  if(!times[i, "analysis"] %in% paste0("output_t", c(1,2,3))){
    times[i, "time_accum_s"] <- times[i, "time_single"] + times[i-1, "time_accum_s"]
  } else {
    times[i, "time_accum_s"] <- times[i-1, "time_accum_s"]
  }
}
times <- times %>% mutate(
  time_accum_m = time_accum_s/60,
  time_accum_h = time_accum_s/60/60
) %>%
  mutate(time_single_m = time_single / 60, .after = time_single)


# Save
saveRDS(times %>% filter(!analysis %in% paste0("output_t", c(1,2,3))), 
        "outputR/timesSPSS.Rds")
