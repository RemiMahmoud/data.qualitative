#' read_metadata_quali
#'
#' @return nothing
#' @importFrom readxl read_excel
#' @importFrom readxl excel_sheets
#' @importFrom usethis use_data
#' @importFrom purrr map
#' @importFrom rlang set_names
#' @importFrom magrittr %>%

#'
#' @export
#'
#' @description read data metadata_quali and allows you to obtain the scales of each variable
read_metadata_quali<- function(){
  path_metadata_quali <- list.files(system.file("extdata/",
                                         package = "qualitative.data"),
                             pattern = "Metadata_quali.xlsx",
                             full.names = TRUE)
  metadata_quali <- excel_sheets(path_metadata_quali) %>%
    rlang::set_names() %>%
    purrr::map(.f=read_excel, path = path_metadata_quali)

  usethis::use_data(metadata_quali, overwrite = TRUE)

}



# read_all_sheets <-  readxl::excel_sheets(path_metadata_quali) %>%
#   rlang::set_names(path_metadata_quali) %>%
#   purrr::map(path_metadata_quali, path = read_metadata_quali)
#
#
# path<-"Metadata_quali.xlsx"
# read_all_sheets <- function(path){
#   excel_sheets(path) %>%
#     set_names() %>%
#     purrr::map(read_excel, path = path)
# }
# data_raw_cereals <- read_all_sheets(path = "Metadata_quali.xlsx")
