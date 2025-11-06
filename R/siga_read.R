#' Lee un archivo de datos meteorol\enc{ó}{o}gicos del sistema SIGA o similar
#'
#' @param path Ruta al archivo CSV.
#' @return Tibble con los datos meteorol\enc{ó}{o}gicos crudos.
#' @examples
#' \dontrun{
#' # Necesita un archivo real
#' ruta_prueba <- system.file("extdata", "siga_test.csv", package = "paqueteMeteo")
#' if (file.exists(ruta_prueba)) {
#'   datos <- siga_read(ruta_prueba)
#'   print(head(datos))
#' }
#' }
#' @export
siga_read <- function(path) {

  # Validación 1: Verifica que la entrada sea un string
  if (!is.character(path) || length(path) != 1L) {
    cli::cli_abort("La ruta debe ser un string (character).", class = "siga_input_invalido")
  }
  if (identical(trimws(path), "")) {
    cli::cli_abort("El string de la ruta no puede estar vac\u00edo.", class = "siga_input_vacio")
  }

  # Validación 2: Verifica que el archivo exista
  if (!file.exists(path)) {
    cli::cli_abort(
      "El archivo no se encuentra en la ruta especificada: {.file {path}}",
      class = "siga_archivo_no_encontrado"
    )
  }

  # Leer el CSV (Aísla el error de vroom::vroom con tryCatch)
  datos <- tryCatch({
    df <- readr::read_csv(path, show_col_types = FALSE)

    if (nrow(df) == 0) {
      cli::cli_abort("El data frame est\u00e1 vac\u00edo (0 filas).", class = "siga_archivo_vacio")
    }
    return(df)

  }, error = function(e) {
    # Manejo de error de formato/lectura
    cli::cli_abort(
      c("Error en la lectura del archivo CSV. Verifique el formato o la codificaci\u00f3n.",
        "i" = "Error original: {e$message}"),
      class = "siga_error_lectura",
      parent = e
    )
  })

  return(datos)
}
