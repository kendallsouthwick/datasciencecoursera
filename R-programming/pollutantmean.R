pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)

        ## Writren by Kendall Southwick

        files <- list.files(directory, "csv|CSV")
        combinedData <-NULL
        oldwd <- getwd()
        setwd(directory)
        for (wrkFile in files) {
        	wrkData <- read.csv(wrkFile, header=TRUE)
        	if (wrkData[1,"ID"] %in% id) {
        	   combinedData <- append(combinedData, wrkData[,pollutant])
        	}
        }
        setwd(oldwd)
        
        round(mean(combinedData, na.rm=TRUE), 3)
        
}