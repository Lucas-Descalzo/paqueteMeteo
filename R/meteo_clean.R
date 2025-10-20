# R/meteo_clean.R

# ... (código anterior)

#' @export
meteo_clean <- function(df) {

  # Validaci\u00f3n 1: Chequeo de input
  stopifnot("El input debe ser un data frame." = inherits(df, "data.frame"))

  # 1. Limpieza b\u00e1sica (janitor)
  df_limpio <- df |>
    janitor::clean_names()

  # 2. Renombramiento a nombres est\u00e1ndar (tmed, lluvia) - Aislado para evitar fallo
  df_renombrado <- tryCatch({
    df_limpio |>
      dplyr::rename(
        tmed = t_max_c,
        lluvia = lluvia_mm
      )
  }, error = function(e) {
    # Si el renombre falla, devolvemos el df_limpio original.
    # El if (columnas_faltantes) m\u00e1s abajo se encargar\u00e1 de lanzar el error correcto (cli::cli_abort)
    return(df_limpio)
  })

  # 3. Mutaci\u00f3n (fecha)
  df_final <- df_renombrado |> # Usamos df_renombrado
    dplyr::mutate(
      fecha = suppressWarnings(lubridate::as_date(.data$fecha))
    )

  # Validaci\u00f3n 2: Verifica la existencia de columnas esenciales (Punto 15)
  columnas_necesarias <- c("fecha", "tmed", "lluvia")

  # ... (El resto de la validaci\u00f3n con cli::cli_abort se mantiene igual)

  return(df_final)
}
