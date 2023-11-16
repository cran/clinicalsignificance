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
# Basic clinical significance distribution analysis
antidepressants |>
  cs_distribution(patient, measurement, mom_di, reliability = 0.80)

## -----------------------------------------------------------------------------
# Turning off the warning by specifying pre-measurement time
cs_results <- antidepressants |>
  cs_distribution(
    patient,
    measurement,
    mom_di,
    pre = "Before",
    reliability = 0.80
  )

## -----------------------------------------------------------------------------
summary(cs_results)
plot(cs_results)
plot(cs_results, show = category)

## -----------------------------------------------------------------------------
# Clinical significance distribution analysis with more than two measurements
cs_results <- claus_2020 |>
  cs_distribution(
    id,
    time,
    hamd,
    pre = 1,
    post = 4,
    reliability = 0.80
  )

# Display the results
cs_results
summary(cs_results)
plot(cs_results)

## -----------------------------------------------------------------------------
# Clinical significance distribution analysis with a different RCI method
cs_results_ha <- claus_2020 |>
  cs_distribution(
    id,
    time,
    hamd,
    pre = 1,
    post = 4,
    reliability = 0.80,
    rci_method = "HA"
  )

# Display the results
summary(cs_results_ha)
plot(cs_results_ha)

## -----------------------------------------------------------------------------
# Grouped analysis
cs_results_grouped <- claus_2020 |>
  cs_distribution(
    id,
    time,
    hamd,
    pre = 1,
    post = 4,
    group = treatment,
    reliability = 0.80
  )

# Display the results
summary(cs_results_grouped)
plot(cs_results_grouped)

## -----------------------------------------------------------------------------
distribution_results_who <- claus_2020 |> 
  cs_distribution(
    id = id,
    time = time,
    outcome = who,
    pre = 1,
    post = 4,
    reliability = 0.85,
    better_is = "higher"
  )

distribution_results_who

# And plot the groups
plot(distribution_results_who)

## -----------------------------------------------------------------------------
# Clinical significance distribution analysis with HLM method
cs_results_hlm <- claus_2020 |>
  cs_distribution(
    id,
    time,
    hamd,
    rci_method = "HLM"
  )

# Display the results
summary(cs_results_hlm)
plot(cs_results_hlm)

