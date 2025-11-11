# Reporte

## General

El paquete se instala correctamente ✅

## Description

**paqueteMeteo v0.1.0**

- Título: Análisis de Datos Meteorológicos del SIGA \#Sistema de info. y
  gestion agroclimatica
- Descripción: Este paquete permite leer, limpiar, resumir y analizar
  datos meteorológicos provenientes del sistema SIGA (INTA). Incluye
  funciones para importar archivos CSV, estandarizar nombres de columnas
  y generar resúmenes básicos de temperatura y precipitación.
- Mantainer: Lucas Descalzo <ldescalzo@mail.austral.edu.ar>
- Issues: <https://github.com/Lucas-Descalzo/paqueteMeteo/issues>

### Autores

| x              |
|:---------------|
| Lucas Descalzo |

| x         |
|:----------|
| aut - cre |

### Licencia

MIT + file LICENSE La licencia es válida ✅

## Codigo

Detalles: \|file_name \|fn_name \|exported \| param_nchars_md\|
param_nchars_mn\| num_doclines\|
\|:—————–\|:————-\|:——–\|—————:\|—————:\|————:\| \|R/meteo_clean.R
\|meteo_clean \|TRUE \| 58\| 58\| 11\| \|R/meteo_plot.R \|meteo_plot
\|TRUE \| 77\| 77\| 16\| \|R/meteo_summary.R \|meteo_summary \|TRUE \|
66\| 66\| 7\| \|R/siga_download.R \|siga_download \|TRUE \| 44\| 44\|
13\| \|R/siga_read.R \|siga_read \|TRUE \| 20\| 20\| 13\|

### Dependencias

| type     | package   | version   |
|:---------|:----------|:----------|
| Depends  | R         | \>= 4.1   |
| Imports  | readr     | \*        |
| Imports  | dplyr     | \*        |
| Imports  | lubridate | \*        |
| Imports  | janitor   | \*        |
| Imports  | httr      | \*        |
| Imports  | cli       | \*        |
| Suggests | ggplot2   | \*        |
| Suggests | knitr     | \*        |
| Suggests | rlang     | \*        |
| Suggests | rmarkdown | \*        |
| Suggests | testthat  | \>= 3.0.0 |
| Suggests | tibble    | \*        |

No importa paquetes enteros ✅

## Documentacion

### Ejemplos

|      | file            | title                                                            | tiene_ejemplo | ejemplos | mensajes     |
|:-----|:----------------|:-----------------------------------------------------------------|:--------------|:---------|:-------------|
| init | meteo_clean.R   | Limpiar y estandarizar columnas                                  | TRUE          |          | NA           |
|      | meteo_plot.R    | Grafico de tendencia de temperatura media                        | TRUE          |          | NA           |
|      | meteo_summary.R | Resumen basico de la serie                                       | TRUE          |          | NA           |
|      | siga_download.R | Descarga datos meteorolgicos de una URL externa                  | TRUE          |          | NA           |
|      | siga_read.R     | Lee un archivo de datos meteorolgicos del sistema SIGA o similar | TRUE          |          | NA           |
|      | utils.R         | roxygen2 no puede parsear el archivo                             | NA            |          | character(0) |

### Vi༞tas

Cantidad de vi༞tas: 1 La vi༞ta corre correctamente ✅

## Rcmdchecks

── R CMD check results
──────────────────────────────────────────────────────────────────────────────────────────────────────
paqueteMeteo 0.1.0 ──── Duration: 25.1s

❯ checking PDF version of manual without index … ERROR Re-running with
no redirection of stdout/stderr. Hmm … looks like a package Converting
parsed Rd’s to LaTeX Creating pdf output from LaTeX … Error in
texi2dvi(file = file, pdf = TRUE, clean = clean, quiet = quiet, :
pdflatex is not available Error in texi2dvi(file = file, pdf = TRUE,
clean = clean, quiet = quiet, : pdflatex is not available Error in
running tools::texi2pdf() You may want to clean up by ‘rm -Rf
C:/Users/lucas/AppData/Local/Temp/RtmpknK6eO/Rd2pdf270612f48d8’

❯ checking PDF version of manual … WARNING LaTeX errors when creating
PDF version. This typically indicates Rd problems.

1 error ✖ \| 1 warning ✖ \| 0 notes ✔

## Covr

Covertura global: 96.39 % **Funciones:** meteo_plot: 90.91 % siga_read:
91.67 % meteo_clean: 100 % meteo_summary: 100 % siga_download: 100 %

## Ci

Badges:
[![R-CMD-check.yaml](https://github.com/Lucas-Descalzo/paqueteMeteo/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Lucas-Descalzo/paqueteMeteo/actions)

### GitHub Actions

|          id | name                       | conclusion | sha    | run_number | date       |
|------------:|:---------------------------|:-----------|:-------|-----------:|:-----------|
| 19187048062 | pages build and deployment | success    | 053ded |          1 | 2025-11-08 |
| 19240159978 | R-CMD-check.yaml           | success    | 59c489 |         31 | 2025-11-10 |
| 19240159754 | test-coverage.yaml         | success    | 59c489 |         13 | 2025-11-10 |

## Git

Número de autores de commits: 1 Número de commits: 38

## Extras

Usan TRUE o FALSE ✅ Estructura de archivos correcta ✅
