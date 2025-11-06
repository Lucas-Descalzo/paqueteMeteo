# tests/testthat/test-meteo_plot.R

library(testthat)
library(ggplot2) # Necesario para la clase 'ggplot'

# --- Test 1: Comprueba la generaci\u00f3n exitosa del gr\u00e1fico ---
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
