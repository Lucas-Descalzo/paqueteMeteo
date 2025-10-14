# tests/testthat/test-meteo_clean.R
library(testthat)
library(dplyr)
library(tibble)

testthat::test_that("meteo_clean estandariza nombres y convierte fechas correctamente", {
  
  # 1. Crear datos de ejemplo con nombres NO estandarizados
  datos_crudos <- tibble::tibble(
    Fecha = c("2024-01-01", "2024-01-02", "2024-01-03"),
    T_max_C = c(30.5, 32.1, 29.8),
    `lluvia (mm)` = c(0, 5, 1.2)
  )
  
  # 2. Ejecutar la funci\u00f3n
  datos_limpios <- meteo_clean(datos_crudos)
  
  # 3. Comprobaciones (Expectations)
  
  # C1. El resultado debe ser un data frame (tibble)
  testthat::expect_s3_class(datos_limpios, "data.frame")
  
  # C2. Los nombres de columna deben estar limpios
  testthat::expect_equal(names(datos_limpios),
                         c("fecha", "t_max_c", "lluvia_mm"))
  
  # C3. La columna 'fecha' debe ser de tipo Date
  testthat::expect_s3_class(datos_limpios$fecha, "Date") 
  
  # C4. Comprueba que la conversi\u00f3n de fecha haya funcionado
  testthat::expect_equal(datos_limpios$fecha[[1]], as.Date("2024-01-01"))
})