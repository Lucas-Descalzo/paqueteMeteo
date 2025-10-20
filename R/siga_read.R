#' Lee un archivo de datos meteorol\enc{ó}{o}gicos del sistema SIGA o similar
#'
#' @param path Ruta al archivo CSV.
#' @return Tibble con los datos meteorol\enc{ó}{o}gicos crudos.
#' @examples
#' \dontrun{
#' # Los datos de prueba se incluyen en el paquete para el chequeo:
#' ruta_prueba <- system.file("extdata", "siga_test.csv", package = "paqueteMeteo")
#'
#' # Verifica si el archivo existe antes de intentar leer (si no, fallar\u00eda en el check)
#' if (file.exists(ruta_prueba)) {
#'   datos <- siga_read(ruta_prueba)
#'   print(head(datos))
#' }
#' }
#' @export
siga_read <- function(path) {

  # Validaci\u00f3n 1: Verifica que la entrada sea un string
  stopifnot(
    "La ruta debe ser un string (character)." = is.character(path),
    "El string de la ruta no puede estar vac\u00edo." = nchar(path) > 0
  )

  # Validaci\u00f3n 2: Verifica que el archivo exista
  if (!file.exists(path)) {
    # El mensaje de error ya usa \u00f3 en "n\u00f3" y \u00e9 en "especificada"
    stop("El archivo no se encuentra en la ruta especificada: ", path, call. = FALSE)
  }

  # Leer el CSV (A\u00edsla el error de vroom::vroom con tryCatch)
  datos <- tryCatch({
    df <- readr::read_csv(path, show_col_types = FALSE)

    # Mover la validaci\u00f3n de filas dentro del tryCatch si la lectura fue exitosa
    stopifnot(
      # El mensaje de error ya usa \u00ed y \u00ed en "vac\u00edo"
      "El data frame est\u00e1 vac\u00edo (0 filas)." = nrow(df) > 0
    )
    return(df)

  }, error = function(e) {
    # Este es el c\u00f3digo que se ejecuta si readr::read_csv falla (por formato o contenido)
    # El mensaje de error ya usa \u00f3 en "codificaci\u00f3n"
    stop("Error en la lectura del archivo CSV. Verifique el formato o la codificaci\u00f3n.", call. = FALSE)
  })

  # El return final ahora es redundante pero lo dejamos para claridad.
  return(datos)
}
