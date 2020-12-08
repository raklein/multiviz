# multiviz
Repository for experimenting with ways to visualize a multiverse analysis.

Currently, each contributor has their own folder to mess around in.

/data_examples/ contains shared base examples with results from multiverse analyses until we agree on an input format.

/data_examples/multidy_minimal_example.csv contains a 4-universe multiverse in the default format from the multidy R package. It was generated using data shared in this article: 10.1177/0956797614553947

Format:  
-.universe - Column indicating universe #  
-age_exclusions - Column indicating age exclusions  
-gender_exclusions - Column indicating gender exclusions  
-estimate - Estimate value for that universe  
-p.value - P value for that universe  






# Large data example format (each row one universe in the multiverse):
'data.frame':	2488320 obs. of  27 variables:
 - $ RRR    - RRR indicator
 - $ lab    - lab indicator 
 - $ effect_size  - hedge's g 
 - $ var_es     - variance in effect size 
 - $ p_value     -  p_value 
 - $ n1        - sample size treatment group
 - $ n2        - sample size control group
 - $ N          - total sample size      
 - $ excluded_percent  - what % of participants excluded from total sample size
 - columns s1:s2, e1:e7, u1:u9  - indicators of degrees of freedom, number {0,1, 2 , 3 et} indicates choice for each DF in that universe (row)
 
