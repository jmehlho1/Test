# Test

# Load relevant libraries.
library(ggplot2) 
library(reshape2)
library(gridExtra)
library(GGally)
library(network)
library(sna)

require(scales,quietly=TRUE)
require(RColorBrewer, quietly=TRUE)

# create data:
links=data.frame(
  source=c("A","C", "D", "E", "F","G", "H","I","K","L","M","N","P","Q","R","S","T","V","W","Y"),
  target=c("C","D", "H", "T", "Q","R", "L","F","P","N","W","Y","A","C","D","Q","C","H","V","S")
)

weights <- c(1,2,1,2,1,3,1,2,1,2,1,2,1,2,1,2,1,2,1,2)
colors <- c('blue','blue','grey','red','red','grey','blue','red','grey','blue','red','grey','blue','blue','red','blue','red','blue','red','grey')

# create the network object
net = network(links, directed = FALSE, matrix.type="edgelist")


p1 <-  ggnet2(net, mode = "circle", label = c("A","C", "D", "E", "F","G", "H","I","K","L","M","N","P","Q","R","S","T","V","W","Y")
              ,label.color='black',node.color='grey',edge.color='black',edge.size=weights)

p2 <- ggnet2(net, mode = "circle", label = c("A","C", "D", "E", "F","G", "H","I","K","L","M","N","P","Q","R","S","T","V","W","Y")
             ,label.color='black',node.color='grey',edge.color=colors,edge.size=1)


# Generate nice, formatted plots using ggplot. 
x11() # Open a new figure window. 

out <- grid.arrange(p1,p2,nrow=2,ncol=1) # Plot in the same figure

ggsave(file="Test.pdf",plot=out,width=6,height=12)
