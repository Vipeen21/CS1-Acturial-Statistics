outcomes<-c(-400,0,100,800)
prob<-c(0.32,0.48,0.15,0.05)
barplot(outcomes,prob,xlab="outcomes", ylab= "probabilities",main = "bar graph of outcomes and respective probabilities")
cumul<-outcomes*prob/sum(outcomes*prob)
cumul
plot(cumul,main = "cumulative probabilites")
lines(cumul)
x<-outcomes*prob
mean(x)
sqrt(var(x))

ppois(70,lambda= 107)
dpois(70,lambda= 107)
print(1-dpois(70,107))
ppois(0,107)
x<-dpois(150,107)
y<-dpois(60,107)
plot(ppois(150, lambda = 107) - ppois(60, lambda = 107))
for(i in 60:150)
{x[i]<-ppois(i, 107);
print(x[i])
}
x
plot(x,main= "pmf of 60<=Y<=150", ylab= "poisson mass function", xlim = c(60,150))

set.seed(2025)
rpois(260,107)
hist(rpois(260,107), main ="histogram of simulation", xlim= c(60,150))

     