Initial Data

For the data used in this project, see the README.txt found in http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

Data Wrangling

The data provided in this original project are tidied into a principal research dataset of interest here, contained in the data frame "data", in the run_analysis.R script provided here.

The "data" data frame is produced by performing the following transformations:

Q1 merge data from the original training and test datasets into one dataset.
Q2 Extract only those features from the original dataset that are a mean or standard deviation measure (mean or std in feature name).
Q3 Use descriptive activity names
Q4 Label with descriptive ativity names
Q5 Creates a second, independent tidy data set named "tidy.data",with the average of each variable for each activity and each subject.

The resulting data frame has 68 columns:

[1] "subject"                     "activity"                    "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z"          
 [6] "tBodyAcc-std()-X"            "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"            "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"       
[11] "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"         "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"         "tBodyAccJerk-mean()-X"      
[16] "tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"        "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
[21] "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"          "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"           "tBodyGyro-std()-Y"          
[26] "tBodyGyro-std()-Z"           "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"      "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
[31] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"       "tBodyAccMag-mean()"          "tBodyAccMag-std()"           "tGravityAccMag-mean()"      
[36] "tGravityAccMag-std()"        "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"       "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"         
[41] "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"      "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"           "fBodyAcc-mean()-Z"          
[46] "fBodyAcc-std()-X"            "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"            "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
[51] "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"        "fBodyGyro-mean()-X"         
[56] "fBodyGyro-mean()-Y"          "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"           "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
[61] "fBodyAccMag-mean()"          "fBodyAccMag-std()"           "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-mean()"    
[66] "fBodyBodyGyroMag-std()"      "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()" 

The result, produced in the frame "tidy.data" and written to the file "tidy_data.txt", contains every uniquely occuring combination of subject id and activity (columns 1 and 2), together with the mean of each other measure for that group (columns 3 through 68).