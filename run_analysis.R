## Getting and Cleaning Data, Week 4 Assignment
## Create function 'run_analysis.R'
run_analysis3 <- function(){
        # call dplyr library
        library(dplyr)
        # set working directory
        setwd("~/R/spec_Data/week4_data/week4project/zipdir/UCI HAR Dataset")
        # read tables 
        activity_labels <- read.table("activity_labels.txt", quote="\"", col.names=c("actID","actlab"))
        features <- read.table("features.txt", 	quote="\"", col.names=c("colID","featurelab"))
        
        subject_test <- read.table("test/subject_test.txt", quote="\"",col.names="subjID")
        x_test <- read.table("test/X_test.txt",  quote="\"")
        names(x_test) <- features$featurelab
        y_test <- read.table("test/y_test.txt", quote="\"", col.names="actID")
        
        subject_train <- read.table("train/subject_train.txt", quote="\"", col.names="subjID")
        x_train <- read.table("train/X_train.txt", quote="\"")
        names(x_train) <- features$featurelab
        y_train <- read.table("train/y_train.txt", quote="\"", col.names="actID")
        
        # merge test and train data
        # combine subject info, accelerometer data and activity data columns
        testdata <- cbind(subject_test, y_test, x_test)  
        traindata <- cbind(subject_train, y_train, x_train)
        
        # combine test and train by rows
        alldata <- rbind(testdata, traindata)
                
        # extract mean and sd data columns        
        # eliminate columns whose names are duplicated to avoid error with 'select'
        alldata <- alldata[, !duplicated(colnames(alldata))]
        # columns of interest (coi) = those with key words and the activity and subject id fields
        coi <- select(alldata, actID, subjID, contains("mean"), contains("Mean"), contains("std"))
        
        # create new df with aggregated means    
        avedata <- aggregate(coi, by= list(coi$subjID,coi$actID),mean)[,c(-1,-2)]
        
        # provide descriptive names for activities
        tidy <- merge(avedata, activity_labels, by='actID')
       # reorganize columns
        tidy <- tidy[,c(1,89,2:88)]
        # improve variable names
        tidy <- rename(tidy, "activityID" = actID)
        tidy <- rename(tidy, "activity" = actlab)
        tidy <- rename(tidy, "subjectID" = subjID)
        
        # write to file
        write.csv(tidy, file= "tidyData.csv")
}
