#' Descarga datos meteorol\enc{ó}{o}gicos de una URL externa
#'
#' Esta funci\enc{ó}{o}n realiza una petici\enc{ó}{o}n HTTP a una URL y lee el contenido
#' como un archivo CSV directamente en R, manejando errores de conexi\enc{ó}{o}n.
#'
#' @param url La URL completa del archivo CSV a descargar.
#' @return Un objeto `data.frame` (tibble) con los datos descargados.
#' @examples
#' \dontrun{
#' # Ejemplo simulado:
#' # datos <- siga_download("http://siga.inta.gob.ar/datos/estacion123.csv")
#' # head(datos)
#' }
#' @export
siga_download <- function(url) {

  # 1. Validaci\u00f3n b\u00e1sica del input
  stopifnot("La entrada debe ser una URL de tipo string (character)." = is.character(url))

  # 2. Realizar la petici\u00f3n HTTP
  respuesta <- httr::GET(url)

  # 3. Manejo de errores HTTP (Punto 15: Manejo de errores)
  if (httr::http_error(respuesta)) {
    rlang::abort(
      class = "siga_descarga_fallida",
      # Se corrige la \u00f3 en C\u00f3digo con su c\u00f3digo Unicode \u00f3
      message = paste0("Error al descargar datos. C\u00f3digo HTTP: ", httr::status_code(respuesta)),
      url = url
    )
  }

  # 4. Leer el contenido directamente
  contenido <- httr::content(respuesta, "text", encoding = "UTF-8")
  datos <- readr::read_csv(contenido, show_col_types = FALSE)

  return(datos)
}
