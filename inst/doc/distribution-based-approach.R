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

## ----jt-method----------------------------------------------------------------
# Analyze reliable change using the JT method
dist_jt <- claus_2020 |>
  cs_distribution(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    reliability = 0.801
  )

summary(dist_jt)

## ----jt-method-plot-----------------------------------------------------------
plot(dist_jt)

## ----ha-method----------------------------------------------------------------
dist_ha <- claus_2020 |>
  cs_distribution(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    reliability = 0.801,
    rci_method = "HA"
  )

summary(dist_ha)

## ----hlm-method---------------------------------------------------------------
dist_hlm <- claus_2020 |>
  cs_distribution(
    id = id,
    time = time,
    outcome = bdi,
    rci_method = "HLM"
  )

summary(dist_hlm)

## ----hlm-method-plot----------------------------------------------------------
plot(dist_hlm)

