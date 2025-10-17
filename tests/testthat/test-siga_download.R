# tests/testthat/test-siga_download.R

library(testthat)
library(httr)
library(rlang)

testthat::test_that("siga_download valida la entrada URL", {

  # 1. Test de input no-string (Cubre la validaci\u00f3n stopifnot)
  # Este test DEBE pasar y ejecuta una l\u00ednea de c\u00f3digo no cubierta.
  testthat::expect_error(
    siga_download(12345),
    regexp = "La entrada debe ser una URL de tipo string"
  )
})
