#' Prettify tokenized output
#'
#' @inherit audubon::prettify description return details
#' @param df A data.frame that has feature column to be prettified.
#' @param into Character vector that is used as column names of
#' features.
#' @param col_select Character or integer vector that will be kept
#' in prettified features.
#' @importFrom audubon prettify
#' @export
prettify <- function(df,
                     into = get_dict_features("ipa"),
                     col_select = seq_along(into)) {
  audubon::prettify(df, into = into, col_select = col_select)
}

#' Get dictionary's features
#'
#' @inherit audubon::get_dict_features description return details seealso
#' @inheritParams audubon::get_dict_features
#' @importFrom audubon get_dict_features
#' @export
get_dict_features <- audubon::get_dict_features
