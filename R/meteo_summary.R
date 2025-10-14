#' Resumen básico de la serie
#'
#' @param df Tibble limpio (salida de `meteo_clean()`), con `tmed` y `lluvia`.
#' @return Tibble con temperatura media y lluvia total.
#' @export
meteo_summary <- function(df) {
  df |>
    dplyr::summarise(
      temp_media   = mean(.data$tmed,   na.rm = TRUE),
      lluvia_total = sum(.data$lluvia,  na.rm = TRUE)
    )
}
