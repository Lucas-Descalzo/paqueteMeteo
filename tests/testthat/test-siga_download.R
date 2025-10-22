# tests/testthat/test-siga_download.R

library(testthat)
library(httr)
library(rlang)

testthat::test_that("siga_download valida la entrada como string", {

  # Este test cubre la l\u00ednea stopifnot(is.character(url)) sin activar a curl
  testthat::expect_error(
    siga_download(12345),
    regexp = "La entrada debe ser una URL de tipo string"
  )
})
