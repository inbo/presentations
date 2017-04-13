root <- getwd()
if (!file_test("-d", "output")) {
  dir.create("output")
}
files <- list.files("source", pattern = "\\.Rmd$", recursive = TRUE, full.names = TRUE)
for (file in files){
  setwd(dirname(file))
  output <- rmarkdown::render(basename(file))
  file.rename(output, paste0(root, "/output/", basename(output)))
  setwd(root)
}
