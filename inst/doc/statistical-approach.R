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

## ----stat-basic---------------------------------------------------------------
# Perform the statistical analysis
stat_results <- claus_2020 |>
  cs_statistical(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    m_functional = 7.69,
    sd_functional = 7.52,
    cutoff_type = "c"
  )

summary(stat_results)

## ----stat-basic-plot----------------------------------------------------------
plot(stat_results)

## ----stat-grouped-------------------------------------------------------------
# Grouped statistical analysis
stat_grouped <- claus_2020 |>
  cs_statistical(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    m_functional = 7.69,
    sd_functional = 7.52,
    cutoff_type = "c",
    group = treatment
  )

summary(stat_grouped)

## ----stat-grouped-plot--------------------------------------------------------
plot(stat_grouped)

