#' @rdname assertFile
#' @export
assertDirectory = function(x, access = "", .var.name) {
  amsg(testDirectory(x, access), vname(x, .var.name))
}

#' @rdname assertFile
#' @export
isDirectory = function(x, access = "") {
  isTRUE(testDirectory(x, access))
}

#' @rdname assertFile
#' @export
asDirectory = function(x, access = "", .var.name) {
  assertDirectory(x, access = access, .var.name = vname(x, .var.name))
  x
}

testDirectory = function(x, access = "") {
  qassert(x, "S")
  if (length(x) == 0L)
    return("No diretory provided in '%%s'")

  isdir = file.info(x)$isdir
  w = which.first(is.na(isdir))
  if (length(w) > 0L)
    return(sprintf("Directory in '%%s' does not exist: '%s'", x[w]))
  w = which.first(!isdir)
  if (length(w) > 0L)
    return(sprintf("Directory in '%%s' expected, file in place: '%s'", x[w]))

  return(testAccess(x, access))
}
