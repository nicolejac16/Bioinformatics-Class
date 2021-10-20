# Class 5: Data visualization Nicole Jacobson

#will learn how to use an array of plots using the ggplot2 package using prebuilt cars dataset

#looks at the top of the data set

head(cars)

# all ggplots have at least 3 layers (data, ascetics -> x/y axis, labels ine color/thickness etc., 
# geometry -> type of graph ie scatter, bar, etc.)

#method=lm linear model will linearize the smooth line of best fit line, otherwise it will be curved
library(ggplot2)

ggplot(cars) + aes(x=speed, y=dist) + geom_point() + geom_smooth(method="lm") + 
  ggtitle("Stopping Distance of Old Cars") + labs( x="Speed (MPH)", y="Stopping Distance (ft)")

url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

nrow(genes)
ncol(genes)

# calls a  particular column from that dataset. Tells me how many ups, downs, and unchanging there are in this column

table(genes$State)


#what percent of total genes are up-regulated in this dataset? Here is the percent of genes that are up, down, unchange 
# by dividing table of the column State  by the total number of entries which is nrow(genes)
#  x100 is to turn it into percent, 2 is how many significant digits
# round will round the number to how many significant digits we want

round( table(genes$State)/nrow(genes) * 100, 2)

ggplot(genes) + aes(x=Condition1, y=Condition2) + geom_point()

p <- ggplot(genes) + aes(x=Condition1, y=Condition2, col=State) + geom_point() + labs(x="control (no drug)", y="Drug Treatment") + ggtitle("Gene Expression Changes Upon Drug Treatment")

p + scale_colour_manual(values=c("yellow3", "tomato2", "chartreuse"))


#now let's explore the gapminder dataset

#install.packages("gapminder")
library(gapminder)
head(gapminder)

ggplot(gapminder) + aes(x=year, y=lifeExp, col=continent) + geom_jitter(width=0.3, alpha=0.4) + 
  geom_violin(aes(group=year), alpha=0.2, draw_quantiles=0.5)


#install.packages("dplyr")
library(dplyr)

gapminder_2007 <- gapminder %>% filter(year==2007)

gapminder_2007

ggplot(gapminder_2007) + aes(x=gdpPercap, y=lifeExp) + geom_point(alpha=0.5)









