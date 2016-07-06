corr <- function(directory, threshold = 0){
    ##directory is a char vector, length 1 indicating location of csv files
    
    ##threshold is numberic vector, length 1, indicating number of 
    ##completely observed observations (on all variables) required
    ##to compute correlation between nitrate and sulfate (default=0)
    
    ##return a numeric vector of correlations
    ## note: do not round the results
    
    files <- list.files(directory, full.names=TRUE)
    
    correlation <- c()
    
    for (i in 1:length(files)){
        readfile <- read.csv(files[i]) 
        observations <- sum(complete.cases(readfile))
        
        if(observations > threshold){
            data <- na.omit(readfile)
            correlation <- rbind(correlation, cor(data$nitrate, data$sulfate))
            
        }
        
    }
    
    correlation
}