img <- file.path(
  getwd(),
  "man",
  "figures",
  "leaves.png"
)

hexSticker::sticker(
  img,
  s_x = 1,
  s_width = .5,
  s_height = .5,
  p_size = 24,
  package = "tangela",
  p_color = "#5484f4",
  h_size = 2.6,
  h_fill = "#d4f454",
  h_color = "#54f474",
  filename = "man/figures/logo-origin.png"
)

usethis::use_logo("man/figures/logo-origin.png")
pkgdown::build_favicons(overwrite = TRUE)
