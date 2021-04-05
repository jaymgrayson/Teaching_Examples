# Looping, iteration and conditionals
rm(list=ls())
setwd("~/Desktop/Teaching_Examples")
u1 <- rnorm(30)
print("This loop calculates the square of the first 10 elements of vector u1")
# Initialize `usq`
usq <- 0
for(i in 1:10) {
    # i-th element of `u1` squared into `i`-th position of `usq`
    usq[i] <- u1[i]*u1[i]
    print(usq[i])
}
print(i)
rm(list=ls())
u1 <- rnorm(30)
print("This loop calculates the square of the first 10 elements of vector u1")
# Initialize `usq`
usq <- 0
for(i in seq_along(u1)) {
    # i-th element of `u1` squared into `i`-th position of `usq`
    usq[i] <- u1[i]*u1[i]
    print(usq[i])
}
print(i)
rm(list=ls())
x<-10
while (x>0){
    print (x)
    x<-x-1
}
print ("Loop Done")
rm(list=ls())
x<--50
while (x>0){
    print (x)
    x<-x-1
}
print ("Loop Done")
rm(list=ls())
x<-readline(prompt="Enter Age:")
x<-as.integer(x)
ifelse(x<50,("Still Young"),"Old as dirt!")
# Test changes
