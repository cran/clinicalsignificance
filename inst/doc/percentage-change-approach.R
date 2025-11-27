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

## ----pct-basic----------------------------------------------------------------
# Analyze change using a 50% improvement cutoff
pct_results <- claus_2020 |>
  cs_percentage(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    pct_improvement = 0.5
  )

summary(pct_results)

## ----pct-basic-plot-----------------------------------------------------------
plot(pct_results)

## ----pct-grouped--------------------------------------------------------------
# Grouped analysis with a 50% improvement cutoff
pct_grouped <- claus_2020 |>
  cs_percentage(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    pct_improvement = 0.5,
    group = treatment
  )

summary(pct_grouped)

## ----pct-grouped-plot---------------------------------------------------------
plot(pct_grouped)

## ----pct-different-cutoffs----------------------------------------------------
pct_asymmetric <- claus_2020 |>
  cs_percentage(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    pct_improvement = 0.5,
    pct_deterioration = 0.2 # A smaller threshold for worsening
  )

summary(pct_asymmetric)

