## Put comments here that give an overall description of what your
## functions do
## These functions are written for the assignment of 
## week 3 of Coursera Datascience: R Programming 

## Write a short comment describing this function
## This function creates a special "matrix" object that can cache its inverse 

makeCacheMatrix <- function(x = matrix()) {
inv <-  NULL         ## this will hold value of matrix inverse
set <- function(y) { ## define the set function to assign new value of matrix
  x <<- y            ## in parent environment
  inv <<- NULL      ##if there's a new matrix set inverse to NULL
}
get <- function()x
setinverse <- function(inverse) inv <<- inverse ## assigns value of inv in parent environment
getinverse <- function() inv ## gets the value of inv when called
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

## Write a short comment describing this function
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed)
## then cacheSolve should retrieve the inverse from the cache.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
inv <- x$getinverse()
if(!is.null(inv)) { ## checks if inv is NULL
    message("getting cached data!")
  return(inv) ## returns inv value
  }
data <- x$get()  
inv <- solve(data, ...)
x$setinverse(inv)
inv
}