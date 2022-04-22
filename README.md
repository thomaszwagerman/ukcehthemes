
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ukcehthemes

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

This repository was forked directly from the [UKCEH_shiny_theming
repository](https://github.com/NERC-CEH/UKCEH_shiny_theming), to see if
this guidance could be turned into a package. The original authors are
Simon Rolph and Kate Randall. Although it uses `bslib`, both the name
and functionality were heavily influenced by `shinythemes`.

## Installation

You can install the development version of ukcehthemes from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("thomaszwagerman/ukcehthemes")
```

## Quick start

Add the following to the UI

``` r
library(shiny)
library(ukcehthemes)
ui <- fluidPage(
  theme = ukceh_pick_theme("generic"),  # << add this line

  ukceh_titlePanel("Old Faithful Geyser Data") # << replace your titlePanel() with ukceh_titlePanel()
)
```

See how it looks in a live Shiny app:
<https://connect-apps.ceh.ac.uk/content/5f616ea7-af1a-4716-a7bf-48ac970ce788>

## Introduction

R Shiny is a very useful way of making your R code run in a user
friendly way with a user interface. We can publish R Shiny applications
using RStudio Connect: <https://connect-apps.ceh.ac.uk/connect/>

The generic R Shiny theme is based on bootstrap and doesn’t conform to
the UKCEH brand guidelines <https://brandroom.ceh.ac.uk/>. This package
aims to show how to adapt the default Shiny theme to fit in with other
UKCEH web presences. You can either made the small additions to your
existing Shiny app or work from a example template
<https://github.com/NERC-CEH/UKCEH_shiny_theming#examples>

There are a number of different standard layouts you can use for R
Shiny: <https://shiny.rstudio.com/articles/layout-guide.html>.

## Incorporating the changes into your shiny app

In the `/themes` folder UKCEH themes are pre-defined, so there is no
need to copy and paste or write your own. They need to be included in
the `fluidPage()` function when defining `ui`. This is an example using
the sidebar layout, using the `ukceh_pick_theme()` function we choose
the “generic” UKCEH theme. This is currently the only theme available.

``` r
ui <- fluidPage(
  # Defining the ukceh elements of the theme
  theme = ukceh_pick_theme("generic"),
  ukceh_titlePanel("My first Shiny app"),
  # The rest of your code...
  sidebarLayout(
    sidebarPanel(
      ...
    ),
    mainPanel(
      ...
    )
  )
)
```

You can also change the appearance of plots drawn using `{ggplot2}`
appear by using:

``` r
library(thematic)
#> Warning: package 'thematic' was built under R version 4.1.3
thematic::thematic_shiny()
```

See <https://rstudio.github.io/thematic/> for more details.

## Colours

The UKCEH colours are defined here:
<https://brandroom.ceh.ac.uk/sites/default/files/2022-01/UKCEH_Colour_Guidelines.pdf>

The hex code are stored in the `/data/` folder of this package if you
want to use them in your plots. For example if you have a bar plot use
the “hero” colour for the bars. You can obtain them using the
`ukceh_get_colours()` function.

``` r
# Say you want to obtain the UKCEH logo colours
logo_colours <- ukceh_get_colours("logo")

# Or the primary colour palette for UKCEh
primary_palette <- ukceh_get_colours("primary_palette")

# To see all the different options, call:
names(ukceh_colours)
#> [1] "logo"             "hero"             "primary_palette"  "highlight"       
#> [5] "extended_palette"

# You don't need to use the function, you can also use:
ukceh_colours$logo
#> [1] "#007AC0" "#59B444"
```

## Details: changing primary colours and fonts with `{bslib}`

The `bslib` package is designed for theming shiny apps and can be used
to change some universal elements like colours and fonts
<https://shiny.rstudio.com/articles/themes.html>

The UKCEH font is Montserrat. It is available on Google fonts:
<https://fonts.google.com/specimen/Montserrat>

These settings make the most of the the existing UKCEH colour palette
and sets the correct fonts.

In this case the “base” UKCEH theme is called “generic”. Feel free to
add your own. The code below is stored in the `/themes` folder, which is
automatically loaded in when `library(ukcehthemes)` is called, so no
need to copy and paste.

``` r
library(bslib)

generic <- bs_theme(
  bg = "#fff",
  fg = "#292C2F",
  primary = "#0483A4",
  secondary = "#EAEFEC",
  success = "#37a635",
  info = "#34b8c7",
  warning = "#F49633",
  base_font = font_link(family = "Montserrat",
                        href = "https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap")
) |>  
  bs_add_variables("headings-font-weight" = 600)

# This line is not stored in the original script, 
# but demonstrates how to preview the theme.
bs_theme_preview(generic)
```

You can preview a theme with `bs_theme_preview()` which brings up a
webpage like so:

*Inputs:*

![image](https://user-images.githubusercontent.com/17750766/159717824-32ca3012-329a-4796-91b1-04fcf0713cc9.png)

*Tables:*

![image](https://user-images.githubusercontent.com/17750766/159717971-c7e59693-da1c-43b0-9eef-55b0b3d5c34d.png)

*Fonts:*

![image](https://user-images.githubusercontent.com/17750766/159718071-d8657f35-a337-4ecc-b259-82c4156bea81.png)

## Logo, title and favicon

In R Shiny you can use the `titlePanel()` function
(<https://shiny.rstudio.com/reference/shiny/0.14/titlePanel.html>) to
give the page a title at the top of the page and it also updates the
title in the tab to be the same text.

The favicon is the tiny little image that appears in the tab of the web
browser, it can be accessed direct via a web link from the brand room
<https://brandroom.ceh.ac.uk/themes/custom/ceh/favicon.ico> so we don’t
need to download it ourselves.

Here is a drop in replacement of that function which also adds the UKCEH
logo and adds `| UK Centre for Ecology and Hydrology` after the title in
the tab.

``` r
ukceh_titlePanel <- function(apptitle = "UKCEH Shiny app") {
  htmltools::div(
    htmltools::img(
      src = "https://www.ceh.ac.uk/sites/default/files/images/theme/ukceh_logo_long_720x170_rgb.png",
      style = "height: 50px;vertical-align:middle;"),
    htmltools::h2(
      apptitle,
      style = "vertical-align:middle; display:inline;padding-left:40px;"
    ),
    htmltools::tagList(
      htmltools::tags$head(
        htmltools::tags$title(
          paste0(apptitle, " | UK Centre for Ecology & Hydrology")),
        htmltools::tags$link(
          rel = "shortcut icon",
          href = "https://brandroom.ceh.ac.uk/themes/custom/ceh/favicon.ico"))),
    style = "padding: 30px;"
  )
}
```

When `ukceh_titlePanel` is included in the Shiny app it looks like this:
![image](https://user-images.githubusercontent.com/17750766/159720789-dff9186c-7bca-437a-a487-46a57f44e014.png)

Note how the favicon and tab title have changed:

![image](https://user-images.githubusercontent.com/17750766/159717427-a5454c2c-02d3-4241-8c23-fb769fd68e3e.png)

## Footer

Currently still working on the best way to format a footer and what
content to include from the main site etc.

## Examples

### Sidebar layout

A UKCEH branded version of the standard R Shiny example with some extra
false inputs added to the sidebar.

![image](https://user-images.githubusercontent.com/17750766/159717529-08361e20-bc3e-4c27-b7d2-3967c8317613.png)

### Fluid page layout

*Coming soon*

### Navbar layout

*Coming soon*
