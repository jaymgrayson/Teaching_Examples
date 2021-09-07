# Exceptions and Breaks
# Jason M. Grayson
# Started 09-06-21


# Create Fibonacci sequence generator with "off" switch
rm(list=ls())
fib_a<-1
fib_b<-1
while (fib_b<150) {
    temp<-fib_a+fib_b
    fib_a<-fib_b
    fib_b<-temp
    cat(fib_b,", ",sep="")

}

# No stop
rm(list=ls())
fib_a<-1
fib_b<-1
repeat {
    temp<-fib_a+fib_b
    fib_a<-fib_b
    fib_b<-temp
    cat(fib_b,", ",sep="")
}
# Hardstop
rm(list=ls())
fib_a<-1
fib_b<-1
repeat {
    temp<-fib_a+fib_b
    fib_a<-fib_b
    fib_b<-temp
    cat(fib_b,", ",sep="")
    if(fib_b>150){
        cat ("Stopping Now....\n")
        break
    }
}
#Now lets make a function
rm(list=ls())
myfib<-function(){
    fib_a<-1
    fib_b<-1
    cat(fib_a,", ",fib_b,", ", sep="")
    repeat {
        temp<-fib_a+fib_b
        fib_a<-fib_b
        fib_b<-temp
        cat(fib_b,", ",sep="")
        if(fib_b>150){
            cat ("Stopping Now....\n")
            break
        }
    }
}
myfib()
# Lets make it more R like
#Now lets make a function
rm(list=ls())
myfib<-function(thresh){
    fibseq<-c(1,1)
    counter<-2
    repeat {
        fibseq<-c(fibseq,fibseq[counter-1]+fibseq[counter])
        counter<-counter+1
        if(fibseq[counter]>thresh){
            break
        }
    }
    return(fibseq)
}
myfib(150)

# Errors and warnings
warn_test<-function(x){
    if(x<=0){
        warning("x less than 0 but setting it to 1 and continuing")
        x<-1
    }
    return(5/x)
}
warn_test(2)
warn_test(-1)

error_test<-function(x){
    if(x<=0){
        stop("x less than 0 stopping")
        x<-1
    }
    return(5/x)
}
error_test(2)
error_test(-1)

myfib2<-function(n){
    if (n<0){
        warning("Assuming you want n to be positive, doing that")
        n<-n*-1
        
    } else if (n==0) {
        stop("n is not interpretable at 0")
    }
    if (n==1|n==2){
        return(1)
    } else {
        return(myfib2(n-1)+myfib2(n-2))
    }
}
myfib2(-1)
myfib2(0)
myfib2(4)
# Lets try something new (drums)
attempt1<-try(myfib2(0),silent=TRUE)
attempt1
attempt1<-try(myfib2(0),silent=FALSE)
attempt1

myfibvector<-function(nvec){
    nterms<-length(nvec)
    result<-rep(0,nterms)
    for(i in 1:nterms){
        result[i]<-myfib2(nvec[i])
    }
    return(result)
}
foo<-myfibvector(nvec=c(1,2,10,8))
foo
bar<-myfibvector(nvec=c(3,2,7,0,9,13))
myfibvectorTRY<-function(nvec){
    nterms<-length(nvec)
    result<-rep(0,nterms)
    for(i in 1:nterms){
        attempt<-try(myfib2(nvec[i]),silent=TRUE)
        if(class(attempt)=="try-error"){
            result[i]<-NA
        }else{
            result[i]<-attempt
        }
    }
    return(result)
}
barTRY<-myfibvectorTRY(nvec=c(3,2,7,0,9,13))
barTRY

fib_calculator <- function(n){
    tryCatch(
        expr = {
            message(myfib2(n))
            message("Successfully executed the myfib2 call.")
        },
        error = function(e){
            message('Caught an error!')
            print(e)
        },
        warning = function(w){
            message('Caught an warning!')
            print(w)
        },
        finally = {
            message('All done, quitting.')
        }
    )    
}
