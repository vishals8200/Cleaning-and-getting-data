This describes the process undertaken to develop the function 'run_analysis.R'.  It follows this outline:
	Introduction
	Downloading Data
	Understanding the Data
	Designing a solution to the stated problem / objective
	Presenting the results.

Introduction
	This is a project required to satisfy the requirements of the Coursera 'Getting and Cleaning Data' course, week 4.  A large data set is provided online upon which to perform certain prescribed tasks.  These are summarized in the instructions as:

	You should create one R script called run_analysis.R that does the following.
1 Merges the training and the test sets to create one data set.
2 Extracts only the measurements on the mean and standard deviation for each measurement.
3 Uses descriptive activity names to name the activities in the data set
4 Appropriately labels the data set with descriptive variable names.
5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Some background regarding the source of the data is given, but is largely irrelevant as there is no subject matter analysis required.  The nature (structure, number of files etc) of the data are largely unknown at the outset as they are provided as a zipped archive.

Downloading the Data

The required function does not include downloading the data, so this is accomplished manually first:

## prepare directory and download data
	zipdir <- tempfile()
	dir.create(zipdir)
	fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles	%2FUCI%20HAR%20Dataset.zip"
	download.file(fileurl,destfil="zip",method="curl")
	unzip(zip,exdir="zipdir")


Understanding the Data

The complete data set consists of 8 files.  There are two groups of three files, one group for training data (_train) and one for testing data (_test).  These groups both include raw test data (X), activity codes (y) and the identification of the subject (subject).  In addition, there are two files that 1) provide a catalog of the activities (activity_labels),  and 2) catalog of the features of the raw data (features).  These are described in further detail below.

Activity Codes from 'activity_labels'
(6 x 2)  Code , Description
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING


Signals - from 'features_info.txt'  -  this describes the generation of the data but is not relevant to this assignment and is not considered further.


Complete list of features - from 'features'   
(2x561) Code, Description
No units are given so none can be included in this code book
Note that descriptions are not unique (there are some duplicates)
by observation, there are multiple descriptions that include the string “mean”, “Mean”, or “std”

Directory 'test' contains

1.  Inertial Signals directory - ignore as there is no useful information for this assignment

2. subject_test.txt (as subject_test df ) with   integers 2-24 
(2947 x 1)   provides a single value of the subject id code for each test record
these are the subject (volunteer) IDs - ('id' used for df processing subject data)

3. X_test.txt (as X_test df) (2947x561)

561 unlabeled fields of data that contain the test information
2947 lines of data

4. y_test.txt (as y_test df)  (2947x1)
1 unlabeled field containing the activity code (1-6) fpr each test (assumed - not stated)
2947 lines of data

Directory 'train' contains the same pattern of files, but with 7352 rows of data.


Design of a Solution  (Study Design)

The test and training data sets are first modified to include the activity and subject codes.  Then they are combined and the 'mean' and 'std' columns extracted.  These are then grouped and their means aggregated into a new dataframe.  Data field names are them made tidy and the results output to a csv file.

see script run_analysis.R for further details and line-by-line comments.

The variables that emerge from the extraction process and are to be found in the final dataframe are:

activityID
activity
subjectID
tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyAccMag-mean()
tGravityAccMag-mean()
tBodyAccJerkMag-mean()
tBodyGyroMag-mean()
tBodyGyroJerkMag-mean()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-meanFreq()-X
fBodyAcc-meanFreq()-Y
fBodyAcc-meanFreq()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-meanFreq()-X
fBodyAccJerk-meanFreq()-Y
fBodyAccJerk-meanFreq()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-meanFreq()-X
fBodyGyro-meanFreq()-Y
fBodyGyro-meanFreq()-Z
fBodyAccMag-mean()
fBodyAccMag-meanFreq()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-meanFreq()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-meanFreq()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-meanFreq()
angle(tBodyAccMean,gravity)
angle(tBodyAccJerkMean),gravityMean)
angle(tBodyGyroMean,gravityMean)
angle(tBodyGyroJerkMean,gravityMean)
angle(X,gravityMean)
angle(Y,gravityMean)
angle(Z,gravityMean)
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-std()
tGravityAccMag-std()
tBodyAccJerkMag-std()
tBodyGyroMag-std()
tBodyGyroJerkMag-std()
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyAccMag-std()
fBodyBodyAccJerkMag-std()
fBodyBodyGyroMag-std()
fBodyBodyGyroJerkMag-std()

The resulting data are considered tidy as they meet these requirements:

Each variable is in one column
Each different observation of that variable is in a different row
The observations are all the same kind of variable and can be placed in one table
There is a row at the top of the file with the variable names
Activity names are provided rather than codes
Other variable names are too technical for simplification by non-subject matter experts and should not be changed
There is a single table saved to a single file.
