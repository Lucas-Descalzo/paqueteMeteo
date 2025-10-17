# R/utils.R

# Resuelve la nota de 'no visible binding for global variable' al usar dplyr
# Lista TODAS las columnas que se utilizan en las funciones (meteo_summary)
# sin el prefijo del data frame.
utils::globalVariables(c(
  ".",       # Operador 'pipe' de magrittr/dplyr
  ".data",   # S\u00edmbolo de rlang para el binding
  "fecha",   # Usado en meteo_clean
  "t_max_c", # Nuevo nombre estandarizado de la temperatura (despu\u00e9s de janitor)
  "lluvia_mm" # Nuevo nombre estandarizado de la lluvia (despu\u00e9s de janitor)
))
