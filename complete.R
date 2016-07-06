complete <- function(directory, id = 1:332){
    ##directory is char vector, length 1, indication location of files
    
    ##id is integer vector indicating monitor id numbers to be used
    
    ##Return data frames of the form:
    ##id  nobs
    ##1   117
    ##2   1041
    
    ## where id is monitor ID number and nobs is the number of complete cases
    
    #read files into memory
    files <- list.files(directory, full.names=TRUE)
    
    #create data frame to store data
    nobs.complete <-  data.frame(sensors=id,observations=NA)
   
    #retrieve data and store in dataframe, ignoring NA values
    for (i in 1:length(id)){
        datafile <- read.csv(files[id[i]])
        datafile <-  na.omit(datafile)
        nobs.complete[i,1] <- id[i]
        nobs.complete[i,2] <- length(datafile[,3])
    }


    #rename columns for printing to fix id=id
    colnames(nobs.complete) <- c("id", "nobs")

    #return data
    nobs.complete


}