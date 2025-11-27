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

## ----individual-basic---------------------------------------------------------
# Analyze individual change from the first to the fourth measurement
anchor_individual <- claus_2020 |> 
  cs_anchor(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    mid_improvement = 7
  )

# Print the summary table
anchor_individual

## ----individual-plot----------------------------------------------------------
plot(anchor_individual)

## ----individual-grouped-------------------------------------------------------
anchor_grouped <- claus_2020 |> 
  cs_anchor(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    mid_improvement = 7,
    group = treatment
  )

# Print results by group
summary(anchor_grouped)

# Plot results by group
plot(anchor_grouped)

## ----positive-outcome---------------------------------------------------------
anchor_positive <- claus_2020 |> 
  cs_anchor(
    id = id,
    time = time,
    outcome = who,
    pre = 1,
    post = 4,
    mid_improvement = 4,
    better_is = "higher"
  )

plot(anchor_positive)

## ----group-within-------------------------------------------------------------
anchor_group_within <- claus_2020 |> 
  cs_anchor(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    mid_improvement = 7,
    target = "group",
    group = treatment
  )

anchor_group_within

## ----group-between------------------------------------------------------------
anchor_group_between <- claus_2020 |> 
  cs_anchor(
    id = id,
    time = time,
    outcome = bdi,
    post = 4, # Only post is needed here, as we compare change scores
    mid_improvement = 7,
    target = "group",
    group = treatment,
    effect = "between"
  )

anchor_group_between

