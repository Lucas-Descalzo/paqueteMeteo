# tests/testthat/test-meteo_summary.R
library(testthat)
library(tibble)
library(dplyr)

testthat::test_that("meteo_summary calcula media y suma correctamente", {

  # 1. Crear datos de ejemplo limpios (simulando la salida de meteo_clean)
  datos_limpios <- tibble::tibble(
    fecha = as.Date(c("2024-01-01", "2024-01-02", "2024-01-03", "2024-01-04")),
    tmed = c(20, 25, NA, 30), # Incluimos un NA para probar na.rm = TRUE
    lluvia = c(10, 5, 0, 15)
  )

  # 2. Ejecutar la funci\u00f3n
  resumen <- meteo_summary(datos_limpios)

  # 3. Comprobaciones (Expectations)

  # C1. El resultado debe ser un tibble con 1 fila
  testthat::expect_s3_class(resumen, "data.frame")
  testthat::expect_equal(nrow(resumen), 1)

  # C2. La media de temperatura debe ser 25 (el NA se ignora por na.rm=TRUE)
  testthat::expect_equal(resumen$temp_media, 25)

  # C3. La suma de la lluvia debe ser 30
  testthat::expect_equal(resumen$lluvia_total, 30)
})
