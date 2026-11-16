# Start with shiny::runApp() from this repository directory.
library(RTutor)
library(shiny)
library(shinyEvents)
library(haven)
library(dplyr)
library(tibble)
library(ggplot2)
library(lfe)
library(stargazer)
library(fixest)
library(knitr)
library(tidyr)

ps_dir <- normalizePath("inst/ps/TeacherGradingBias", mustWork = TRUE)
# Shiny restores the application directory when executing callbacks.
# Deploy the bundled material there so the unchanged RTutor paths resolve.
work_dir <- normalizePath(".", mustWork = TRUE)
file.copy(list.files(file.path(ps_dir, "material"), full.names = TRUE),
          work_dir, recursive = TRUE, overwrite = TRUE)
stopifnot(file.exists(file.path(work_dir, "racial_discrimination_grading_AEJ.dta")))
app <- RTutor::show.ps(
  ps.name = "TeacherGradingBias", user.name = "Guest",
  dir = work_dir, rps.dir = ps_dir,
  make.web.app = TRUE, make.session.ps = TRUE,
  save.nothing = TRUE, auto.save.code = FALSE,
  sample.solution = FALSE, offline = FALSE,
  launch.browser = FALSE
)
app$verbose <- FALSE
shinyEvents::appReadyToRun(app)
shiny::shinyApp(ui = app$ui, server = app$server)
