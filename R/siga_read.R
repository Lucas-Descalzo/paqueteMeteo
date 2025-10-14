#' Leer archivo meteorológico del SIGA
#'
#' @param path Ruta al archivo CSV.
#' @return Tibble con los datos meteorológicos crudos.
#' @export
siga_read <- function(path) {
  readr::read_csv(path, show_col_types = FALSE)
}
