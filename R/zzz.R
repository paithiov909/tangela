#' Package internal environment
#' @noRd
#' @keywords internal
.pkgenv <- rlang::env()

#' Tokenizer instance
#' @noRd
#' @keywords internal
Tokenizer <- function(obj = NULL) {
  if (!is.null(obj)) rlang::env_bind(.pkgenv, "tokenizer" = obj)
  return(rlang::env_get(.pkgenv, "tokenizer", default = NULL))
}

#' Initialize kuromoji tokenizer
#'
#' @param user_dic file path to a user dictionary if any.
#' @return The stored kuromoji tokenizer instance is returned invisibly.
#'
#' @export
rebuild_tokenizer <- function(user_dic = "") {
  Builder <- rJava::J("org.atilika.kuromoji.Tokenizer")$builder()
  Builder$userDictionary(user_dic)
  Tokenizer(Builder$build())
  return(invisible(Tokenizer()))
}

#' onLoad
#' @noRd
#' @param libname libname
#' @param pkgname pkgname
#' @keywords internal
.onLoad <- function(libname, pkgname) {
  rJava::.jpackage(pkgname,
    morePaths = c("inst/java/kuromoji-0.7.7.jar"),
    lib.loc = libname
  )
  ## Initialize
  rebuild_tokenizer()
}
