#' Descarga datos meteorol\enc{ó}{o}gicos de una URL externa
#'
#' @param url La URL completa del archivo CSV a descargar.
#' @return Un objeto `data.frame` (tibble) con los datos descargados.
#' @export
#' @importFrom httr GET http_error status_code content
siga_download <- function(url) {

  # 1. Validación básica del input
  if (!is.character(url) || length(url) != 1L) {
    cli::cli_abort("La entrada debe ser una URL de tipo string (character).", class = "siga_input_invalido")
  }
  if (identical(trimws(url), "")) {
    cli::cli_abort("El string de la ruta no puede estar vac\u00edo.", class = "siga_input_vacio")
  }

  # 2. Realizar la petición HTTP
  respuesta <- GET(url)

  # 3. Manejo de errores HTTP
  if (http_error(respuesta)) {
    cli::cli_abort(
      c("Error al descargar datos.",
        "x" = "C\u00f3digo HTTP: {status_code(respuesta)}",
        "i" = "URL: {url}"),
      class = "siga_descarga_fallida"
    )
  }

  # 4. Leer el contenido directamente
  contenido <- content(respuesta, "text", encoding = "UTF-8")
  datos <- readr::read_csv(contenido, show_col_types = FALSE)

  return(datos)
}
