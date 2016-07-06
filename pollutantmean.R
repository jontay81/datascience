pollutantmean <- function(directory, pollutant, id = 1:332){
    ##directory is char vector, length 1, indicating location of csv files
    
    ##pollutant is char vector, length 1, indicating name of pollutant for
    ##which to calculate the mean; either "sulfate" or "nitrate"
    
    ##id is int vector indicating the monitor ID number to be used
    
    ##return the mean of the pollutant across all monitos listed in the id 
    ##vector ignoring NA values
    
    ##Note: Do not round the result
    
    #read files into memory
    files <- list.files(directory, full.names=TRUE)
    
    #create new data frame to hold data
    combined.data <- data.frame()
   
    #load data from files in frame
    #print("loading data...please be patient") 
    for (i in id){
        combined.data <- rbind(combined.data, read.csv(files[i]))
    }
    
    #calculate and return mean, ignoring NA values
    mean(combined.data[ , pollutant], na.rm=TRUE)
    
    
}

