
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
  "なぜ分かり合えないのか！？
   なぜ貴様等は他を出し抜こうとするのか！？
   ところできのこはあんな縦に長かったか！？"
)
str(res[[1]])
#> List of 35
#>  $ :List of 5
#>   ..$ surface: chr "なぜ"
#>   ..$ feature: chr "副詞,助詞類接続,*,*,*,*,なぜ,ナゼ,ナゼ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "分かり"
#>   ..$ feature: chr "動詞,自立,*,*,五段・ラ行,連用形,分かる,ワカリ,ワカリ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "合え"
#>   ..$ feature: chr "動詞,自立,*,*,一段,未然形,合える,アエ,アエ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "ない"
#>   ..$ feature: chr "助動詞,*,*,*,特殊・ナイ,基本形,ない,ナイ,ナイ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "の"
#>   ..$ feature: chr "名詞,非自立,一般,*,*,*,の,ノ,ノ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "か"
#>   ..$ feature: chr "助詞,副助詞／並立助詞／終助詞,*,*,*,*,か,カ,カ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "！"
#>   ..$ feature: chr "記号,一般,*,*,*,*,！,！,！"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "？"
#>   ..$ feature: chr "記号,一般,*,*,*,*,？,？,？"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "\n   "
#>   ..$ feature: chr "記号,空白,*,*,*,*,*"
#>   ..$ is_know: logi FALSE
#>   ..$ is_unk : logi TRUE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "なぜ"
#>   ..$ feature: chr "副詞,助詞類接続,*,*,*,*,なぜ,ナゼ,ナゼ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "貴様"
#>   ..$ feature: chr "名詞,一般,*,*,*,*,貴様,キサマ,キサマ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "等"
#>   ..$ feature: chr "名詞,接尾,一般,*,*,*,等,トウ,トー"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "は"
#>   ..$ feature: chr "助詞,係助詞,*,*,*,*,は,ハ,ワ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "他"
#>   ..$ feature: chr "名詞,一般,*,*,*,*,他,タ,タ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "を"
#>   ..$ feature: chr "助詞,格助詞,一般,*,*,*,を,ヲ,ヲ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "出し抜こ"
#>   ..$ feature: chr "動詞,自立,*,*,五段・カ行イ音便,未然ウ接続,出し抜く,ダシヌコ,ダシヌコ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "う"
#>   ..$ feature: chr "助動詞,*,*,*,不変化型,基本形,う,ウ,ウ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "と"
#>   ..$ feature: chr "助詞,格助詞,一般,*,*,*,と,ト,ト"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "する"
#>   ..$ feature: chr "動詞,自立,*,*,サ変・スル,基本形,する,スル,スル"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "の"
#>   ..$ feature: chr "名詞,非自立,一般,*,*,*,の,ノ,ノ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "か"
#>   ..$ feature: chr "助詞,副助詞／並立助詞／終助詞,*,*,*,*,か,カ,カ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "！"
#>   ..$ feature: chr "記号,一般,*,*,*,*,！,！,！"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "？"
#>   ..$ feature: chr "記号,一般,*,*,*,*,？,？,？"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "\n   "
#>   ..$ feature: chr "記号,空白,*,*,*,*,*"
#>   ..$ is_know: logi FALSE
#>   ..$ is_unk : logi TRUE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "ところで"
#>   ..$ feature: chr "接続詞,*,*,*,*,*,ところで,トコロデ,トコロデ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "きのこ"
#>   ..$ feature: chr "名詞,一般,*,*,*,*,きのこ,キノコ,キノコ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "は"
#>   ..$ feature: chr "助詞,係助詞,*,*,*,*,は,ハ,ワ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "あんな"
#>   ..$ feature: chr "連体詞,*,*,*,*,*,あんな,アンナ,アンナ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "縦"
#>   ..$ feature: chr "名詞,一般,*,*,*,*,縦,タテ,タテ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "に"
#>   ..$ feature: chr "助詞,副詞化,*,*,*,*,に,ニ,ニ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "長かっ"
#>   ..$ feature: chr "形容詞,自立,*,*,形容詞・アウオ段,連用タ接続,長い,ナガカッ,ナガカッ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "た"
#>   ..$ feature: chr "助動詞,*,*,*,特殊・タ,基本形,た,タ,タ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "か"
#>   ..$ feature: chr "助詞,副助詞／並立助詞／終助詞,*,*,*,*,か,カ,カ"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "！"
#>   ..$ feature: chr "記号,一般,*,*,*,*,！,！,！"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
#>  $ :List of 5
#>   ..$ surface: chr "？"
#>   ..$ feature: chr "記号,一般,*,*,*,*,？,？,？"
#>   ..$ is_know: logi TRUE
#>   ..$ is_unk : logi FALSE
#>   ..$ is_user: logi FALSE
```

### Prettify Output

``` r
res <- tangela::prettify(res)
head(res)
#>   doc_id  token is_unk   POS1                     POS2 POS3 POS4 X5StageUse1
#> 1      1   なぜ  FALSE   副詞               助詞類接続 <NA> <NA>        <NA>
#> 2      1 分かり  FALSE   動詞                     自立 <NA> <NA>  五段・ラ行
#> 3      1   合え  FALSE   動詞                     自立 <NA> <NA>        一段
#> 4      1   ない  FALSE 助動詞                     <NA> <NA> <NA>  特殊・ナイ
#> 5      1     の  FALSE   名詞                   非自立 一般 <NA>        <NA>
#> 6      1     か  FALSE   助詞 副助詞／並立助詞／終助詞 <NA> <NA>        <NA>
#>   X5StageUse2 Original  Yomi1  Yomi2
#> 1        <NA>     なぜ   ナゼ   ナゼ
#> 2      連用形   分かる ワカリ ワカリ
#> 3      未然形   合える   アエ   アエ
#> 4      基本形     ない   ナイ   ナイ
#> 5        <NA>       の     ノ     ノ
#> 6        <NA>       か     カ     カ
```

The output has these columns.

-   doc_id: 文番号
-   token: 表層形（surface form）
-   is_unk: 未知語判定（whether or not the token is unknown word?）
-   POS1\~POS4: 品詞, 品詞細分類1, 品詞細分類2, 品詞細分類3
-   X5StageUse1: 活用型（ex. 五段, 下二段…）
-   X5StageUse2: 活用形（ex. 連用形, 基本形…）
-   Original: 原形（lemmatised form）
-   Yomi1: 読み（readings）
-   Yomi2: 発音（pronunciation)

### Pack Output

``` r
res <- tangela::kuromoji(
  c("なぜ分かり合えないのか！？
     なぜ貴様等は他を出し抜こうとするのか！？
     ところできのこはあんな縦に長かったか！？",
    "とにかく不様、そんな事ではあの小娘には勝てないわ。",
    "そう、皆で協力して挑むのだ！",
    "えー、まぁ今回はその件で伺いました。")
) %>% 
  tangela::prettify() %>% 
  tangela::pack()
print(res)
#>   doc_id
#> 1      1
#> 2      2
#> 3      3
#> 4      4
#>                                                                                                                                                         text
#> 1 なぜ 分かり 合え ない の か ！ ？ \n      なぜ 貴様 等 は 他 を 出し抜こ う と する の か ！ ？ \n      ところで きのこ は あんな 縦 に 長かっ た か ！ ？
#> 2                                                                                           とにかく 不様 、 そんな 事 で は あの 小娘 に は 勝て ない わ 。
#> 3                                                                                                                     そう 、 皆 で 協力 し て 挑む の だ ！
#> 4                                                                                                            えー 、 まぁ 今回 は その 件 で 伺い まし た 。
```

## License

© 2022 Akiru Kato

Licensed under [the Apache License, Version
2.0](http://www.apache.org/licenses/LICENSE-2.0.html). This software
includes the works distributed under the Apache License, Version 2.0.

Icons made by [Eucalyp](https://www.flaticon.com/authors/eucalyp) from
[www.flaticon.com](https://www.flaticon.com/).
