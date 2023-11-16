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
stat_results <- antidepressants |> 
  cs_statistical(
    id = patient,
    time = measurement,
    outcome = mom_di,
    m_functional = 7,
    sd_functional = 7,
    cutoff_type = "c"
  )

## -----------------------------------------------------------------------------
# Turning off the warning by specifying pre-measurement time
stat_results <- antidepressants |>
  cs_statistical(
    id = patient,
    time = measurement,
    outcome = mom_di,
    pre = "Before",
    m_functional = 7,
    sd_functional = 7,
    cutoff_type = "c"
  )

## -----------------------------------------------------------------------------
# Print the results
stat_results

# Get a summary
summary(stat_results)

## -----------------------------------------------------------------------------
# Plot the results
plot(stat_results)

# Show clinical significance categories
plot(stat_results, show = category)

## -----------------------------------------------------------------------------
# Clinical significance distribution analysis with more than two measurements
cs_results <- claus_2020 |>
  cs_statistical(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    m_functional = 7,
    sd_functional = 7,
    cutoff_type = "c"
  )

# Display the results
cs_results
summary(cs_results)
plot(cs_results)

## -----------------------------------------------------------------------------
cs_results_grouped <- claus_2020 |>
  cs_statistical(
    id = id,
    time = time,
    outcome = bdi,
    pre = 1,
    post = 4,
    m_functional = 7,
    sd_functional = 7,
    cutoff_type = "c",
    group = treatment
  )

# Display and visualize the results
cs_results_grouped
plot(cs_results_grouped)

## -----------------------------------------------------------------------------
# Clinical significance analysis for outcomes where higher values are better
cs_results_who <- claus_2020 |>
  cs_statistical(
    id,
    time,
    who,
    pre = 1,
    post = 4,
    m_functional = 7,
    sd_functional = 7,
    cutoff_type = "c",
    better_is = "higher"
  )

# Display the results
cs_results_who

