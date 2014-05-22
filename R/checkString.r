#' Check if an argument is a string
#'
#' A string a character vector of length 1.
#'
#' @templateVar fn String
#' @template na-handling
#' @template checker
#' @param na.ok [\code{logical(1)}]\cr
#'  Are missing values allowed? Default is \code{FALSE}.
#' @param ... [ANY]\cr
#'  Additional parameters used in a call of \code{\link{checkCharacter}}.
#' @export
#' @examples
#'  test("a", "string")
#'  test(letters, "string")
checkString = function(x, na.ok = FALSE, ...) {
  qassert(na.ok, "B1")
  if (length(x) != 1L)
    return("Must have length 1")
  if (is.na(x))
    return(ifelse(na.ok, TRUE, "May not be NA"))
  if (!is.character(x))
    return("Must be a character")
  checkCharacterProps(x, ...)
}

#' @rdname checkString
#' @export
assertString = function(x, na.ok = FALSE, ..., .var.name) {
  makeAssertion(checkString(x, na.ok, ...), vname(x, .var.name))
}

#' @rdname checkString
#' @export
testString = function(x, na.ok = FALSE, ...) {
  isTRUE(checkString(x, na.ok, ...))
}