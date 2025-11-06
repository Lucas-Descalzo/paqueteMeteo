# tests/testthat/test-siga_download.R
library(testthat)
library(rlang)

test_that("siga_download valida la entrada como string (no character → error)", {
  expect_error(
    siga_download(12345),
    regexp = "La entrada debe ser una URL de tipo string",
    class = "siga_input_invalido"
  )
})

test_that("siga_download falla con string vacío o espacios", {
  expect_error(
    siga_download(""),
    regexp = "no puede estar vac\u00edo",
    class = "siga_input_vacio"
  )
  expect_error(
    siga_download("   "),
    regexp = "no puede estar vac\u00edo",
    class = "siga_input_vacio"
  )
})

test_that("siga_download valida length == 1 (vector de URLs → error)", {
  expect_error(
    siga_download(c("http://a", "http://b")),
    regexp = "La entrada debe ser una URL de tipo string",
    class = "siga_input_invalido"
  )
})

test_that("siga_download propaga error HTTP con clase y código", {
  # simulamos una response que da error HTTP 500
  with_mocked_bindings(
    GET         = function(url) structure(list(url = url, status_code = 500L), class = "response"),
    http_error  = function(resp) TRUE,
    status_code = function(resp) resp$status_code,
    {
      expect_error(
        siga_download("http://ejemplo.test/falla.csv"),
        regexp = "C\u00f3digo HTTP: 500",
        class  = "siga_descarga_fallida"
      )
    }
  )
})

test_that("siga_download lee CSV correctamente cuando la descarga es exitosa", {
  fake_csv <- "fecha,temp\n2024-01-01,23.5\n"
  with_mocked_bindings(
    GET        = function(url) structure(list(url = url, status_code = 200L), class = "response"),
    http_error = function(resp) FALSE,
    content    = function(resp, as, encoding) fake_csv,
    {
      df <- siga_download("http://ejemplo.test/ok.csv")
      expect_s3_class(df, "data.frame")
      expect_equal(nrow(df), 1L)
      expect_equal(names(df), c("fecha", "temp"))
    }
  )
})
