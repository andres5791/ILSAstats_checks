outputdir <- "output"

extensions <- c("\\.spv$", "\\.sav$", "\\.xlsx$")

files_to_delete <- unlist(lapply(extensions, function(ext) {
  list.files(outputdir, pattern = ext, full.names = TRUE)
}))

file.remove(files_to_delete)