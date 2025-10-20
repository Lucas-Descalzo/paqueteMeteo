#' Resumen basico de la serie
#'
#' @param df Tibble limpio (salida de `meteo_clean()`), con nombres de janitor.
#' @return Tibble con temperatura media y lluvia total.
#' @export
meteo_summary <- function(df) {
  df |>
    dplyr::summarise(
      temp_media = mean(.data$tmed, na.rm = TRUE), # Debe ser tmed
      lluvia_total = sum(.data$lluvia, na.rm = TRUE) # Debe ser lluvia
    )
}
