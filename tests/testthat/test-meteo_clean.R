# tests/testthat/test-meteo_clean.R
library(testthat)
library(dplyr)
library(tibble)

testthat::test_that("meteo_clean estandariza nombres y convierte fechas correctamente", {

  # 1. Crear datos de ejemplo con nombres NO estandarizados (simulando datos crudos)
  datos_crudos <- tibble::tibble(
    Fecha = c("2024-01-01", "2024-01-02", "2024-01-03"),
    T_MAX_C = c(30.5, 32.1, 29.8),
    `lluvia (mm)` = c(0, 5, 1.2)
  )

  # 2. Ejecutar la funci\u00f3n
  datos_limpios <- meteo_clean(datos_crudos)

  # 3. Comprobaciones (Expectations)

  # C1. El resultado debe ser un data frame (tibble)
  testthat::expect_s3_class(datos_limpios, "data.frame")

  # C2. Los nombres de columna deben estar estandarizados a 'tmed' y 'lluvia'
  testthat::expect_equal(names(datos_limpios),
                         c("fecha", "tmed", "lluvia")) # <-- CORRECCI\u00d3N

  # C3. La columna 'fecha' debe ser de tipo Date
  testthat::expect_s3_class(datos_limpios$fecha, "Date")

  # C4. Comprobamos la columna renombrada a 'tmed'
  testthat::expect_equal(datos_limpios$tmed, c(30.5, 32.1, 29.8)) # <-- CORRECCI\u00d3N de la columna
})

testthat::test_that("meteo_clean lanza error si faltan columnas criticas", {

  # 1. Crear datos que fallen la validaci\u00f3n (Falta la columna que ser\u00eda T_MAX_C/tmed)
  datos_incompletos <- tibble::tibble(
    Fecha = c("2024-01-01"),
    'lluvia (mm)' = c(0)
  )

  # 2. Esperamos que la funci\u00f3n lance el error de columnas faltantes (Punto 16)
  testthat::expect_error(
    meteo_clean(datos_incompletos),
    class = "columnas_faltantes"
  )
})
