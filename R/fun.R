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


##################
##################
## set of values
##################
##################

set_of_val <- list(
  ms_col = c("red", "green", "blue", "black", "magenta"),
  ms_con = c("Europe", "Australia", "Asia", "Africa", "America", "Antarctica"),
  ms_ZIP = c(20123,3502,102023, 1000, 54903),
  ms_cit = c("Ljubljana","Antananarivo","Taipeh","Tokyo","Canberra","Seattle","Asuncion","Windhoek"),
  mo_siz = c("XS", "S", "M", "L", "XL"),
  mo_gra = c(1,2,3,4,5,6),
  li_3 = c("Agree", "Neutral", "Disagree"),
  li_5 = c("Strongly Agree", "Agree", "Neutral", "Disagree", "Strongly Disagree"),
  li_7 = c("Strongly Agree", "Agree", "Somewhat Agree", "Neutral","Somewhat Disagree", "Disagree", "Strongly Disagree"),
  i_1 = 1:1000,
  i_2 = 9000:20120,
  l = c(TRUE,FALSE),
  b_1 = c("Yes", "No"),
  b_2 = c("1", "0")
)


tt <- function(vr="ms:3;b:4;i:1", nr=100){
  df <- NULL
  for (i in 1:length(unlist(strsplit(vr,";")))){
    a<-strsplit(unlist(strsplit(vr,";")),":")[i]
    ty <- unlist(a)[1]
    ty_l <- unlist(a)[2]
    print(ty)
    #print(ty_l)
    for (j in 1:ty_l){
      print(j)

      n <- names(set_of_val) %like% "ms"
      print(n)
      #get through creating a data

      dd <- sample(ty, nr, replace=TRUE)
      df <- cbind(df, dd)


    }
    #return(df)
  }
}

# sample(set_of_val$i_1, 10, TRUE)
# sample(set_of_val$i_1, 10, TRUE)
# sample(set_of_val$b_1, 100, TRUE)

tt(nr=10)



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
