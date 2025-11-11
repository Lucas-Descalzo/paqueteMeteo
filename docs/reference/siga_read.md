# Lee un archivo de datos meteorológicos del sistema SIGA o similar

Lee un archivo de datos meteorológicos del sistema SIGA o similar

## Usage

``` r
siga_read(path)
```

## Arguments

- path:

  Ruta al archivo CSV.

## Value

Tibble con los datos meteorológicos crudos.

## Examples

``` r
if (FALSE) { # \dontrun{
# Necesita un archivo real
ruta_prueba <- system.file("extdata", "siga_test.csv", package = "paqueteMeteo")
if (file.exists(ruta_prueba)) {
  datos <- siga_read(ruta_prueba)
  print(head(datos))
}
} # }
```
