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
