# R/utils.R

# Resuelve la nota de 'no visible binding for global variable' al usar dplyr
# y los nombres de columnas sin prefijo.
utils::globalVariables(c(
  ".",       # Operador 'pipe' de magrittr/dplyr
  ".data",   # S\u00edmbolo de rlang para el binding
  "fecha",   # Usado en meteo_clean
  "tmed",    # Usado en meteo_summary
  "lluvia"   # Usado en meteo_summary
))