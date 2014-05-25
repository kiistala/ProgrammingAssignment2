## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix())
{
  c <- NULL

  set <- function(y) {
	x <<- y
	c <<- NULL
  }
  
  get <- function() x

  setc <- function(solve) c <<- solve
  
  getc <- function() c
  
  list(set = set, get = get,
       setc = setc,
       getc = getc)
}


## This 

cacheSolve <- function(x)
{
   ## Return a matrix that is the inverse of 'x'
   c <- x$getc()

   if(!is.null(c))
   {
     message("getting cached data")
     return(c)
   }
   
   data <- x$get()
   c <- solve(data)
   x$setc(c)
   c
}
