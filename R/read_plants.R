

#' read_plants
#'
#' @return nothing
#' @importFrom readxl read_excel
#' @importFrom dplyr mutate across
#' @importFrom tidyselect vars_select_helpers
#' @importFrom usethis use_data
#' @importFrom magrittr %>%
#' @importFrom stringr str_replace_all
#' 
#' @export
#' @description read data legumes and cereals and transform numeric columns in factor

read_plants<- function(){
  path_legumes <- list.files(system.file("extdata/",
                                         package = "data.qualitative"),
                             pattern = "Legumes_19012020.xlsx",
                             full.names = TRUE)

  legumes <-readxl::read_excel(path_legumes) %>%
    mutate(across(vars_select_helpers$where(is.numeric), as.factor))

  path_cereals <- list.files(system.file("extdata/",
                                         package = "data.qualitative"),
                             pattern = "cereales_25012020.xlsx",
                             full.names = TRUE)

  cereals <-readxl::read_excel(path_cereals) %>%
    mutate(across(vars_select_helpers$where(is.numeric), as.factor)) %>% 
    mutate(species = 
             stringr::str_replace_all(species,
                                              c("soft_wheat" = "wheat_aestivum",
                                                "durum_wheat" = "wheat_turgidum")))
  
  usethis::use_data(legumes, overwrite = TRUE)
  usethis::use_data(cereals, overwrite = TRUE)
}




