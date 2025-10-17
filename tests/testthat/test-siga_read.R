# tests/testthat/test-siga_read.R

library(testthat)
library(rlang)

# Definimos la ruta al archivo de prueba (ESTE DEBE EXISTIR)
ruta_ejemplo <- system.file("extdata", "siga_test.csv", package = "paqueteMeteo")

testthat::test_that("siga_read lee el archivo y devuelve un tibble", {

  # Este test verifica la lectura exitosa
  testthat::expect_true(file.exists(ruta_ejemplo))

  # Ejecutar la funci\u00f3n
  datos_siga <- siga_read(ruta_ejemplo)

  # Comprobaciones
  testthat::expect_s3_class(datos_siga, "data.frame")
  testthat::expect_equal(ncol(datos_siga), 3) # Asume que el archivo de prueba tiene 3 columnas
})

testthat::test_that("siga_read lanza error en validaciones de entrada", {

  # 1. Test de entrada no-string (Cubre stopifnot(is.character(path)))
  testthat::expect_error(
    siga_read(123),
    regexp = "La ruta debe ser un string"
  )

  # 2. Test de archivo inexistente (Cubre if (!file.exists(path)))
  testthat::expect_error(
    siga_read("ruta/que/no/existe.csv"),
    regexp = "El archivo no se encuentra en la ruta especificada"
  )

  # 3. Test de archivo inv\u00e1lido (Cubre el tryCatch que relanza un error amigable)
  writeLines("Esto no es CSV, 1, 2, 3", "archivo_invalido.txt")

  testthat::expect_error(
    siga_read("archivo_invalido.txt"),
    regexp = "Error en la lectura del archivo CSV"
  )

  # Limpiar el archivo de prueba
  if (file.exists("archivo_invalido.txt")) {
    file.remove("archivo_invalido.txt")
  }
})
