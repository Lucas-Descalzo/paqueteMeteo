#' Lee un archivo de datos meteorol\u00f3gicos del sistema SIGA o similar
#'
#' @param path Ruta al archivo CSV.
#' @return Tibble con los datos meteorol\u00f3gicos crudos.
#' @export
siga_read <- function(path) {

  # Validaci\u00f3n 1: Verifica que la entrada sea un string
  stopifnot(
    "La ruta debe ser un string (character)." = is.character(path),
    "El string de la ruta no puede estar vac\u00edo." = nchar(path) > 0
  )

  # Validaci\u00f3n 2: Verifica que el archivo exista
  if (!file.exists(path)) {
    stop("El archivo no se encuentra en la ruta especificada: ", path, call. = FALSE)
  }

  # Leer el CSV (A\u00edsla el error de vroom::vroom con tryCatch)
  datos <- tryCatch({
    df <- readr::read_csv(path, show_col_types = FALSE)

    # Mover la validaci\u00f3n de filas dentro del tryCatch si la lectura fue exitosa
    stopifnot(
      "El data frame est\u00e1 vac\u00edo (0 filas)." = nrow(df) > 0
    )
    return(df)

  }, error = function(e) {
    # Este es el c\u00f3digo que se ejecuta si readr::read_csv falla (por formato o contenido)
    stop("Error en la lectura del archivo CSV. Verifique el formato o la codificaci\u00f3n.", call. = FALSE)
  })

  # El return final ahora es redundante pero lo dejamos para claridad.
  return(datos)
}
