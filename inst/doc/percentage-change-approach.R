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
pct_results <- antidepressants |> 
  cs_percentage(
    id = patient,
    time = measurement,
    outcome = mom_di,
    pct_improvement = 0.3
  )

## -----------------------------------------------------------------------------
# Turning off the warning by specifying pre-measurement time
pct_results <- antidepressants |>
  cs_percentage(
    id = patient,
    time = measurement,
    outcome = mom_di,
    pre = "Before",
    pct_improvement = 0.5
  )

## -----------------------------------------------------------------------------
# Print the results
pct_results

# Get a summary
summary(pct_results)

## -----------------------------------------------------------------------------
# Plot the results
plot(pct_results)

# Show clinical significance categories
plot(pct_results, show = category)

## -----------------------------------------------------------------------------
# Clinical significance distribution analysis with more than two measurements
cs_results <- claus_2020 |>
  cs_percentage(
    id,
    time,
    bdi,
    pre = 1,
    post = 4,
    pct_improvement = 0.3
  )

# Display the results
cs_results
summary(cs_results)
plot(cs_results)

## -----------------------------------------------------------------------------
# Clinical significance analysis with different improvement and deterioration thresholds
cs_results_2 <- claus_2020 |>
  cs_percentage(
    id = id,
    time = time,
    outcome = hamd,
    pre = 1,
    post = 4,
    pct_improvement = 0.3,
    pct_deterioration = 0.2
  )

# Display the results
cs_results_2

# Visualize the results
plot(cs_results_2)

## -----------------------------------------------------------------------------
cs_results_grouped <- claus_2020 |>
  cs_percentage(
    id = id,
    time = time,
    outcome = hamd,
    pre = 1,
    post = 4,
    pct_improvement = 0.3,
    group = treatment
  )

# Display and visualize the results
cs_results_grouped
plot(cs_results_grouped)

## -----------------------------------------------------------------------------
# Clinical significance analysis for outcomes where higher values are better
cs_results_who <- claus_2020 |>
  cs_percentage(
    id = id,
    time = time,
    outcome = who,
    pre = 1,
    post = 4,
    pct_improvement = 0.3,
    better_is = "higher"
  )

# Display the results
cs_results_who

