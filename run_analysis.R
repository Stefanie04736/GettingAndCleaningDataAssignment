library(dplyr)

# download and unzip the data
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"data.zip")
unzip("data.zip")

# 1. Merge training and test sets to create one data set
# ---------------------------------------------------------------------------------

# read in training data
Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# clipping training data together
train <- cbind(subjecttrain,ytrain,Xtrain)

# read in test data
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# clipping test data together
test <- cbind(subjecttest,ytest,Xtest)

# clipping training and test data together
data <- rbind(train,test)


# 2. Extract only the measurements on the mean and standard deviation 
#    for each measurement. 
# ---------------------------------------------------------------------------------

# first read in features
features <- read.table("./UCI HAR Dataset/features.txt")
# get the features with mean or std using regular expressions
featuresmeanstd <- grep("(mean|std)\\(\\)",features[,2], value=TRUE)
# extract relevant data (features)
colnames(data) <- c("subject","actnumber",as.character(features[,2]))
data <- data[,c("subject","actnumber",featuresmeanstd)]


# 3. Use descriptive activity names to name the activities in the data set
# ---------------------------------------------------------------------------------

# read in activity labels
actlabels <- read.table("./UCI HAR Dataset/activity_labels.txt",col.names=c("actnumber","activity"))
# merge data and activity labels based on activity number (actnumber)
data <- merge(data,actlabels)
# reorder the columns after merging and drop actnumber
data <-data[,c("subject","activity",featuresmeanstd)]


# 4. Label the data set with descriptive variable names. 
# ---------------------------------------------------------------------------------

# Use the feature names, but remove minus and paranthesis
colnames(data) <- gsub("-|\\(\\)","",colnames(data))
# correckt mistakes in original feature names, i. e. replacing "BodyBody" 
# by only "Body"
colnames(data) <- gsub("BodyBody","Body",colnames(data))


# 5. Create a second, independent tidy data set with the average of each variable 
# ---------------------------------------------------------------------------------

#    for each activity and each subject. 
tidydata <- data %>% group_by(subject,activity) %>% summarise_each(funs(mean))


# Write the tidy data set to a txt file called tidydata_assignment.txt
# ---------------------------------------------------------------------------------

write.table(tidydata,"tidydata_assignment.txt",row.names=FALSE)











