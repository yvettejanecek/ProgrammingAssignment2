## These functions will cache the inverse of a matrix

## This function creates a special "matrix" obect that will cache its inverse

makeCacheMatrix <- function(x = matrix()) {
	i <- NULL
	set <- function(y){	#set value of matrix
	x <<- y
	i <<- NULL
	}
	get <- function()x	#get value of matrix
	setinverse <- function(solve)i <<- solve    #set value of inverse
	getinverse <- function()i 	#get value of inverse
	list(set=set, get=get,
	     setinverse=setinverse,
	     getinverse=getinverse)
}


## This function checks if the inverse of a matrix is cached
## If so, it will use the cached matrix
## If not, it will compute the inverse and cache the inverse

cacheSolve <- function(x, ...) {
        i <- x$getinverse()
	if(!is.null(i)){		#check if inverse is cached
		message("getting cached data")
		return(i)		#if so, use cached inverse
	{				#if not,
	data <- x$get()			
	i <- solve(data, ...)		#calculate inverse
	x$setinverse(i)			#set inverser in cache
	i				#use inverse
}
