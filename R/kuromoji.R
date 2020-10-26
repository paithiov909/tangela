#' Call Kuromoji Tokenizer
#'
#' @param str character scalar to be tokenized.
#' @return list
#'
#' @import rJava
#' @importFrom stringi stri_enc_toutf8
#' @export
kuromoji <- function(str) {
  if (!is.character(str) || length(str) != 1L || is.na(str)) {
    message("Invalid string provided. String must be a character scalar, not NA_character_.")
    return(invisible(list()))
  } else {
    tokens <- rJava::.jcall(Tokenizer(), "Ljava/util/List;", "tokenize", stringi::stri_enc_toutf8(str))
    res <- lapply(tokens, function(token) {
      surface <- token$getSurfaceForm()
      feature <- token$getAllFeatures()
      Encoding(surface) <- "UTF-8"
      Encoding(feature) <- "UTF-8"
      return(list(
        surface = surface,
        feature = feature,
        is_know = token$isKnown(),
        is_unk = token$isUnknown(),
        is_user = token$isUser()
      ))
    })
    return(res)
  }
}
