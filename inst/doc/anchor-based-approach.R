## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(clinicalsignificance)

antidepressants
claus_2020

## -----------------------------------------------------------------------------
anchor_results <- antidepressants |> 
  cs_anchor(
    id = patient,
    time = measurement,
    outcome = mom_di,
    mid_improvement = 7
  )

## -----------------------------------------------------------------------------
anchor_results <- antidepressants |> 
  cs_anchor(
    id = patient,
    time = measurement,
    outcome = mom_di,
    pre = "Before",
    mid_improvement = 7
  )

## -----------------------------------------------------------------------------
# Print the results
anchor_results

# Get a summary
summary(anchor_results)

## -----------------------------------------------------------------------------
# Plot the results
plot(anchor_results)

# Show clinical significance categories
plot(anchor_results, show = category)

## -----------------------------------------------------------------------------
claus_results <- claus_2020 |> 
  cs_anchor(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    mid_improvement = 7
  )

summary(claus_results)
plot(claus_results)

## -----------------------------------------------------------------------------
anchor_results_grouped <- claus_2020 |> 
  cs_anchor(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    mid_improvement = 7,
    group = treatment
  )

anchor_results_grouped

# And plot the groups
plot(anchor_results_grouped)

## -----------------------------------------------------------------------------
anchor_results_who <- claus_2020 |> 
  cs_anchor(
    id = id,
    time = time,
    outcome = who,
    pre = 1,
    post = 4,
    mid_improvement = 4,
    better_is = "higher"
  )

anchor_results_who

# And plot the groups
plot(anchor_results_who)

## -----------------------------------------------------------------------------
anchor_results_group_level <- claus_2020 |> 
  cs_anchor(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    mid_improvement = 7,
    target = "group"
  )

## -----------------------------------------------------------------------------
summary(anchor_results_group_level)

## -----------------------------------------------------------------------------
claus_2020 |> 
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

## -----------------------------------------------------------------------------
claus_2020 |> 
  cs_anchor(
    id = id,
    time = time,
    outcome = bdi,
    post = 4,
    mid_improvement = 7,
    target = "group",
    group = treatment,
    effect = "between"
  )

