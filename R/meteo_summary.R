#' Resumen basico de la serie
#'
#' @param df Tibble limpio (salida de `meteo_clean()`), con nombres de janitor.
#' @return Tibble con temperatura media y lluvia total.
#' @examples
#' datos_limpios <- data.frame(fecha = as.Date("2024-01-01"), tmed = 20, lluvia = 5)
#' meteo_summary(datos_limpios)
#' @export
meteo_summary <- function(df) {
  df |>
    dplyr::summarise(
      temp_media = mean(.data$tmed, na.rm = TRUE), # Debe ser tmed
      lluvia_total = sum(.data$lluvia, na.rm = TRUE) # Debe ser lluvia
    )
}

#' @examples
#' # Simular datos limpios (salida de meteo_clean)
#' datos_limpios <- data.frame(
#'   tmed = c(20, 25, 30),
#'   lluvia = c(5, 0, 15)
#' )
#'
#' # Generar resumen
#' resumen <- meteo_summary(datos_limpios)
#' print(resumen)
