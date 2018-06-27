setwd("C:/Users/SHARAT/Documents")

corr <- function(directory, threshold = 0) {
  # set working directory
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  # get the length of id vector
  complete_table <- complete("specdata", 1:332)
  # find the valid ids
  ids <- complete_table$id[complete_table$nobs > threshold]
  # get the length of ids vector
  id_len <- length(ids)
  corr_vector <- rep(0, id_len)
  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep="")
  j <- 1 
  for(i in ids) {
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    current_file <- na.omit(current_file)
    corr_vector[j] <- cor(current_file$sulfate, current_file$nitrate, use="complete.obs")
    j <- j + 1
  }
  result <- corr_vector
  return(result)
} 
