# Cleaning-and-getting-data
Cleaning and getting data peer assigment

README

This is a solution to the Coursera 'Getting and Cleaning Data' course Week 4 assignment.
This script  will perform the required analyses on the provided data once it has been unzipped 

That part of the process can be accomplished by :

 ## prepare directory and download data
	zipdir <- tempfile()

	dir.create(zipdir)

	fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(fileurl,destfil="zip",method="curl")

	unzip(zip,exdir="zipdir")

It is necessary to define the path to the user's working directory at line 7

Function will execute (without parameters) and create a csv file 'tidyData.csv' in the working directory
