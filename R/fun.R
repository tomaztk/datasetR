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



##################
##################
## set of values
##################
##################


set_of_val <- list(
  ms = c("red", "green", "blue", "black", "magenta"),
  ms = c("Europe", "Australia", "Asia", "Africa", "America", "Antarctica"),
  ms = c(20123,3502,102023, 1000, 54903),
  ms = c("Ljubljana","Antananarivo","Taipeh","Tokyo","Canberra","Seattle","Asuncion","Windhoek"),
  mo = c("XS", "S", "M", "L", "XL"),
  mo = c(1,2,3,4,5,6),
  li = c("Agree", "Neutral", "Disagree"),
  li = c("Strongly Agree", "Agree", "Neutral", "Disagree", "Strongly Disagree"),
  li = c("Strongly Agree", "Agree", "Somewhat Agree", "Neutral","Somewhat Disagree", "Disagree", "Strongly Disagree"),
  ii = 1:1000,
  ii = 9000:20120,
  bo = c(TRUE,FALSE),
  bi = c("Yes", "No"),
  bi = c("1", "0"),
  le = LETTERS,
  le = letters,
  gu = sapply(seq_len(1000), function(x) {system("uuidgen", intern=T)}),
  te = sapply(seq_len(1000), function(x) {sample(c(-20:35),1, replace=TRUE)}),
  te = sapply(seq_len(1000), function(x) {sample(c(1:130),1, replace=TRUE)}),
  mo = sapply(seq_len(1000), function(x) {sample(c(10:10000),1, replace=TRUE)})
)

# size
format(object.size(set_of_val), units="Mb", digits=3L)


##################
##################
## create sample
## data.frame
##################
##################


dsR <- function(vr="ms:3;bi:4;ii:1", nr=10){
  df <- NULL
  nam <- names(set_of_val)
  for (i in 1:length(unlist(strsplit(vr,";")))){
    a<-strsplit(unlist(strsplit(vr,";")),":")[i]
    ty <- unlist(a)[1]
    ty_l <- unlist(a)[2]
    print(ty)
    print(ty_l)
    for (j in 1:ty_l){
      print(j)
      var_enum <- sample(grep(ty, nam),1, replace=TRUE)
      df_pool <- as.data.frame(unlist(t(set_of_val[var_enum])))
      names(df_pool) <- "v"
      df_tmp <- as.data.frame(sample(df_pool$v, nr, replace=TRUE))
      names(df_tmp) <- ty
      df <- c(df, df_tmp)

    }
  }
  df <- as.data.frame(do.call(cbind, df))
  return(df)
}

#create sample data
sample_data <- dsR(vr="ms:2;ii:2;le:3;li:2", nr=1000)
sample_data2 <-dsR(vr="ii:5;gu:3", nr=1000)
sample_data2 <-dsR(vr="ii:5;le:5", nr=1000)


###ToDO:
## - correct data types from dsR function
## - test if guid works (???)
## - microbench
