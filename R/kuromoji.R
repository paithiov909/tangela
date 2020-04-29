#' Call Kuromoji Tokenizer
#'
#' @param str String to be tokenized.
#' @param userDic String
#' @return a list
#'
#' @import rJava
#' @importFrom stringi stri_enc_toutf8
#' @export
kuromoji <- function(str, userDic = "") {
    Builder <- rJava::J("org.atilika.kuromoji.Tokenizer")$builder()
    Builder$userDictionary(userDic)
    Tokenizer <- Builder$build()
    tokens <- rJava::.jcall(Tokenizer, "Ljava/util/List;", "tokenize", c(stringi::stri_enc_toutf8(str)))
    res <- lapply(tokens, function(token) {
        surface <- token$getSurfaceForm()
        feature <- token$getAllFeatures()
        Encoding(surface) <- "UTF-8"
        Encoding(feature) <- "UTF-8"
        return(list(
            surface = surface,
            feature = feature,
            is_know =  token$isKnown(),
            is_unk = token$isUnknown()
        ))
    })
    return(res)
}
