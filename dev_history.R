usethis::use_build_ignore("dev_history.R")
usethis::use_build_ignore("data.qualitative.Rproj")

# Document functions and dependencies
attachment::att_to_description()
# Check the package
devtools::check()

data("Legumes_19012020.xlsx")

metadata_quali <-readxl::read_excel("Metadata_quali.xlsx")

usethis::use_vignette("aa_qualitative")
usethis::use_r("read_plants.R")

usethis::use_r("data.R")
usethis::use_r("metadata_quali.R")
usethis::use_pipe()
devtools::document()
