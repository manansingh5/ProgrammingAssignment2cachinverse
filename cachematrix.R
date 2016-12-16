## Entire code is divided into 2 functions, first to create the matrix & second to 
## calculate the inverse. The whole point being caching the results for later use

## We are using the "<<-" operator here to sav the matrix & its inverse in a 
## different environment, so as to be cached later when needed

 
## This function creates a special matrix, which is a list containging 4 steps i.e.
## 1. set the matrix, 2. get the matrix, 3. set the inverse, 4. get the inverse

makeCacheMatrix <- function(x = matrix()) {
i <- NULL
set <- function(y){
x <<-y
i <<- NULL}

get <- function() x
setinverse <- function(inverse) i<<-inverse
getinverse <- function() i
list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## This function calculates the inverse on the matrix created above, 
##but first it checks if it has already been calculated, if yes, 
##it takes ythe value from the cache. If not, it calculates the inverse & stores it in the cache 
## for the next time using the setinverse function there.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
i <- x$getinverse()
if(!is.null(i)){
message("getting cached data")
return(i)
}
data<- x$get()
i<- solve(mat, ...)
x$setinverse(i)
i
}
