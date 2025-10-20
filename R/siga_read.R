# R/siga_read.R

#' Lee un archivo de datos meteorol\enc{ó}{o}gicos del sistema SIGA o similar
#'
#' @param path Ruta al archivo CSV.
#' @return Tibble con los datos meteorol\enc{ó}{o}gicos crudos.
#' @export
siga_read <- function(path) {

  # Validaci\u00f3n 1: Verifica que la entrada sea un string
  stopifnot(
    "La ruta debe ser un string (character)." = is.character(path),
    "El string de la ruta no puede estar vac\u00edo." = nchar(path) > 0
  )

  # Validaci\u00f3n 2: Verifica que el archivo exista
  if (!file.exists(path)) {
    # USO DE CLI: Usamos cli::cli_abort para el mensaje de error de archivo no encontrado
    cli::cli_abort(
      "El archivo no se encuentra en la ruta especificada: {.file {path}}",
      class = "siga_archivo_no_encontrado"
    )
  }

  # Leer el CSV (A\u00edsla el error de vroom::vroom con tryCatch)
  datos <- tryCatch({
    df <- readr::read_csv(path, show_col_types = FALSE)

    # Validaci\u00f3n 3: Verifica que el objeto le\u00eddo no est\u00e9 vac\u00edo
    if (nrow(df) == 0) {
      cli::cli_abort("El data frame le\u00eddo est\u00e1 vac\u00edo (0 filas).",
                     class = "siga_archivo_vacio")
    }
    return(df)

  }, error = function(e) {
    # USO DE CLI: Manejo de error de formato/lectura
    cli::cli_abort("Error en la lectura del archivo CSV. Verifique el formato o la codificaci\u00f3n.",
                   class = "siga_error_lectura")
  })

  return(datos)
}
