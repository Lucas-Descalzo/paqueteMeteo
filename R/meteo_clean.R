#' Limpiar y estandarizar columnas
#'
#' @param df Tibble devuelto por `siga_read()`.
#' @return Tibble con nombres estandarizados y columna `fecha` como Date (si existe).
#' @export
meteo_clean <- function(df) {
  df |>
    janitor::clean_names() |>
    dplyr::mutate(
      fecha = suppressWarnings(lubridate::as_date(.data$fecha))
    )
}
