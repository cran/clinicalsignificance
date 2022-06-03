## ---- include = FALSE, message=FALSE------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 5,
  fig.height = 4.5,
  fig.align = 'center'
)

library(tidyverse)

## ---- echo=FALSE--------------------------------------------------------------
distributions <- ggplot() +
  geom_function(fun = dnorm, args = list(mean = 10, sd = 7), aes(color = "Functional"), n = 200) +
  geom_function(fun = dnorm, args = list(mean = 32, sd = 7), aes(color = "Clinical"), n = 200) +
  expand_limits(x = c(-20, 70-3)) +
  theme_minimal() +
  theme(
    axis.line.x = element_line(),
    axis.text.y = element_blank(),
    panel.grid = element_blank(),
    legend.position = "bottom"
  ) +
  labs(x = "Depression Score", y = NULL, color = "Population")

distributions

## ---- echo=FALSE--------------------------------------------------------------
a <- clinicalsignificance:::.calc_cutoff_jt(32, 7, 10, 7, type = "a", direction = -1)$value
b <- clinicalsignificance:::.calc_cutoff_jt(32, 7, 10, 7, type = "b", direction = -1)$value
c <- clinicalsignificance:::.calc_cutoff_jt(32, 7, 10, 7, type = "c", direction = -1)$value

distributions +
  geom_vline(xintercept = a, linetype = "dashed") +
  geom_vline(xintercept = b, linetype = "dashed") +
  geom_label(aes(label = "a"), x = a, y = 0.05, label.r = unit(0, "lines")) +
  geom_label(aes(label = "b"), x = b, y = 0.05, label.r = unit(0, "lines"))

## -----------------------------------------------------------------------------
distributions +
  geom_vline(xintercept = c, linetype = "dashed") +
  geom_label(aes(label = "c"), x = c, y = 0.05, label.r = unit(0, "lines"))

## ---- fig.width=8-------------------------------------------------------------
library(clinicalsignificance)

check_cutoff(m_clinical = 32, sd_clinical = 7, m_functional = 10, sd_functional = 7, type = "c")

