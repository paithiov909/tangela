
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tangela <a href='https://paithiov909.github.io/tangela'><img src='https://rawcdn.githack.com/paithiov909/tangela/1eeac7579939bbd8de48bb81a2766549da18d61a/man/figures/logo.png' align="right" height="139" /></a>

<!-- badges: start -->

[![GitHub last
commit](https://img.shields.io/github/last-commit/paithiov909/tangela)](#)
[![tangela status
badge](https://paithiov909.r-universe.dev/badges/tangela)](https://paithiov909.r-universe.dev)
[![GitHub
license](https://img.shields.io/github/license/paithiov909/tangela)](https://github.com/paithiov909/tangela/blob/main/LICENSE)
<!-- badges: end -->

tangela is an rJava wrapper of atilika/kuromoji (bundled v0.7.7).

[Kuromoji](https://github.com/atilika/kuromoji) is a “self-contained
Japanese morphological analyzer” such that tangela only requires Java;
It never has any other dependencies such as MeCab and its dictionaries.

## Usage

### Installation

``` r
remotes::install_github("paithiov909/tangela")
```

### Call tagger

``` r
res <- tangela::kuromoji(
  c("なぜ分かり合えないのか！？",
    "なぜ貴様等は他を出し抜こうとするのか！？",
    "ところできのこはあんな縦に長かったか！？")
)
str(res)
#> 'data.frame':    33 obs. of  5 variables:
#>  $ doc_id : chr  "1" "1" "1" "1" ...
#>  $ token  : chr  "なぜ" "分かり" "合え" "ない" ...
#>  $ feature: chr  "副詞,助詞類接続,*,*,*,*,なぜ,ナゼ,ナゼ" "動詞,自立,*,*,五段・ラ行,連用形,分かる,ワカリ,ワカリ" "動詞,自立,*,*,一段,未然形,合える,アエ,アエ" "助動詞,*,*,*,特殊・ナイ,基本形,ない,ナイ,ナイ" ...
#>  $ is_unk : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
#>  $ is_user: logi  FALSE FALSE FALSE FALSE FALSE FALSE ...
```

### Prettify Output

``` r
res <- tangela::prettify(res)
head(res)
#>   doc_id  token is_unk is_user   POS1                     POS2 POS3 POS4
#> 1      1   なぜ  FALSE   FALSE   副詞               助詞類接続 <NA> <NA>
#> 2      1 分かり  FALSE   FALSE   動詞                     自立 <NA> <NA>
#> 3      1   合え  FALSE   FALSE   動詞                     自立 <NA> <NA>
#> 4      1   ない  FALSE   FALSE 助動詞                     <NA> <NA> <NA>
#> 5      1     の  FALSE   FALSE   名詞                   非自立 一般 <NA>
#> 6      1     か  FALSE   FALSE   助詞 副助詞／並立助詞／終助詞 <NA> <NA>
#>   X5StageUse1 X5StageUse2 Original  Yomi1  Yomi2
#> 1        <NA>        <NA>     なぜ   ナゼ   ナゼ
#> 2  五段・ラ行      連用形   分かる ワカリ ワカリ
#> 3        一段      未然形   合える   アエ   アエ
#> 4  特殊・ナイ      基本形     ない   ナイ   ナイ
#> 5        <NA>        <NA>       の     ノ     ノ
#> 6        <NA>        <NA>       か     カ     カ
```

The output has these columns.

- doc_id: 文番号
- token: 表層形（surface form）
- is_unk: 未知語判定（whether or not the token is unknown word?）
- is_user: ユーザー辞書判定（whether or not the token is user defined
  word?）
- POS1\~POS4: 品詞, 品詞細分類1, 品詞細分類2, 品詞細分類3
- X5StageUse1: 活用型（ex. 五段, 下二段…）
- X5StageUse2: 活用形（ex. 連用形, 基本形…）
- Original: 原形（lemmatised form）
- Yomi1: 読み（readings）
- Yomi2: 発音（pronunciation)

### Pack Output

``` r
res <- tangela::kuromoji(
  c("なぜ分かり合えないのか！？",
    "なぜ貴様等は他を出し抜こうとするのか！？",
    "ところできのこはあんな縦に長かったか！？",
    "とにかく不様、そんな事ではあの小娘には勝てないわ。",
    "そう、皆で協力して挑むのだ！",
    "えー、まぁ今回はその件で伺いました。")
) |> 
  tangela::prettify() |> 
  tangela::pack()
print(res)
#>   doc_id                                                             text
#> 1      1                                なぜ 分かり 合え ない の か ！ ？
#> 2      2            なぜ 貴様 等 は 他 を 出し抜こ う と する の か ！ ？
#> 3      3               ところで きのこ は あんな 縦 に 長かっ た か ！ ？
#> 4      4 とにかく 不様 、 そんな 事 で は あの 小娘 に は 勝て ない わ 。
#> 5      5                           そう 、 皆 で 協力 し て 挑む の だ ！
#> 6      6                  えー 、 まぁ 今回 は その 件 で 伺い まし た 。
```

## License

© 2023 Akiru Kato

Licensed under [the Apache License, Version
2.0](http://www.apache.org/licenses/LICENSE-2.0.html). This software
includes the works distributed under the Apache License, Version 2.0.

Icons made by [Eucalyp](https://www.flaticon.com/authors/eucalyp) from
[www.flaticon.com](https://www.flaticon.com/).
