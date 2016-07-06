complete <- function(directory, id = 1:332){
    ##directory is char vector, length 1, indication location of files
    
    ##id is integer cevtor indicating monitor id numbers to be used
    
    ##Return data frames of the form:
    ##id  nobs
    ##1   117
    ##2   1041
    
    ## where id is monitor ID number and nobs is the number of complete cases
    
    #read files into memory
    files <- list.files(directory, full.names=TRUE)
    
    nobs.complete <-  data.frame(sensors=id,observations=NA)
    print(id)
    for (i in id){
        datafile <- read.csv(files[i])
        datafile <-  na.omit(datafile)
        nobs.complete[i,1] <- i
        nobs.complete[i,2] <- length(datafile[,3])
    }


    print(nobs.complete)
    nobs.complete <- na.omit(nobs.complete)
    colnames(nobs.complete) <- c("id", "nobs")
    rownames(nobs.complete) <- NULL
    subset(nobs.complete, id==id)
    
    #combined.data
    #length(combined.data[,3=i])                  
    #length((combined.data[id][!is.na(combined.data[])]))
    
    
    
   # colnames(nobs.complete) <- c("id", "nobs") 
}