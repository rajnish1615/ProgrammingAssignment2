# These function together are able to retrieve a cached inverse matrix, otherwise it's ca;lculated ans returned

# This functions provides a list of functions for setting and getting both the matrix and its inverse
makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() {
                x
        }
        setinv <- function(inverse) {
                inv <<- inverse
        }
        getinv <- function() {
                inv
        }
        list(set = set, get = get, setinv = setinv, getinv = getinv)
}

#This function takes as input the list produced by last function, checks if the inverse is in cache, if yes,
# returns it directly, otherwise calculates it and returns
cacheSolve <- function(x, ...) {
        inv <- x$getinv()
        if (!is.null(inv)){
                message("getting cached data")
                return(inv)
        }
        mat <- x$get()
        inv = solve(mat, ...)
        x$setinv(inv)
        return(inv)
}