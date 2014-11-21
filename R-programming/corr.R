corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations

        ## Written by Kendall Southwick

        oldwd <- getwd()
        files <- list.files(directory, "csv|CSV")
        retVec <- vector(mode="numeric", length=0)
        setwd(directory)
        for (wrkFile in files) {
            wrkData <- read.csv(wrkFile, header=TRUE)
            wrkData <- na.omit(wrkData)
            if (nrow(wrkData) > threshold) {
                retVec <- append(retVec, cor(wrkData$nitrate, wrkData$sulfate))
            }
        }
        setwd(oldwd)
        retVec
}