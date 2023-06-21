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

#ms = nominal ; mo = ordinal; li = likert; bo = boolean; bi = binary; le = letters; gu = GUID; te = temperature; mo = money
set_of_val <- list(
  ms = c("red", "green", "blue", "black", "magenta"),
  ms = c("Europe", "Australia", "Asia", "Africa", "America", "Antarctica"),
  ms = c(20123,3502,102023, 1000, 54903),
  ms = c("Ljubljana","Antananarivo","Taipeh","Tokyo","Canberra","Seattle","Asuncion","Windhoek"),
  od = c("XS", "S", "M", "L", "XL"),
  od = c(1,2,3,4,5,6),
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

# object size
format(object.size(set_of_val), units="Mb", digits=3L)


####################################
## create sample  data.frame
####################################

#helper functions

#get type
getType <- function(var_enum_enter=1) {
  nam_val<- as.data.frame(substr(capture.output(str(set_of_val)),1,10))
  nam_val <- as.data.frame(nam_val[2:dim(nam_val)[1],])
  names(nam_val) <- "ty"
  nam_val<-as.data.frame(do.call(rbind, strsplit(as.character(nam_val$ty), split = ':', fixed = FALSE)))
  names(nam_val) <- c("var","typ")
  nam_val$var <- substr(nam_val$var,4,5)
  nam_val$typ <- trimws(nam_val$typ)
  rownames(nam_val) <- 1:20
  tip <- nam_val[which(rownames(nam_val)==var_enum_enter),]$typ
  return(tip)
}


dsR <- function(vr="ms:3;bi:4;ii:1", nr=100){
  df <- NULL
  nam <- names(set_of_val)
  nof_variables <- 0
  #make df for all variables and enumerate
  for (i in 1:length(unlist(strsplit(vr,";")))){
    nn<-strsplit(unlist(strsplit(vr,";")),":")[i]
    ty <- unlist(a)[1]
    ty_l <- unlist(a)[2]
    df <- rbind(df, data.frame(v=ty, l=ty_l))
    nof_variables <- nof_variables + as.numeric(unlist(nn)[2])
  }
  for (i in 1:length(unlist(strsplit(vr,";")))){
    a<-strsplit(unlist(strsplit(vr,";")),":")[i]
    ty <- unlist(a)[1]
    ty_l <- unlist(a)[2]
    for (j in 1:ty_l){
      sub_name <- grep(ty, nam)
      resample <- function(x, ...) x[sample.int(length(x), ...)]
      var_enum <- resample(grep(ty, nam),1, replace=TRUE)
      var_type <- getType(var_enum)
      df_pool <- as.data.frame((unlist(t(set_of_val[var_enum]))))
      if (var_type == "chr") df_pool <- as.data.frame(as.character(unlist(t(set_of_val[var_enum]))))
      if (var_type == "int") df_pool <- as.data.frame(as.integer(unlist(t(set_of_val[var_enum]))))
      if (var_type == "num") df_pool <- as.data.frame(as.numeric(unlist(t(set_of_val[var_enum]))))
      names(df_pool) <- "v"
      df_tmp <- NULL
      df_tmp <- data.frame(sample(df_pool$v, nr, replace=TRUE))
      varn <- paste0("ty_", i)
      names(df_tmp) <- varn
      if (is.null(dim(df))) {
        df <- cbind(df_tmp)
      }else{
        df <- cbind(df,df_tmp)
      }

    }
  }
  return(df)
}


#create test sample data
sample_data <- dsR(vr="ms:2;ii:2;le:3;li:2", nr=10)
sample_data2 <-dsR(vr="ii:5;gu:3", nr=10)
sample_data2 <-dsR(vr="ii:5;le:5", nr=10)
sample_data3 <-dsR(vr="mo:4", nr=990)



##### work in progress!


### with distrubtions
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
sample(set_of_val$i_1, 10, TRUE)


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

