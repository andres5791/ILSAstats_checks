# Change all variable names to uppercase
rm(list=ls())
require(haven)

dbdir <- r"(Z:\RandA\Work\AndresStrello\ILSAreport_checks\DB)"

files <- list.files(dbdir, 
           pattern = "*.sav", full.names = FALSE)

for(sav in files){
  message(sav)
  dat <- haven::read_sav(file.path(dbdir, sav),
                         user_na = TRUE,
                         .name_repair = "minimal")
  
  names(dat) <- toupper(names(dat))
  
  haven::write_sav(dat, 
                   file.path(dbdir,
                             sav))
}