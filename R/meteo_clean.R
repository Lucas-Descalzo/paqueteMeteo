#' Limpiar y estandarizar columnas
#'
#' @param df Tibble devuelto por \`siga_read()\` o \`siga_download()\`.
#' @return Tibble con nombres estandarizados (\`fecha\`, \`tmed\`, \`lluvia\`) y columna \`fecha\` como Date.
#' @examples
#' datos_crudos <- data.frame(
#'   Fecha = "2024-01-01",
#'   T_MAX_C = 25,
#'   `lluvia (mm)` = 0
#' )
#' meteo_clean(datos_crudos)
#' @export
meteo_clean <- function(df) {

  # Validación 1: Chequeo de input
  if (!inherits(df, "data.frame")) {
    cli::cli_abort("El input debe ser un data frame.", class = "siga_input_invalido")
  }

  # 1. Limpieza básica (janitor)
  df_limpio <- df |>
    janitor::clean_names()

  # 2. Inicializar df_renombrado con df_limpio (para visibilidad)
  df_renombrado <- df_limpio

  # 3. Renombramiento a nombres estándar (tmed, lluvia) - Aislado en tryCatch
  df_renombrado <- tryCatch({
    df_limpio |>
      dplyr::rename(
        tmed = t_max_c,
        lluvia = lluvia_mm
      )
  }, error = function(e) {
    # Si el renombre falla, devolvemos df_limpio.
    # La validación de más abajo se encargará del error.
    return(df_limpio)
  })

  # 4. Mutación (fecha)
  df_final <- df_renombrado |>
    dplyr::mutate(
      fecha = suppressWarnings(lubridate::as_date(.data$fecha))
    )

  # Validación 2: Verifica la existencia de columnas esenciales
  columnas_necesarias <- c("fecha", "tmed", "lluvia")

  if (!all(columnas_necesarias %in% names(df_final))) {
    columnas_faltantes <- setdiff(columnas_necesarias, names(df_final))

    # USO DE CLI:
    cli::cli_abort(
      c("Faltan columnas esenciales despu\u00e9s de la limpieza:",
        "x" = "Columnas requeridas: {.val {columnas_necesarias}}",
        "i" = "Columnas faltantes: {.val {columnas_faltantes}}"),
      class = "columnas_faltantes"
    )
  }

  return(df_final)
}
