#' Call kuromoji tokenizer
#'
#' @param chr Character vector to be tokenized.
#' @returns A tibble.
#'
#' @export
kuromoji <- function(chr) {
  stopifnot(rlang::is_character(chr))

  # keep names
  nm <- names(chr)
  if (identical(nm, NULL)) {
    nm <- seq_along(chr)
  }

  purrr::imap(purrr::set_names(chr, nm), function(str, id) {
    str <- stringi::stri_replace_na(stringi::stri_enc_toutf8(str), "")
    tokens <- rJava::.jcall(
      Tokenizer(),
      "Ljava/util/List;",
      "tokenize",
      str
    )
    res <- lapply(tokens, function(elem) {
      surface <- elem$getSurfaceForm()
      feature <- elem$getAllFeatures()
      Encoding(surface) <- "UTF-8"
      Encoding(feature) <- "UTF-8"
      data.frame(
        doc_id = id,
        token = surface,
        feature = feature,
        # is_known = elem$isKnown(),
        is_unk = elem$isUnknown(),
        is_user = elem$isUser()
      )
    })
    purrr::list_rbind(res)
  }) %>%
    purrr::list_rbind() %>%
    dplyr::as_tibble()
}
