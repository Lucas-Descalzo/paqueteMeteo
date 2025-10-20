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

  # 2. Renombramiento a nombres est\u00e1ndar (tmed, lluvia)
  # Usamos tryCatch para manejar si las columnas no est\u00e1n despu\u00e9s de la limpieza
  df_renombrado <- tryCatch({
    df_limpio |>
      dplyr::rename(
        tmed = t_max_c,
        lluvia = lluvia_mm
      )
  }, error = function(e) {
    # Si falla el renombrado, es porque faltan las columnas originales,
    # y la validaci\u00f3n m\u00e1s abajo lo atrapar\u00e1.
    return(df_limpio)
  })

  # 3. Mutaci\u00f3n (fecha)
  df_final <- df_renombrado |>
    dplyr::mutate(
      fecha = suppressWarnings(lubridate::as_date(.data$fecha))
    )

  # Validaci\u00f3n 2: Verifica la existencia de columnas esenciales (Punto 15)
  columnas_necesarias <- c("fecha", "tmed", "lluvia")

  if (!all(columnas_necesarias %in% names(df_final))) {
    rlang::abort(
      class = "columnas_faltantes",
      # El c\u00f3digo ya utiliza el c\u00f3digo Unicode \u00e9 en 'despu\u00e9s'
      message = paste0("Faltan columnas esenciales despu\u00e9s de la limpieza: ",
                       paste(setdiff(columnas_necesarias, names(df_final)), collapse = ", "))
    )
  }

  return(df_final)
}
