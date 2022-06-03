## ---- include = FALSE, message=FALSE------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6, 
  fig.height = 6
)

library(tidyverse)
cutoff <- (7 * 36.0 + 7 * 10) / (7 + 7)
s_diff <- sqrt(2 * (7 * sqrt(1 - 0.80))^2)
limits <- c(0, 60)

## ----setup--------------------------------------------------------------------
library(clinicalsignificance)

anxiety

## -----------------------------------------------------------------------------
anxiety_results <- anxiety %>% 
  clinical_significance(
    id = subject, 
    time = measurement, 
    outcome = anxiety, 
    pre = 0, 
    post = 4, 
    reliability = 0.80, 
    m_functional = 10, 
    sd_functional = 7, 
    type = "c"
  )

plot(anxiety_results, upper_limit = 60)

## ---- fig.width=6, fig.height=4, echo=FALSE-----------------------------------
recovered <- tribble(
  ~x, ~y,
  cutoff, 0,
  cutoff, cutoff - 1.96*s_diff,
  cutoff + 1.96*s_diff, cutoff,
  60, cutoff,
  60, 0
) %>% 
  mutate(category = "Recovered")

harmed <- tribble(
  ~x, ~y,
  0, cutoff,
  0, 60,
  cutoff, 60,
  cutoff, cutoff + 1.96 * s_diff,
  cutoff-1.96*s_diff, cutoff 
) %>% 
  mutate(category = "Harmed")


unchanged <- tribble(
  ~x, ~y,
  0, 0,
  0, 1.96 * s_diff,
  60-1.96 * s_diff, 60,
  60, 60,
  60, 60-1.96 * s_diff,
  0+1.96 * s_diff, 0
) %>% 
  mutate(category = "Unchanged")


deteriorated <- tribble(
  ~x, ~y,
  0, 0 + 1.96*s_diff,
  0, cutoff,
  cutoff-1.96*s_diff, cutoff,
  cutoff, cutoff + 1.96*s_diff,
  cutoff, 60,
  60-1.96*s_diff,60
) %>% 
  mutate(category = "Deteriorated")


improved <- tribble(
  ~x, ~y,
  cutoff, cutoff-1.96*s_diff,
  cutoff, 0,
  0+1.96*s_diff, 0,
  cutoff + 1.96*s_diff, cutoff,
  60, 60-1.96*s_diff,
  60, cutoff,
  cutoff + 1.96*s_diff, cutoff
) %>% 
  mutate(category = "Improved")

category_data <- bind_rows(recovered, harmed, unchanged, improved, deteriorated) %>% 
  mutate(
    category = factor(category, levels = c("Recovered", "Improved", "Unchanged", "Deteriorated", "Harmed"))
  )

set.seed(20220504)
tibble(
  x = rnorm(100, 30, 5),
  y = rnorm(100, 22, 8)
) %>% 
  ggplot(aes(x, y)) +
  geom_polygon(data = category_data, aes(x, y, fill = category), alpha = 0.4) +
  geom_point() +
  geom_abline() + 
  geom_vline(xintercept = cutoff, linetype = "dashed") +
  geom_hline(yintercept = cutoff, linetype = "dashed") +
  coord_cartesian(xlim = limits, ylim = limits, expand = FALSE) +
  theme_light() +
  theme(
    panel.grid = element_blank()
  ) +
  labs(fill = "Category")

## ---- fig.width=6, fig.height=4, echo=FALSE-----------------------------------
harmed <- tribble(
  ~x, ~y,
  cutoff, 0,
  cutoff, cutoff - 1.96*s_diff,
  cutoff + 1.96*s_diff, cutoff,
  60, cutoff,
  60, 0
) %>% 
  mutate(category = "Harmed")

recovered <- tribble(
  ~x, ~y,
  0, cutoff,
  0, 60,
  cutoff, 60,
  cutoff, cutoff + 1.96 * s_diff,
  cutoff-1.96*s_diff, cutoff 
) %>% 
  mutate(category = "Recovered")


unchanged <- tribble(
  ~x, ~y,
  0, 0,
  0, 1.96 * s_diff,
  60-1.96 * s_diff, 60,
  60, 60,
  60, 60-1.96 * s_diff,
  0+1.96 * s_diff, 0
) %>% 
  mutate(category = "Unchanged")


