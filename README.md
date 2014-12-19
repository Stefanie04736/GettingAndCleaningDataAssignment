# Getting and Cleaning Data - Assignment
## Human Activity Recognition Using Smartphones Dataset

The raw data set was transformed to a tidy data set. The project contains the files:

* run_analysis.R
* Codebook.md
* Readme_RawData.txt
* features_info.txt

### Raw data

The Readme of the raw data set states the following:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. (...)"

The following files of the raw data set were used for this project:

* X_train.txt/X_test.txt: Training/Test set
* y_train.txt/y_test.txt: Training/Test labels (activities)
* subject_train.txt/subject_test.txt: Identifier for the subject who performed the activity
* features.txt: variable names for training and test set
* activity_labels.txt: activity names

For further information an the raw data see Readme_RawData.txt and features_info.txt.

### run_analysis.R

The script run_analysis.R downloads and unzips the raw data to the working directory.  

It reads in X_train.txt, y_train.txt and subject_train.txt and clips them together. The same is done for the test data, also training and test data are clipped together. 

Then only the measurements on the mean and standard deviation for each measurement are extracted, i. e. all variables whose names contain "mean()" or "std()". 

In order to replace activity labels by descriptive activity names the data is merged with the file activity_labels.txt. Afterwards the activity labels (numbers) are dropped so that only the activity names stay in the data set. 

In order to label the data with descriptive variable names the column names are set to the feature names in features.txt These are already descriptive without being to long to handle. But the minus and the paranthesis in the feature names are eliminated as they may cause problems in further analysis with R. Also mistakes in the original feature names like "BodyBody" are corrected. 

Finally for each subject and each activity the average of each variable is calculated. This tidy data set is written to the working directory and named tidydata_assignment.txt. 

It can be read into R with the command
`read.table("tidydata_assignment.txt",header=TRUE)`.


### Codebook.md

Codebook.md describes the variables of the tidy data set created in run_analysis.R.

### Readme_RawData.txt

The Readme of the raw data set describes the experimental design and the files used for this analysis.

### features_info.txt

This file describes the variables in the original raw data set.
