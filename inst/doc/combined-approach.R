## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 7,
  fig.height = 5,
  fig.align = "center"
)

## ----setup--------------------------------------------------------------------
library(clinicalsignificance)

## ----jt-combined--------------------------------------------------------------
# Perform the JT combined analysis
jt_combined <- claus_2020 |>
  cs_combined(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    m_functional = 7.69,
    sd_functional = 7.52,
    reliability = 0.801
  )

# Display the summary of results
summary(jt_combined)

## ----jt-combined-plot---------------------------------------------------------
plot(jt_combined, show_group = "category")

## ----anchor-combined----------------------------------------------------------
# Perform the anchor-based combined analysis
anchor_combined <- claus_2020 |>
  cs_combined(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    m_functional = 7.69,
    sd_functional = 7.52,
    mid_improvement = 7
  )

# Display the summary of results
summary(anchor_combined)

## ----anchor-combined-plot-----------------------------------------------------
plot(anchor_combined, show_group = "category")

