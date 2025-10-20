#' Limpiar y estandarizar columnas
#'
#' @param df Tibble devuelto por \`siga_read()\` o \`siga_download()\`.
#' @return Tibble con nombres estandarizados (\`fecha\`, \`tmed\`, \`lluvia\`) y columna \`fecha\` como Date.
#' @export
meteo_clean <- function(df) {

  # Validaci\u00f3n 1: Chequeo de input
  stopifnot("El input debe ser un data frame." = inherits(df, "data.frame"))

  # 1. Limpieza b\u00e1sica (janitor)
  df_limpio <- df |>
    janitor::clean_names()

  # 2. Inicializar df_renombrado con df_limpio (para visibilidad)
  df_renombrado <- df_limpio

  # 3. Renombramiento a nombres est\u00e1ndar (tmed, lluvia) - Aislado en tryCatch
  # Si falla el renombre, df_renombrado mantendr\u00e1 el valor de df_limpio,
  # y la validaci\u00f3n de columnas fallar\u00e1 limpiamente con cli.
  df_renombrado <- tryCatch({
    df_limpio |>
      dplyr::rename(
        tmed = t_max_c,
        lluvia = lluvia_mm
      )
  }, error = function(e) {
    # Retornamos df_limpio si el rename falla (porque faltan columnas)
    return(df_limpio)
  })

  # 4. Mutaci\u00f3n (fecha)
  df_final <- df_renombrado |>
    dplyr::mutate(
      fecha = suppressWarnings(lubridate::as_date(.data$fecha))
    )

  # Validaci\u00f3n 2: Verifica la existencia de columnas esenciales (Punto 15)
  columnas_necesarias <- c("fecha", "tmed", "lluvia")

  if (!all(columnas_necesarias %in% names(df_final))) {
    columnas_faltantes <- setdiff(columnas_necesarias, names(df_final))

    # USO DE CLI: Mensaje de la materia
    cli::cli_abort(
      c("Faltan columnas esenciales despu\u00e9s de la limpieza:",
        "x" = "Columnas requeridas: {.val {columnas_necesarias}}",
        "i" = "Columnas faltantes: {.val {columnas_faltantes}}"),
      class = "columnas_faltantes"
    )
  }

  return(df_final)
}
