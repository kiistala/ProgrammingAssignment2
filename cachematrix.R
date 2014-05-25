## This file has two functions that help save 
## computer time by caching the result of solve() function

## This function creates a special function that has 
## many functions inside it

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


## This function uses the cached inverse matrix
## if there is one
## If there is not, it puts a cached matrix into
## the special variable

cacheSolve <- function(x)
{
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
