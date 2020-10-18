#' Tokenizer instance
#' @noRd
#' @keywords internal
Tokenizer <- NULL

#' Initialize Kuromoji Tokenizer
#'
#' @param user_dic character scalar. file path to user dictionary if any.
#' @return return kuromoji tokenizer instance invisibly.
#'
#' @import rJava
#' @export
rebuild_tokenizer <- function(user_dic = "") {
  Builder <- rJava::J("org.atilika.kuromoji.Tokenizer")$builder()
  Builder$userDictionary(user_dic)
  Tokenizer <<- Builder$build()
  return(invisible(Tokenizer))
}

#' onLoad
#' @noRd
#' @param libname libname
#' @param pkgname pkgname
#' @import rJava
#' @keywords internal
.onLoad <- function(libname, pkgname) {
  rJava::.jpackage(pkgname,
    morePaths = c("inst/java/kuromoji-0.7.7.jar"),
    lib.loc = libname
  )
  rJava::javaImport(packages = "org.atilika.kuromoji.Token")
  rJava::javaImport(packages = "org.atilika.kuromoji.Tokenizer")

  # Initialize
  rebuild_tokenizer()
}

