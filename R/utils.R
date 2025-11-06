# R/utils.R

# Resuelve la nota de 'no visible binding for global variable' al usar dplyr
# Lista TODAS las columnas que se utilizan en las funciones (meteo_summary)
# sin el prefijo del data frame.
utils::globalVariables(c(
  ".",       # Operador 'pipe' de magrittr/dplyr
  ".data",   # Símbolo de rlang para el binding
  "fecha",   # Usado en meteo_clean
  "t_max_c", # Nombre intermedio después de janitor
  "lluvia_mm", # Nombre intermedio después de janitor
  "tmed",    # Nombre final usado en meteo_summary y meteo_plot
  "lluvia"   # Nombre final usado en meteo_summary
))
