# Getting and Cleaning Data - Assignment

The project contains the files:

* run_analysis.R
* Codebook.md
* features_info.txt

## run_analysis.R

The script run_analysis.R downloads and unzips the data to the working directory. Then it
1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Finally the tidy data set created in step 5 is written to the working directory named tidydata_assignment.txt. 
It can be read into R with the command
`read.table("tidydata_assignment.txt",header=TRUE)`.

## Codebook.md

Codebook.md describes the variables of the tidy data set created in step 5 in run_analysis.R.

## features_info.txt

This file describes the variables in the original data set.


 

