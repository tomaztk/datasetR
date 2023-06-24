# Create data frame

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

set_of_val <<- list(
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

dsR <- function(vr="ms:3;bi:4;ii:1", nr=100){
  library(dplyr)
  df <- NULL
  df_i <- NULL
  dff <- NULL
  nam <- names(set_of_val)

  for (i in 1:length(unlist(strsplit(vr,";")))){
    nn<-strsplit(unlist(strsplit(vr,";")),":")[i]
    ty <- unlist(nn)[1]
    ty_l <- unlist(nn)[2]
    df_i <- rbind(df_i, data.frame(v=ty, l=ty_l))
  }

  dff <- df_i[rep(seq(nrow(df_i)), df_i$l),]
  dff2 <- dff %>%
    group_by(v) %>%
    mutate(cn = paste0(v ,"_" , 1:n(), sep=""))

  for (i in 1:nrow(dff2)){
    ty <- dff2$v[i]
    ty_l <- dff2$l[i]
    ty_n <- dff2$cn[i]
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
    names(df_tmp) <- ty_n
    if (is.null(dim(df))) {
      df <- cbind(df_tmp)
    }else{
      df <- cbind(df,df_tmp)
    }
  }
  return(df)
}

