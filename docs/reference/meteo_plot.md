# Grafico de tendencia de temperatura media

Esta funcion crea un grafico de linea para visualizar la tendencia de la
temperatura media (\`tmed\`) a lo largo del tiempo (\`fecha\`).

## Usage

``` r
meteo_plot(df)
```

## Arguments

- df:

  Un data frame limpio (salida de \`meteo_clean\`) con columnas
  \`fecha\` y \`tmed\`.

## Value

Un objeto ggplot para su visualizacion.

## Examples

``` r
if (FALSE) { # \dontrun{
# Simular datos limpios
datos_limpios <- data.frame(
  fecha = as.Date(c("2024-01-01", "2024-02-01", "2024-03-01")),
  tmed = c(20, 25, 30)
)
meteo_plot(datos_limpios)
} # }
```
