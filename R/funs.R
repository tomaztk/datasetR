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

#get values
getValues <- function(){
  #ms = nominal ; mo = ordinal; li = likert; bo = boolean; bi = binary; le = letters; gu = GUID; te = temperature; mo = money
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
}
