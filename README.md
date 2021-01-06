# multiviz
Repository for experimenting with ways to visualize a multiverse analysis.

Currently, each contributor has their own folder to mess around in.

/data_examples/ contains shared base examples with results from multiverse analyses until we agree on an input format.

### Data examples

1)  __Small data example__

/data_examples/multidy_minimal_example.csv contains a 4-universe multiverse in the default format from the multidy R package. It was generated using data shared in this article: 10.1177/0956797614553947

Format:  
-.universe - Column indicating universe #  
-age_exclusions - Column indicating age exclusions  
-gender_exclusions - Column indicating gender exclusions  
-estimate - Estimate value for that universe  
-p.value - P value for that universe  


2) __Large data example__ 

/data_examples/large_example_RRR5_exit_L02.RDS contains a 2,488,320-universe multiverse in the format used by Anton in the 'meta-analyzing the multiverse' article (not yet online). Each row is one row in the multiverse.

Format:
- 'data.frame':	2488320 obs. of  27 variables:
 -  RRR    - RRR indicator
 -  lab    - lab indicator 
 -  effect_size  - hedge's g 
 -  var_es     - variance in effect size 
 -  p_value     -  p_value 
 -  n1        - sample size treatment group
 -  n2        - sample size control group
 -  N          - total sample size      
 -  excluded_percent  - what % of participants excluded from total sample size
 - s1:s2, e1:e7, and u1:u9  - indicators of degrees of freedom, number {0,1, 2 , 3 et} indicates choice for each DF in that universe (row)
 
 
## Examples of possible plots

Here is an example of a funnel plot of the multiverse using the large dataset. Effect sizes have been binned into hexagons, and the y-axis uses the N rather than SE since most researcher degrees of freedom in the large dataset relate to data exclusions. Code to reproduce the plot can be found at anton/funnel-plot_code_large-data.r

<img src="https://github.com/raklein/multiviz/blob/main/anton/funnel-large.png" width="370" height = "500">

## Contributors/team
Anton Collentine  
Amir Abdol  
Rick Klein  
Marcel Van Assen  
Michele Nuijten  
