#' Call kuromoji tokenizer
#'
#' @param chr Character vector to be tokenized.
#' @return List.
#'
#' @export
kuromoji <- function(chr) {
  stopifnot(rlang::is_character(chr))
  if (is.factor(chr) || any(is.na(chr))) rlang::abort("Invalid string provided. String must be a character scalar, not NA_character_.")

  # keep names
  nm <- names(chr)
  if (identical(nm, NULL)) {
    nm <- seq_along(chr)
  }

  res <- lapply(chr, function(elem) {
    elem <- tidyr::replace_na(stringi::stri_enc_toutf8(elem), "")
    tokens <- rJava::.jcall(
      Tokenizer(),
      "Ljava/util/List;",
      "tokenize",
      elem
    )
    lapply(tokens, function(token) {
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
  })

  return(purrr::set_names(res, nm))
}
