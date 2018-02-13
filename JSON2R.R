
#install.packages("jsonlite")
#install.packages("rjson")
library("rjson")
library("jsonlite")

#load json file
ax <- read_json("DRA1_v2.json")

#change ID, just as an example
ax$external_id
ax$external_id <- "DRA1_test"

#list all HPO terms
number of HPO terms
numx <- length(ax$features)

extract_HPO <- function(file)
{
  numx <- length(file$features)
  hpox <- as.data.frame(matrix(ncol=2,nrow=numx))
  names(hpox) <- c("HPO_term","label")
  for (i in 1:numx)
  {
    hpox[i,1] <- file$features[[i]]$id
    hpox[i,2] <- file$features[[i]]$label
  }
  return(hpox)
}

hpo_list <- extract_HPO(ax)

x <- ""
for (i in 1:numx)
{
  y <- extract_HPO(ax)[i,1]
  x <- paste(x,y,sep=";")
}

#Hpo_string is a string of HPO terms
hpo_string <- substr(x,2,nchar(x))

