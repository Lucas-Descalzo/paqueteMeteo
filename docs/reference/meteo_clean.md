# Limpiar y estandarizar columnas

Limpiar y estandarizar columnas

## Usage

``` r
meteo_clean(df)
```

## Arguments

- df:

  Tibble devuelto por \\siga_read()\\ o \\siga_download()\\.

## Value

Tibble con nombres estandarizados (\\fecha\\, \\tmed\\, \\lluvia\\) y
columna \\fecha\\ como Date.

## Examples

``` r
datos_crudos <- data.frame(
  Fecha = "2024-01-01",
  T_MAX_C = 25,
  `lluvia (mm)` = 0
)
meteo_clean(datos_crudos)
#>        fecha tmed lluvia
#> 1 2024-01-01   25      0
```
