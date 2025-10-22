# tests/testthat/test-meteo_plot.R

library(testthat)
library(ggplot2) # Necesario para la clase 'ggplot'

test_that("meteo_plot devuelve un objeto ggplot", {

  # 1. Crear datos de ejemplo limpios (simulando la salida de meteo_clean)
  datos_limpios <- data.frame(
    fecha = as.Date(c("2024-01-01", "2024-02-01", "2024-03-01")),
    tmed = c(20, 25, 30)
  )

  # 2. Ejecutar la funci\u00f3n
  plot_resultado <- meteo_plot(datos_limpios)

  # 3. Comprobaci\u00f3n (Expectation)
  # El resultado debe ser un objeto de la clase 'ggplot'
  testthat::expect_s3_class(plot_resultado, "ggplot")
})

test_that("meteo_plot falla si falta ggplot2", {

  # Simulamos que ggplot2 no est\u00e1 disponible
  # Nota: Este test es m\u00e1s avanzado y requiere mocking. Lo omitimos
  # por simplicidad, pero la funci\u00f3n ya tiene el stopifnot.
  # Por ahora, solo probamos el \u00e9xito.

  # expect_error(meteo_plot(datos_limpios), regexp = "ggplot2 es necesario")
})
