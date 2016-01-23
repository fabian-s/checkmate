#ifndef _CHECKMATE_H_
#define _CHECKMATE_H_

#include <R.h>
#include <Rinternals.h>
#include <Rdefines.h>
#include <R_ext/Visibility.h>

#ifdef __cplusplus
extern "C" {
#endif

Rboolean attribute_hidden qtest(SEXP x, const char *rule) {
  static Rboolean(*fun)(SEXP, const char *) = NULL;
  if (fun == NULL)
    fun = (Rboolean(*)(SEXP, const char *)) R_GetCCallable("checkmate", "qtest");
  return fun(x, rule);
}

SEXP attribute_hidden qassert(SEXP x, const char *rule, const char *name) {
  static SEXP(*fun)(SEXP, const char *, const char *) = NULL;
  if (fun == NULL)
    fun = (SEXP(*)(SEXP, const char *, const char *)) R_GetCCallable("checkmate", "qassert");
  return fun(x, rule, name);
}

#endif

#ifdef __cplusplus
}
#endif
