complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases

        ## Written by Kendall Southwick

        nobs <- rep(0,length(id))
        retDF <- data.frame(id, nobs)
        files <- list.files(directory, "csv|CSV")
        oldwd <- getwd()
        setwd(directory)
        for (wrkFile in files) {
            wrkData <- read.csv(wrkFile, header=TRUE)
            wrkData <- na.omit(wrkData)
            if (wrkData[1,"ID"] %in% id) {
                for( i in id) {
                   len <- length(which(wrkData[,"ID"] %in% i))
                   retDF$nobs[match(i, retDF$id)] <- retDF$nobs[match(i, retDF$id)] + len
                }              
            }
        }
        setwd(oldwd)

        retDF
}