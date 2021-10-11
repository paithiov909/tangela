#' Prettify tokenized output
#'
#' @param list List that comes out of \code{tangela::kuromoji()}.
#' @param sep Character scalar that is used as separators
#' with which the function replaces tab.
#' @param into Character vector that is used as column names of
#' features.
#'
#' @return data.frame
#'
#' @export
prettify <- function(list,
                     sep = " ",
                     into = c(
                       "POS1",
                       "POS2",
                       "POS3",
                       "POS4",
                       "X5StageUse1",
                       "X5StageUse2",
                       "Original",
                       "Yomi1",
                       "Yomi2"
                     )) {
  stopifnot(
    is.list(list),
    is.character(sep)
  )
  res <- purrr::imap_dfr(list, function(li, i) {
    purrr::map_dfr(li, ~ data.frame(
      doc_id = i,
      token = purrr::pluck(., "surface"),
      is_unk = purrr::pluck(., "is_unk"),
      Features = purrr::pluck(., "feature"),
      stringsAsFactors = FALSE
    ))
  }) %>%
  tidyr::separate(
      col = "Features",
      into = into,
      sep = ",",
      fill = "right"
    ) %>%
    dplyr::mutate_if(is.character, ~ dplyr::na_if(., "*"))
  return(res)
}
