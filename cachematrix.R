## The two following funtions are used to cache inverse matrix

## The makeCacheMatrix function get/set the matrix and get/set inverse matrix.

  makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
      x <<- y
      inv <<- NULL
    }
    
    get <- function() x
    
    setinverse <- function(inverse) 
    inv <<- inverse
    getinverse <- function() 
    inv
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
  }
  
  #The cacheSolve function returns the inverse of the matrix created by makeCacheMatrix.
  
    cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    if(!is.null(inv)) {
      message("getting cached data.")
      return(inv)
    }
    data <- x$get()
    inv <- solve(data)
    x$setinverse(inv)
    inv
  }

  ##Exemplo
  
  x<-matrix(c(3,4,5,6),2,2); x
  a<-makeCacheMatrix(x)
  a$get()
  
  b<-cacheSolve(a)
  b
  b<-cacheSolve(a)

