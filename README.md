
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tangela

<!-- badges: start -->

[![GitHub last
commit](https://img.shields.io/github/last-commit/paithiov909/tangela)](#)
[![GitHub
license](https://img.shields.io/github/license/paithiov909/tangela)](https://github.com/paithiov909/tangela/blob/master/LICENSE)
<!-- badges: end -->

> rJava Interface to Kuromoji

## System Requirements

  - Java

## Installation

``` r
remotes::install_github("paithiov909/tangela")
```

## Usage

Basic usage:

``` r
res <- tangela::kuromoji("決して自分が選んだだけなのに、選ばれたような嬉しさや幸せをくれるのがデニムです")
print(res[[1]])
#> $surface
#> [1] "決して"
#> 
#> $feature
#> [1] "副詞,一般,*,*,*,*,決して,ケッシテ,ケッシテ"
#> 
#> $is_know
#> [1] TRUE
#> 
#> $is_unk
#> [1] FALSE
#> 
#> $is_user
#> [1] FALSE
```

Some examples which shows you how to use output of tangela:

### ゲンシジン ナル

> 助詞を除いてカタコトの日本語に

``` r
genshijin <- function(text) {
  `%without%` <- purrr::negate(`%in%`)
  df <- tangela::kuromoji(text) %>%
    purrr::map_dfr(~ data.frame(
      feature = purrr::pluck(., "feature"),
      stringsAsFactors = FALSE
    )) %>%
    tidyr::separate(
      col = "feature",
      into = c(
        "品詞",
        "品詞細分類1",
        "品詞細分類2",
        "品詞細分類3",
        "活用形",
        "活用型",
        "原形",
        "読み",
        "発音"
      ),
      sep = ",",
      fill = "right"
    )
  res <- df %>%
    tidyr::drop_na() %>%
    dplyr::filter(!!sym("品詞細分類1") %without% c(
      "格助詞",
      "係助詞",
      "終助詞",
      "副詞化",
      "特殊"
    )) %>%
    dplyr::pull("読み") %>%
    paste(collapse = " ")
  return(res)
}
```

``` r
genshijin("メガネは顔の一部じゃない あなたはわたしの全てじゃない")
#> [1] "メガネ カオ ノ イチブ ジャ ナイ アナタ ワタシ ノ スベテ ジャ ナイ"
```

### 名詞をランダムに「ヒャッハァー！」に置換

``` r
hyahhaaa <- function(text, replacement = "ヒャッハァーー！", pos = "名詞", p = 0.8) {
  df <- tangela::kuromoji(text) %>%
    purrr::map_dfr(~ data.frame(
      surface = purrr::pluck(., "surface"),
      feature = purrr::pluck(., "feature"),
      stringsAsFactors = FALSE
    )) %>%
    tidyr::separate(
      col = "feature",
      into = c(
        "品詞",
        "品詞細分類1",
        "品詞細分類2",
        "品詞細分類3",
        "活用形",
        "活用型",
        "原形",
        "読み",
        "発音"
      ),
      sep = ",",
      fill = "right"
    )
  res <- df %>%
    dplyr::rowwise() %>%
    dplyr::mutate(str = dplyr::if_else(
      !!sym("品詞") %in% c(pos) & runif(1) <= p,
      replacement,
      !!sym("surface")
    )) %>%
    dplyr::pull("str") %>%
    paste(collapse = "")
  return(res)
}
```

``` r
hyahhaaa("恋するだけが乙女じゃない 素直なだけがいい子じゃない")
#> [1] "恋するだけがヒャッハァーー！じゃない ヒャッハァーー！なだけがいいヒャッハァーー！じゃない"
```

### 参考

#### ゲンシジン ナル

  - [【R言語】Rでゲンシジンになってみた -
    Qiita](https://qiita.com/taro_9674/items/e02119ab26376979a489)
  - [オレ プログラム ウゴカス オマエ ゲンシジン ナル -
    Qiita](https://qiita.com/Harusugi/items/f499e8707b36d0f570c4)
  - [Mecabなど形態素解析で使うIPA品詞体系（品詞ID｜pos-id） - MS
    Tech](http://miner.hatenablog.com/entry/323)

#### 名詞をランダムに「ヒャッハァー！」に置換

  - [日本語文の名詞をランダムに「ヒャッハァー！」に置換するＲスクリプト -
    こにしき（言葉・日本社会・教育）](https://terasawat.hatenablog.jp/entry/20100711/1278861735)

## Related Repositories

  - [s-u/rJava: R to Java interface](https://github.com/s-u/rJava)
  - [atilika/kuromoji: Kuromoji is a self-contained and very easy to use
    Japanese morphological analyzer designed for
    search](https://github.com/atilika/kuromoji)
  - [yamano357/rJaNLP](https://github.com/yamano357/rJaNLP): Provides a
    kuromoji interface (however, not active repository)

## Code of Conduct

Please note that the tangela project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

## License

MIT license.

This software includes the works distributed under Apache License 2.0.
