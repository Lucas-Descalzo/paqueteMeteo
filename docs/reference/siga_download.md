# Descarga datos meteorológicos de una URL externa

Descarga datos meteorológicos de una URL externa

## Usage

``` r
siga_download(url)
```

## Arguments

- url:

  La URL completa del archivo CSV a descargar.

## Value

Un objeto \`data.frame\` (tibble) con los datos descargados.

## Examples

``` r
if (FALSE) { # \dontrun{
# El ejemplo se incluye solo para fines de documentaci\enc{ó}{o}n.
# Descomentar para probar la descarga real de datos.
url_ejemplo <- "https://ejemplo.com/datos_test.csv"
datos_descargados <- siga_download(url_ejemplo)
head(datos_descargados)
} # }
```
