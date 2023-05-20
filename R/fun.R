# datasetR

### generate dataframe with dimensions (n*m)
### generate matrix with dimensions (n*m)
### generate vectors with dimension (m)

### Generate vectors of variables (1x integer, 1x categorical, 1x ordinal, 1x binary)

### generate_dataframe with dimensions and 
#   - 10% of null values?
#   - particular  distribution
#   - particular correlation between variables (define variable(s))
#   - with mean, mode, st.dev

### Generate graph based dataset

## Linear transformation!




# general dsR
dsR <- function(cl,rw, rnd=FALSE, sps=NULL){
  
  if (rnd==TRUE){
    df <- as.data.frame(matrix(1:cl*rw, nrow = rw, ncol = cl, byrow = TRUE))
    print(df)
  } else {
    print(sps)
    x <- list(
      a = 1:10, 
      beta = exp(-3:3), 
      logic = c(TRUE,FALSE,FALSE,TRUE)
    )
    
  }
}

#test
myda <- dsR(10,10, TRUE)
dsR(10,10, FALSE)



# general dsR with prob
dsR_Prob <- function(rw, sps=NULL, prob=NULL){
  
  print(sps)
  xx <- lapply(x, quantile, probs = 1:3/4)
  x <- list(
    a = 1:10, 
    beta = exp(-3:3), 
    logic = c(TRUE,FALSE,FALSE,TRUE)
  )
  
}

#test
dsR_Prob(10,{},{})

# 
# 
# k <- 10
# m <- 10
# 
# f <- function(k, m){
#   st <- NULL
#   st <- lapply(1:10, k, function(x){
#     for (i in 1:x){
#       r <- i*10*m
#       st <- c(st, r)
#     }
#   })
# }
# 
# 
# f(10,10)
