# Run from the repository root: source("scripts/rebuild.R")
# Build in a temporary directory; the solution source stays unchanged.
local({
  library(RTutor)
  root <- normalizePath(".")
  ps_dir <- file.path(root, "inst/ps/TeacherGradingBias")
  old <- getwd()
  build <- tempfile("TeacherGradingBias-build-")
  dir.create(build)
  on.exit(setwd(old), add = TRUE)
  file.copy(file.path(ps_dir, "TeacherGradingBias_sol.Rmd"), build)
  file.copy(list.files(file.path(ps_dir,"material"),full.names=TRUE),
            build, recursive=TRUE)
  setwd(build)
  RTutor::create.ps(sol.file="TeacherGradingBias_sol.Rmd",
    ps.name="TeacherGradingBias",user.name=NULL,
    libs=c("haven","dplyr","tibble","ggplot2","lfe","stargazer",
           "fixest","knitr","tidyr"),addons="quiz")
  files <- c("TeacherGradingBias.rps","TeacherGradingBias.Rmd")
  stopifnot(all(file.copy(files,ps_dir,overwrite=TRUE)))
  message("Rebuilt .rps and student .Rmd successfully.")
})
