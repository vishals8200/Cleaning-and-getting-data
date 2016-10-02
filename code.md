Merging the training and the test sets to create one data set.
Extracting only the measurements on the mean and standard deviation for each measurement.
Using descriptive activity names to name the activities in the data set
Appropriately labeling the data set with descriptive activity names.
Creating a second, independent tidy data set with the average of each variable for each activity and each subject.
Because most of the features in the original dataset were derived or estimated to 2nd or 3rd order from the original dataset, I chose to focus on the measurements most closely related to the original data collected by the accelerometer and gyroscope - tBodyAcc and tBodyGyro.

As a result, the variables remaining are just the calculatd means and standard deviations of these sets of data - one each for the X, Y and Z dimensions:

tBodyAcc-X
tBodyAcc-Y
tBodyAcc-Z
tBodyGyro-X
tBodyGyro-Y
tBodyGyro-Z
Each of these has a mean and standard deviation version. Examples:

tBodyAcc-mean()-X: Mean of base body acceleration data in the X dimension
tBodyGyro-std()-Y: Standard deviation of base body gyroscope measurement in the Y dimension