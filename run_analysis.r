##########################################################################################################

## Coursera Getting and Cleaning Data Course Project
## Jonathan Meneses
## 2017-06-10

# run_analysis.r File Description:

# This script will perform the following steps on the UCI HAR Dataset downloaded from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

##########################################################################################################

##Part 1. Merging the training and test sets into one data set##

#Load library packages that we'll be using in this code

require(reshape2)

#Clean up the environment

rm(list=ls()) 

#Read in initial data files NOTE that this assumes the labels for the train and test sets are the same

features          <- read.table("features.txt")                 #activity data features
activity_type     <- read.table("activity_labels.txt")          #activity types and their corresponding training label


train_set         <- read.table("./train/X_train.txt")          #imports the training set
train_labels      <- read.table("./train/y_train.txt")          #imports the training label for subjects
subject_train     <- read.table("./train/subject_train.txt")    #labels of which subject the row corresponds to


test_set          <- read.table("./test/X_test.txt")           #imports the testing set
test_labels       <- read.table("./test/y_test.txt")           #imports the testing label for subjects
subject_test      <- read.table("./test/subject_test.txt")     #labels of which subject the row corresponds to


# assign column names appropriately

colnames(activity_type)     <- c("activityID", "activityType")

colnames(train_set)         <- features[,2]
colnames(train_labels)      <- c("activityID")
colnames(subject_train)     <- c("subjectID")

colnames(test_set)          <- features[,2]
colnames(test_labels)       <- c("activityID")
colnames(subject_test)      <- c("subjectID")

# merge data into one set

merged_train                <- cbind(train_labels,subject_train,train_set)
merged_test                 <- cbind(test_labels,subject_test,test_set)
merged_data                 <- rbind(merged_train,merged_test)

################################################################################

##Part 2. Extract only mean and standard measurements from the data set


colNames      <- colnames(merged_data)               #creates a variable that has column names to search
summary_cols  <- grep(".*mean.*|.*std.*", colNames)  #searches the features for test that has mean and std dev, creates a list of columns desired
summary_cols  <- append(c(1,2),summary_cols)         #appends first two columns, since those contain activity and subject IDs
merged_data   <- merged_data[,summary_cols]          #extracts summary data from merged_data

##Part 3. Descriptively name activity in the data set

merged_data   <- merge(activity_type,merged_data, by="activityID") #uses the base merge function of r to join, using activityIDs as a key 

##Part 4. Cleans up data set names
summary_cols <- colnames(merged_data)
for (i in 1:length(summary_cols)) 
{
  summary_cols[i] <- gsub("\\()","",summary_cols[i])
  summary_cols[i] <- gsub("std","StdDev",summary_cols[i])
  summary_cols[i] <- gsub("mean","Mean",summary_cols[i])
  summary_cols[i] <- gsub("^(t)","time-",summary_cols[i])
  summary_cols[i] <- gsub("^(f)","freq-",summary_cols[i])
  summary_cols[i] <- gsub("([Gg]ravity)","Gravity",summary_cols[i])
  summary_cols[i] <- gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",summary_cols[i])
  summary_cols[i] <- gsub("[Gg]yro","Gyro",summary_cols[i])
  summary_cols[i] <- gsub("AccMag","AccMagnitude",summary_cols[i])
  summary_cols[i] <- gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",summary_cols[i])
  summary_cols[i] <- gsub("JerkMag","JerkMagnitude",summary_cols[i])
  summary_cols[i] <- gsub("GyroMag","GyroMagnitude",summary_cols[i])
};

colnames(merged_data) <- summary_cols
##Part 5. tidys and writes the data set by recasting

merged_data$subjectID     <- as.factor(merged_data$subjectID)                               #sets subjectID as a factor
tidy_data                 <- melt(merged_data, id = c("subjectID", "activityType"))         #melts the data set into a long and skinny, tidy set
tidy_data.mean            <- dcast(tidy_data, subjectID + activityType ~ variable, mean)    #recasts the data to show the mean across activity and subject

write.table(tidy_data.mean, "tidy.txt", row.names = TRUE, sep ='\t')                        #writes tidy data to a text file