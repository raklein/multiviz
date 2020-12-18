#********************************************************************************

##Project: Multiviz
##Script purpose: Example code to show illustrate a plot using large dataset
##Code: Anton Olsson Collentine (anton@olssoncollentine.com)

##Comment: The code in this file is adapted from the "meta-analyzing the
#multiverse" project, by making it apply to a single lab instead of multiple.
#Hence, some parts of the funnel_hex function are not strictly necessary, but I
#have left them in for the additional information they provide

#********************************************************************************

library(ggplot2)

#********************************************************************************
#Functions----
#********************************************************************************
#funnel plot lines. 
#See also: https://stats.stackexchange.com/questions/5195/how-to-draw-funnel-plot-using-ggplot2-in-r

d_critical <- function(min_N, max_N){ #Min_N/Max_N is the min/max sample sizes in study (or across labs if multiple)
  N <- seq.int(from = min_N, to = max_N + 10) #add a little extra on top for a nicer graph
  t_lower <- qt(0.025, df = N - 2) #t-distribution
  t_upper <- qt(0.975, df = N - 2)
  multiplier <- sqrt(N / (N/2)^2) #transform t to d assuming n1 = n2, see e.g., Cooper et al., p.228, table 12.1 row 2
  lower <- t_lower*multiplier #critical d-values
  upper <- t_upper*multiplier
  data.frame(y_value = N, lower, upper)
}


#Hexplot. Plot a funnel plot but with hexagons instead of points (necessary for for larger dataframes like RRR05 and RRR07)
funnel_hex <- function(data, title, funnel_line, x_label, y_label){ 
  
  ggplot() + 
    geom_hex(aes(x = effect_size, y = y_value), data = data) + #above part not needed 
    geom_line(aes(y = y_value, x = lower, linetype = "dashed"), data = funnel_line, alpha = 0.5) + #funnel lines
    geom_line(aes(y = y_value, x = upper, linetype = "dashed"), data = funnel_line, alpha = 0.5) +
    geom_vline(xintercept = 0, linetype = "dotted", alpha = 0.5) +
    
    scale_fill_viridis_c(trans = "log", labels = round) + #color blind friendly color scale and on a log scale so not most values are just dark. rounding to make labels nicer than log-scale makes them
    scale_x_continuous(breaks = scales::pretty_breaks(n = 3)) + #set number of breaks but not values, scales is automatically imported
    theme_classic() +
    theme(panel.border = element_rect(fill = NA, colour = "black", size = 0.5, linetype = "solid")) +
    guides(linetype = FALSE,#remove legend for linetype (geom_line)
           color = guide_legend(override.aes = list(alpha = 1, #make color legend visible instead of having alpha = 0.05 as the points
                                                    shape = 15, #make the color legend symbols square instead of points
                                                    size = 4.5))) + #and increase their size
    xlab(x_label) +
    ylab(y_label) +
    ggtitle(title)
  
}
#********************************************************************************
#Data preparation and plotting----
#********************************************************************************
dat <- readRDS("../data_examples/large_example_RRR5_exit_L02.RDS") 

dat <- dat[dat[["n1"]] >= 24 & dat[["n2"]] >= 24,] #filter on sample size, 24 = median sample size in psychology
dat <- dat[,c("lab", "effect_size", "var_es", "p_value", "N")] #only keep the variables used to minimize data.frame size
#dat[["p_value"]] <- ifelse(dat[["p_value"]] > 0.05, "Non-sig", "Sig") #categorical whether sig. at alpha = 0.5 [for improved plotting]

#create lines for funnel in plot
max_N <- max(dat[["N"]]) 
min_N <- min(dat[["N"]])
funnel_line <- d_critical(min_N, max_N)

#Prep labels for plotting
names(dat)[names(dat) == "N"] <- "y_value" #this is a fix because of adapting the code (orignally, to make funnel_hex work for both logor and smd y-axis name needed to be consistent)
y_label <-  "N" 
x_label <- "Standardized Mean Difference"
plot_title <- "RRR05 Exit L02 Multiverse"

#create plot
funnel_hex(data = dat, title = plot_title, funnel_line = funnel_line, x_label = x_label, y_label = y_label)

#ggsave("funnel-large.png")

#A small note on hexplot
#With very few unique observations geom_hex breaks down
#In that case, we can plot them with square bins instead
#geom_bin2d(aes(x = effect_size, y = y_value), data = data)
#However, this may make figures look a little blurry, so better to keep hexagonal bins whenever possible
  