## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 5,
  fig.height = 5
)

## ----setup--------------------------------------------------------------------
library(clinicalsignificance)

claus_2020

## ---- message=FALSE-----------------------------------------------------------
library(tidyverse)

claus_2020 %>% 
  mutate(time = as_factor(time)) %>% 
  ggplot(aes(time, bdi)) +
  geom_boxplot()

## -----------------------------------------------------------------------------
results <- claus_2020 %>% 
  clinical_significance(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    m_functional = 7.69,
    sd_functional = 7.52,
    reliability = 0.801,
    type = "c"
  )

results

## -----------------------------------------------------------------------------
summary(results)

## -----------------------------------------------------------------------------
plot(results, upper_limit = 63)

## ---- fig.width=6-------------------------------------------------------------
plot(results, upper_limit = 63, show = category)

## -----------------------------------------------------------------------------
results_grouped <- claus_2020 %>% 
  clinical_significance(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    m_functional = 7.69,
    sd_functional = 7.52,
    reliability = 0.801,
    type = "c",
    group = treatment
  )

results_grouped

## ---- fig.width=6-------------------------------------------------------------
plot(results_grouped, upper_limit = 63)

## -----------------------------------------------------------------------------
results_ha <- claus_2020 %>% 
  clinical_significance(
    id = id,
    time = time,
    outcome = bdi, 
    pre = 1,
    post = 4,
    m_functional = 7.69,
    sd_functional = 7.52,
    reliability = 0.801,
    type = "c",
    method = "HA"
  )

results_ha

plot(results_ha, upper_limit = 63)

