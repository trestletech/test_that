#' Expectation class.
#'
#' Any expectation should return objects of this class - see the built in
#' expectations for details.
#'
#' @aliases expectation print.expectation format.expectation
#' @keywords internal
#' @export
#' @S3method print expectation
#' @S3method format expectation
expectation <- function(passed, message) {
  error <- is.na(passed)
  passed <- passed & !is.na(passed)

  structure(
    list(passed = passed, error = error, message = message),
    class = "expectation"
  )
}

print.expectation <- function(x, ...) cat(format(x), "\n")
format.expectation <- function(x, ...) {
  if (x$passed) {
    "As expected."
  } else {
    str_c("Not expected: ", x$message, ".")
  }
}

