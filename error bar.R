#searching dataset

ToothGrowth
Tooth_data= ToothGrowth

#Creating a function for summarizing data
#based on grouping variable


data_summary = function (data , varname, groupnames){
  require(plyr)
  
  summary_func = function (x, col){
    c(mean= mean(x[[col]]), na.rm= TRUE, sd   = sd(x[[col]],   na.rm = TRUE)) 
  }
      data_sum = ddply(data, groupnames, .fun= summary_func, varname)
      data_sum= rename (data_sum, c("mean"= varname))
    return(data_sum)}


d_summary= data_summary(Tooth_data, varname= "len", 
                        groupnames= c("supp", "dose"))


#converting dose to a factor

d_summary$dose = as.factor(d_summary$dose)


class(d_summary$dose)

#SD of the mean as error bar with explanation

library(ggplot2)

ggplot(d_summary, aes(x=dose, y= len, fill = supp))+
  geom_bar(stat="identity", position = position_dodge())+
  geom_errorbar(aes(ymin = len- sd ,ymax = len + sd ),width = 0.2, position = position_dodge(.8))+
  theme_minimal()


