#' Grafico de tendencia de temperatura media
#'
#' Esta funcion crea un grafico de linea para visualizar la tendencia
#' de la temperatura media (`tmed`) a lo largo del tiempo (`fecha`).
#'
#' @param df Un data frame limpio (salida de `meteo_clean`) con columnas `fecha` y `tmed`.
#' @return Un objeto ggplot para su visualizacion.
#' @examples
#' \dontrun{
#' # Simular datos limpios
#' datos_limpios <- data.frame(
#'   fecha = as.Date(c("2024-01-01", "2024-02-01", "2024-03-01")),
#'   tmed = c(20, 25, 30)
#' )
#' meteo_plot(datos_limpios)
#' }
#' @export
meteo_plot <- function(df) {

  # Validacion: Asegura que ggplot2 este instalado
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("El paquete ggplot2 es necesario para esta funcion.", call. = FALSE)
  }

  # Logica de graficado
  p <- df |>
    ggplot2::ggplot(ggplot2::aes(x = fecha, y = tmed)) +
    ggplot2::geom_line(color = "#377eb8") +
    ggplot2::geom_point(color = "#377eb8") +
    ggplot2::labs(title = "Tendencia de Temperatura Media",
                  y = "Temperatura (C)", # Etiqueta y-axis limpia
                  x = "Fecha") +
    ggplot2::theme_minimal()

  return(p)
}