improved <- tribble(
  ~x, ~y,
  0, 0 + 1.96*s_diff,
  0, cutoff,
  cutoff-1.96*s_diff, cutoff,
  cutoff, cutoff + 1.96*s_diff,
  cutoff, 60,
  60-1.96*s_diff,60
) %>% 
  mutate(category = "Improved")


deteriorated <- tribble(
  ~x, ~y,
  cutoff, cutoff-1.96*s_diff,
  cutoff, 0,
  0+1.96*s_diff, 0,
  cutoff + 1.96*s_diff, cutoff,
  60, 60-1.96*s_diff,
  60, cutoff,
  cutoff + 1.96*s_diff, cutoff
) %>% 
  mutate(category = "Deteriorated")

category_data <- bind_rows(recovered, harmed, unchanged, improved, deteriorated) %>% 
  mutate(
    category = factor(category, levels = c("Recovered", "Improved", "Unchanged", "Deteriorated", "Harmed"))
  )


set.seed(20220504)
tibble(
  x = rnorm(100, 22, 5),
  y = rnorm(100, 32, 8)
) %>% 
  ggplot(aes(x, y)) +
  geom_polygon(data = category_data, aes(x, y, fill = category), alpha = 0.4) +
  geom_point() +
  geom_abline() + 
  geom_vline(xintercept = cutoff, linetype = "dashed") +
  geom_hline(yintercept = cutoff, linetype = "dashed") +
  coord_cartesian(xlim = limits, ylim = limits, expand = FALSE) +
  theme_light() +
  theme(
    panel.grid = element_blank()
  ) +
  labs(fill = "Category")

## -----------------------------------------------------------------------------
anxiety_results_ha <- anxiety %>% 
  clinical_significance(
    id = subject, 
    time = measurement, 
    outcome = anxiety, 
    pre = 0, 
    post = 4, 
    reliability = 0.80, 
    m_functional = 10, 
    sd_functional = 7, 
    type = "c",
    method = "HA"
  )

plot(anxiety_results_ha, upper_limit = 60)


anxiety_results_en <- anxiety %>% 
  clinical_significance(
    id = subject, 
    time = measurement, 
    outcome = anxiety, 
    pre = 0, 
    post = 4, 
    reliability = 0.80, 
    m_functional = 10, 
    sd_functional = 7, 
    type = "c",
    method = "EN"
  )

plot(anxiety_results_en, upper_limit = 60)



## -----------------------------------------------------------------------------
anxiety_results_hlm <- anxiety %>% 
  clinical_significance(
    id = subject,
    time = measurement,
    outcome = anxiety,
    method = "HLM"
  )

plot(anxiety_results_hlm, which = "trajectory")
plot(anxiety_results_hlm, which = "slope")

## -----------------------------------------------------------------------------
anxiety_results_grouped <- anxiety %>% 
  clinical_significance(
    id = subject, 
    time = measurement, 
    outcome = anxiety, 
    pre = 0, 
    post = 4, 
    reliability = 0.80, 
    m_functional = 10, 
    sd_functional = 7, 
    type = "c",
    group = treatment
  )

plot(anxiety_results_grouped, upper_limit = 60)

## -----------------------------------------------------------------------------
plot(anxiety_results, upper_limit = 60, show = "recovered")
plot(anxiety_results, upper_limit = 60, show = "improved")

## -----------------------------------------------------------------------------
plot(anxiety_results, upper_limit = 60, show = "category")

## -----------------------------------------------------------------------------
plot(anxiety_results_hlm, which = "trajectory", show = "recovered")
plot(anxiety_results_hlm, which = "slope", show = "recovered")

## -----------------------------------------------------------------------------
plot(anxiety_results_hlm, which = "trajectory", show = "recovered") +
  facet_wrap(~ recovered) +
  theme_minimal()

## -----------------------------------------------------------------------------
plot(anxiety_results, upper_limit = 60, rci_fill = "blue", rci_alpha = 0.2)

## -----------------------------------------------------------------------------
plot(anxiety_results_ha, upper_limit = 60, include_cutoff_band = TRUE)

## -----------------------------------------------------------------------------
plot(anxiety_results, upper_limit = 60, include_cutoff = FALSE)

## -----------------------------------------------------------------------------
plot(anxiety_results_grouped, 
     upper_limit = 60, 
     x_lab = "Anxiety Pre", 
     y_lab = "Anxiety Post", 
     color_lab = "Condition")

