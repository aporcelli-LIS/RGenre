install.packages("devtools")
install.packages("roxygen2")
install.packages("usethis")
install.packages("ggplot2")
install.packages("tidyverse")


library(ggplot2)
library(tidyverse)
library(devtools)
library(roxygen2)


  #Find the percentage of a genre from a collection

{
  dm<-as.integer(readline(prompt= "Total number of department materials: "))
  gm<-as.integer(readline(prompt="Total number of genre materials: "))


  #Find demand for a genre based upon material request

  ir<-as.integer(readline(prompt= "Total number of inbound materials request: "))
  irg<-as.integer(readline(prompt="Total number of inbound genre materials request: "))


  #Find demand for a genre based upon circulating materials

  tdm<-as.integer(readline(prompt= "Total circulated department materials: "))
  tgm<-as.integer(readline(prompt="Total circulated department materials of genre: "))


  divide<-function(x,y){
    return(x/y)
  }
  resulta <-(divide(gm, dm)*100)
  print(paste('Percentage of genre materials:', resulta))


  resultb <-(divide(irg, ir)*100)
  print(paste('Percentage of inbound genre materials requested:', resultb))


  resultc <-(divide(tgm, tdm)*100)
  print(paste('Percentage of circulating department genre materials:', resultc))


  #Determine demand of genre vs circulating materials

  gdp <-function(x,y,z){
    return((x+y)/z)
  }
  result<-(sum((tgm+irg)/tdm)*100)
  print(paste('Percentage of genre demand:', result))


  # Load ggplot2

  library(ggplot2)


  # Create data frame

  data <- data.frame(
    name=c("Genre Owned","Genre Circulating","Genre Demand") ,
    value=c(resulta, resultc, result)
  )


  ggplot(data, aes(x=name, y=value)) +
    geom_bar(stat = "identity")
}
