#' Tokenizer
#' @noRd
Tokenizer <- NULL

#' onLoad
#' @noRd
#' @param libname libname
#' @param pkgname pkgname
#' @import rJava
.onLoad <- function(libname, pkgname) {
  rJava::.jpackage(pkgname, lib.loc = libname)

  # For dev environment
  rJava::.jaddClassPath("inst/java/kuromoji-0.7.7.jar")

  rJava::javaImport(packages = "org.atilika.kuromoji.Token")
  rJava::javaImport(packages = "org.atilika.kuromoji.Tokenizer")

  # Initialize
  user_dic <- ""

  Builder <- rJava::J("org.atilika.kuromoji.Tokenizer")$builder()
  Builder$userDictionary(user_dic)
  Tokenizer <<- Builder$build()
}

#' onUnload
#' @noRd
#' @param libpath libpath
.onUnload <- function(libpath) {
  # No use...
}
