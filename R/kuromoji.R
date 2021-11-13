#' Call kuromoji tokenizer
#'
#' @param chr Character vector to be tokenized.
#' @param split Logical.If true (by default), the function splits character vector
#' into sentences using \code{stringi::stri_split_boudaries(type = "sentence")}
#' before analyzing them.
#' @return List.
#'
#' @export
kuromoji <- function(chr, split = TRUE) {
  stopifnot(rlang::is_character(chr))
  if (is.factor(chr) || any(is.na(chr))) rlang::abort("Invalid string provided. String must be a character scalar, not NA_character_.")

  chr <- tidyr::replace_na(stringi::stri_enc_toutf8(chr), "")
  if (split) {
    chr <- purrr::flatten_chr(stringi::stri_split_boundaries(chr, type = "sentence"))
  }

  res <- lapply(chr, function(elem) {
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

  return(res)
}
