getwd()
setwd('/Users/vipeenkumar/Downloads/python and R studio study material/RStudio Practice')
print('hello world')
(1+1)
((1+1)/100)
((1+1)/100)

print ('remainder of 17%%5 is : ') 17%%5
library(readxl)
sum()
x<-c(3.4,5.2,4.5,34.3,32)
x<-t(3.4,2.4,4.5,34.3,32)


library(readxl)

install.packages('readxl')
library(remotes)
remotes::install_github('rstudio/shiny')

depthgroup <- equal.count(quakes$depth, number=3, overlap=0)



labelvp <- function(name, col="grey", tcol="white", clipOff=TRUE) {
  seekViewport(name)
  if (clipOff)
    pushViewport(viewport(clip="off"))
  grid.rect(gp=gpar(col=col, lwd=5))
  grid.rect(x=0, y=1, width=unit(1, "strwidth", name) + unit(2, "mm"),
            height=unit(1, "lines"), just=c("left", "top"),
            gp=gpar(fill=col, col=NULL))
  grid.text(name, x=unit(1, "mm"), y=unit(1, "npc") - unit(1, "mm"),
            just=c("left", "top"), gp=gpar(col=tcol))
  upViewport(0)
}



lvp <- viewport(x=0, 
                width=unit(1, "npc") - unit(1, "inches"),
                just="left", name="lvp")
tvp <- viewport(x=1, width=unit(1, "inches"), 
                just="right", name="tvp")



lplot <- xyplot(lat ~ long | depthgroup, 
                data=quakes, pch=".",
                layout=c(1, 3), aspect=1, 
                index.cond=list(3:1))



trellis.par.set(theme = canonical.theme("postscript", col=FALSE))
pushViewport(lvp)
print(lplot, newpage=FALSE, prefix="plot1")
upViewport()

labelvp("lvp")
labelvp("plot1.panel.1.3.off.vp")
pushViewport(tvp)
grid.text("Largest\nEarthquake", x=unit(2, "mm"), 
          y=unit(1, "npc") - unit(0.5, "inches"), 
          just="left")

labelvp("tvp")
downViewport("tvp")
grid.move.to(unit(1, "mm"), 
             unit(1, "npc") - unit(0.5, "inches"))
seekViewport("plot1.panel.1.3.off.vp")
grid.arrows(grob=lineToGrob(unit(167.62, "native") +
                              unit(1, "mm"),
                            unit(-15.56, "native")),
            length=unit(3, "mm"), type="closed", 
            angle=10, gp=gpar(fill="black"))
grid.circle(unit(167.62, "native"), 
            unit(-15.56, "native"),
            r=unit(1, "mm"),
            gp=gpar(lwd=0.1))


pushViewport(viewport(layout=grid.layout(2, 2), gp=gpar(cex=0.6)))x=4

pushViewport(viewport(layout.pos.col=1, layout.pos.row=1))
pushViewport(plotViewport(c(5, 4, 2, 2)))
pushViewport(dataViewport(pressure$temperature, 
                          pressure$pressure,
                          name="plotRegion"))

grid.points(pressure$temperature, pressure$pressure, 
            gp=gpar(cex=0.5))
grid.rect()
grid.xaxis()
grid.yaxis()
grid.text("temperature", y=unit(-3, "lines"))
grid.text("pressure", x=unit(-3, "lines"), rot=90)

popViewport(3)
pushViewport(viewport(layout.pos.col=2, layout.pos.row=1))
pushViewport(plotViewport(c(5, 4, 2, 2)))
pushViewport(dataViewport(pressure$temperature, 
                          pressure$pressure,
                          name="plotRegion"))

grid.points(pressure$temperature, pressure$pressure, pch=2, 
            gp=gpar(cex=0.5))
grid.rect()
grid.xaxis()
grid.yaxis()
grid.text("temperature", y=unit(-3, "lines"))
grid.text("pressure", x=unit(-3, "lines"), rot=90)

popViewport(3)
pushViewport(viewport(layout.pos.col=2, layout.pos.row=2))
pushViewport(plotViewport(c(5, 4, 2, 2)))
pushViewport(dataViewport(pressure$temperature, 
                          pressure$pressure,
                          name="plotRegion"))

grid.points(pressure$temperature, pressure$pressure, pch=2, 
            gp=gpar(cex=0.5))
grid.rect()
grid.xaxis()
grid.yaxis()
grid.text("temperature", y=unit(-3, "lines"))
grid.text("pressure", x=unit(-3, "lines"), rot=90)

upViewport(2)
grid.rect(gp=gpar(lty="dashed"))
downViewport("plotRegion")
grid.text("Pressure (mm Hg)\nversus\nTemperature (Celsius)",
          x=unit(150, "native"), y=unit(600, "native"))

hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }
h8 <- hilbert(8); h8
sh8 <- solve(h8)
round(sh8 %*% h8, 3)

A <- hilbert(4)
A[] <- as.complex(A)
## might not be supported on all platforms
try(solve(A))

A = matrix(
     
       # Taking sequence of elements  
       c(2,-1,3,0,1,-1,1,1,-1), 
    
       # No of rows
       nrow = 3,   
     
       # No of columns
       ncol = 3,         
     
       # By default matrices are in column-wise order
       # So this parameter decides how to arrange the matrix
     byrow = TRUE         
  )
A
A

B = matrix(
  
  # Taking sequence of elements  
  c(9,-1,0), 
  
  # No of rows
  nrow = 3,   
  
  # No of columns
  ncol = 1,         
  
  # By default matrices are in column-wise order
  # So this parameter decides how to arrange the matrix
  byrow = TRUE   
  
  A = matrix(
    c(1, 2, 3, 4, 5, 6, 7, 8, 9), 
    nrow = 3,             
    ncol = 3,             
    byrow = TRUE         
  )
  cat("The 3x3 matrix:\n")
  print(A)
  
  cat("Dimension of the matrix:\n")
  print(dim(A))
  
  cat("Number of rows:\n")
  print(nrow(A))
  
  cat("Number of columns:\n")
  print(ncol(A))
  
  cat("Number of elements:\n")
  print(length(A))
  # OR
  print(prod(dim(A)))
  
  
  A = matrix(
    c(1, 2, 3, 4, 5, 6, 7, 8, 9), 
    nrow = 3,             
    ncol = 3,             
    byrow = TRUE         
  )
  cat("The 3x3 matrix:\n")
  print(A)
  
  # Creating another 1x3 matrix
  B = matrix(
    c(10, 11, 12),
    nrow = 1,
    ncol = 3
  )
  cat("The 1x3 matrix:\n")
  print(B)
  
  # Add a new row using rbind()
  C = rbind(A, B)
  
  cat("After concatenation of a row:\n")
  print(C)