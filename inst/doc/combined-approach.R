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
combined_results <- antidepressants |> 
  cs_combined(
    id = patient,
    time = measurement,
    outcome = mom_di,
    m_functional = 7,
    sd_functional = 7,
    cutoff_type = "c",
    mid_improvement = 8
  )

## -----------------------------------------------------------------------------
# Turning off the warning by specifying pre-measurement time
combined_results <- antidepressants |> 
  cs_combined(
    id = patient,
    time = measurement,
    outcome = mom_di,
    pre = "Before",
    m_functional = 7,
    sd_functional = 7,
    cutoff_type = "c",
    mid_improvement = 8
  )

## -----------------------------------------------------------------------------
# Print the results
combined_results

# Get a summary
summary(combined_results)

## -----------------------------------------------------------------------------
# Plot the results
plot(combined_results)

# Show clinical significance categories
plot(combined_results, show = category)

## -----------------------------------------------------------------------------
# Clinical significance distribution analysis with more than two measurements
cs_results <- claus_2020 |>
  cs_combined(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    m_functional = 7,
    sd_functional = 7,
    cutoff_type = "c",
    mid_improvement = 8
  )

# Display the results
cs_results
summary(cs_results)
plot(cs_results)

## -----------------------------------------------------------------------------
cs_results_grouped <- claus_2020 |>
  cs_combined(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    m_functional = 7,
    sd_functional = 7,
    cutoff_type = "c",
    mid_improvement = 8,
    group = treatment
  )

# Display and visualize the results
cs_results_grouped
plot(cs_results_grouped)

## -----------------------------------------------------------------------------
# Clinical significance analysis for outcomes where higher values are better
cs_results_who <- claus_2020 |>
  cs_combined(
    id,
    time,
    who,
    pre = 1,
    post = 4,
    m_functional = 7,
    sd_functional = 7,
    cutoff_type = "c",
    mid_improvement = 8,
    better_is = "higher"
  )

# Display the results
cs_results_who

## -----------------------------------------------------------------------------
jt_results <- antidepressants |> 
  cs_combined(
    id = patient,
    time = measurement,
    outcome = mom_di,
    pre = "Before",
    m_functional = 7,
    sd_functional = 7,
    cutoff_type = "c",
    reliability = 0.80
  )

# Summarize and visualize the results
summary(jt_results)
plot(jt_results)
plot(jt_results, show = category)

