# Resumen basico de la serie

Resumen basico de la serie

## Usage

``` r
meteo_summary(df)
```

## Arguments

- df:

  Tibble limpio (salida de \`meteo_clean()\`), con nombres de janitor.

## Value

Tibble con temperatura media y lluvia total.

## Examples

``` r
datos_limpios <- data.frame(fecha = as.Date("2024-01-01"), tmed = 20, lluvia = 5)
meteo_summary(datos_limpios)
#>   temp_media lluvia_total
#> 1         20            5
```
