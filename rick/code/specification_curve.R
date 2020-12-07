# Implementing the specification curve visualization example code from the multidy package
# in a more flexible/user-friendly function

# Note: Currently only generates the upper panel, not the plot that lays out the analyses

library("tidyverse") # required
library("rlang") # for making functions for ggplot2 -- lets you refer to columns by name without quotes.

# rlang package and use of {{}} around column names in the function allows us to
# refer to columns by name without quotes (as typical in tidyverse) whereas base R
# requires column names in quotes.

multidy_minimal_example <- read.csv("./data_examples/multidy_minimal_example.csv")

sc_fun <- function(df, universe_col, estimate_col, p_col){
  specification_curve <- df %>%
    ggplot() +
    geom_point(aes({{universe_col}}, {{estimate_col}}, color = (p.value < 0.05)), size = 2) +
    labs(x = "Universe", y = "Result")
  return(specification_curve)
}

sc_fun(df = multidy_minimal_example, universe_col = .universe, estimate_col = estimate, p_col = p.value)

# select all except
# data.spec_curve[, !names(data.spec_curve) %in% c(".universe", "estimate", "p.value")]