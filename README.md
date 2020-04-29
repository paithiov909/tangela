# tangela

[![GitHub last commit](https://img.shields.io/github/last-commit/paithiov909/tangela)](#) [![GitHub license](https://img.shields.io/github/license/paithiov909/tangela)](https://github.com/paithiov909/tangela/blob/master/LICENSE) [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)


> rJava Interface to Kuromoji

## Installation

``` R
remotes::install_github("paithiov909/tangela")
```

## Requirements

- JDK

## Usage

``` R
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
```

## Related repositories

- [s-u/rJava: R to Java interface](https://github.com/s-u/rJava)
- [atilika/kuromoji: Kuromoji is a self-contained and very easy to use Japanese morphological analyzer designed for search](https://github.com/atilika/kuromoji)
- [yamano357/rJaNLP](https://github.com/yamano357/rJaNLP): Provides a kuromoji interface (however, not active repository)

## License

MIT license.

This software includes the works that are distributed in Apache License 2.0.

