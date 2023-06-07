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
  b_2 = c("1", "0"),
  le_big = LETTERS,
  le_small = letters,
  gu_ = sapply(seq_len(1000), function(x) {system("uuidgen", intern=T)}),
  te_C = sapply(seq_len(1000), function(x) {sample(c(-20:35),1, replace=TRUE)}),
  te_F = sapply(seq_len(1000), function(x) {sample(c(1:130),1, replace=TRUE)}),
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


dsR <- function(vr="ms:3;b:4;i:1", nr=100){
  df <- NULL
  nam <- names(set_of_val)
  for (i in 1:length(unlist(strsplit(vr,";")))){
    a<-strsplit(unlist(strsplit(vr,";")),":")[i]
    ty <- unlist(a)[1]
    ty_l <- unlist(a)[2]
    for (j in 1:ty_l){
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
sample_data <- dsR(vr="ms:2;i:2;le:3;li:2", nr=10000)

sample_data

