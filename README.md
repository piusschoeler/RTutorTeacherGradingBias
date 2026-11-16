# RTutorTeacherGradingBias

**[Open the interactive problem set in your browser](https://01a1e48a-1639-d5f7-e3ba-cdb0b866665f.share.connect.posit.cloud/)** — no local R installation required.

This repository contains the interactive **TeacherGradingBias** problem set,
developed with [RTutor](https://github.com/skranz/RTutor) as part of a
bachelor's thesis at Ulm University.

The problem set reproduces and explains central parts of the empirical strategy
in Botelho, Madeira, and Rangel (2015),
["Racial Discrimination in Grading: Evidence from Brazil"](https://doi.org/10.1257/app.20140352).
It examines whether Black students in São Paulo public schools receive lower
teacher-assigned mathematics grades than comparable White classmates.

The exercises cover descriptive evidence, classroom fixed effects, proxy
controls, measurement error, instrumental variables, IV diagnostics,
alternative teacher-assigned outcomes, teacher heterogeneity, and repeated
teacher-student interaction.

## 1. Installation

Install `RTutor` from the author's R-universe repository:

```r
options(
  repos = c(
    skranz = "https://skranz.r-universe.dev",
    CRAN = "https://cloud.r-project.org"
  )
)

install.packages("RTutor")
```

Then install this problem-set package from GitHub:

```r
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

remotes::install_github(
  "piusschoeler/RTutorTeacherGradingBias"
)
```

## 2. Start the problem set

Create a working directory in which RTutor can store the data, progress
information, and entered code. Replace `"Jane_Doe"` with your own user name.
The user name should not contain spaces.

```r
library(RTutorTeacherGradingBias)

work.dir <- file.path(
  path.expand("~"),
  "RTutorTeacherGradingBias-work"
)

dir.create(
  work.dir,
  recursive = TRUE,
  showWarnings = FALSE
)

RTutor::run.ps(
  user.name = "Jane_Doe",
  ps.name = "TeacherGradingBias",
  package = "RTutorTeacherGradingBias",
  dir = work.dir,
  auto.save.code = TRUE,
  clear.user = FALSE,
  load.sav = TRUE,
  sample.solution = FALSE
)
```

During the first launch, RTutor may ask in the R console whether the problem-set
materials should be copied to the working directory. Enter `y` to confirm.

To continue an existing session later, use the same `user.name` and
`work.dir`.

## 3. Reference and replication materials

Botelho, Fernando, Ricardo A. Madeira, and Marcos A. Rangel. 2015.
"Racial Discrimination in Grading: Evidence from Brazil."
*American Economic Journal: Applied Economics* 7 (4): 37–52.
[https://doi.org/10.1257/app.20140352](https://doi.org/10.1257/app.20140352)

The original replication materials are available from OpenICPSR:
[https://doi.org/10.3886/E113617V1](https://doi.org/10.3886/E113617V1)

## 4. License

Original R package code authored for this project is licensed under
GPL-2.0-or-later. Original problem-set text, exercises, and instructional
material authored for this project are licensed under CC BY-SA 4.0.

The original replication materials are Copyright © 2015 American Economic
Association. According to the license distributed with those materials,
code and software are provided under the Modified BSD License (BSD-3-Clause),
while databases, images, tables, text, and other objects are provided under
CC BY 4.0.

See the `LICENSE` file and the original license information included with the
replication materials for details.
## 5. Run the Shiny app from this repository

After installing the dependencies listed in DESCRIPTION and the `shinyEvents`
package, open the RStudio project and run:

```r
shiny::runApp(".")
```

`app.R` copies the bundled material into the application directory before
starting RTutor, because Shiny restores that directory for callbacks.
These runtime copies are excluded from Git and the R package build. The dataset is stored in
`inst/ps/TeacherGradingBias/material/racial_discrimination_grading_AEJ.dta`.
The solution intentionally reads the filename without a `data/` prefix because
RTutor deploys the contents of `material/` into its working directory.

## 6. Rebuild after editing the solution

The authoritative source is
`inst/ps/TeacherGradingBias/TeacherGradingBias_sol.Rmd`.
Do not knit this file to deploy the app. From the repository root, run:

```r
source("scripts/rebuild.R")
```

This builds in a temporary directory containing the dataset and updates the
compiled `.rps` and student `.Rmd` files together. All scientific content and
estimation code are retained from the completed thesis project.

The web app does not save guest progress on the server. Use the RTutor download
feature to retain your work. For persistent local progress use the package
startup instructions above.
