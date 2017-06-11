# Getting and Cleaning Data Project Codebook

This codebook will serve to provide information on the raw files, approach, and outputs produced in order to create a reproducible method for cleaning data

# Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record in the data set, the following is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
# Identifying Variables
Subjects and activities are identified by using:

* `subject` - The ID of the test subject
* `activity` - The type of activity performed when the corresponding measurements were taken


# Measured Variables

The run_analysis.R script will produce the means of the following measured variabes:

* `subjectID`
* `activityType`
* `activityID`
* `time-BodyAcc-Mean-X`
* `time-BodyAcc-Mean-Y`
* `time-BodyAcc-Mean-Z`
* `time-BodyAcc-StdDev-X`
* `time-BodyAcc-StdDev-Y`
* `time-BodyAcc-StdDev-Z`
* `time-GravityAcc-Mean-X`
* `time-GravityAcc-Mean-Y`
* `time-GravityAcc-Mean-Z`
* `time-GravityAcc-StdDev-X`
* `time-GravityAcc-StdDev-Y`
* `time-GravityAcc-StdDev-Z`
* `time-BodyAccJerk-Mean-X`
* `time-BodyAccJerk-Mean-Y`
* `time-BodyAccJerk-Mean-Z`
* `time-BodyAccJerk-StdDev-X`
* `time-BodyAccJerk-StdDev-Y`
* `time-BodyAccJerk-StdDev-Z`
* `time-BodyGyro-Mean-X`
* `time-BodyGyro-Mean-Y`
* `time-BodyGyro-Mean-Z`
* `time-BodyGyro-StdDev-X`
* `time-BodyGyro-StdDev-Y`
* `time-BodyGyro-StdDev-Z`
* `time-BodyGyroJerk-Mean-X`
* `time-BodyGyroJerk-Mean-Y`
* `time-BodyGyroJerk-Mean-Z`
* `time-BodyGyroJerk-StdDev-X`
* `time-BodyGyroJerk-StdDev-Y`
* `time-BodyGyroJerk-StdDev-Z`
* `time-BodyAccMagnitude-Mean`
* `time-BodyAccMagnitude-StdDev`
* `time-GravityAccMagnitude-Mean`
* `time-GravityAccMagnitude-StdDev`
* `time-BodyAccJerkMagnitude-Mean`
* `time-BodyAccJerkMagnitude-StdDev`
* `time-BodyGyroMagnitude-Mean`
* `time-BodyGyroMagnitude-StdDev`
* `time-BodyGyroJerkMagnitude-Mean`
* `time-BodyGyroJerkMagnitude-StdDev`
* `freq-BodyAcc-Mean-X`
* `freq-BodyAcc-Mean-Y`
* `freq-BodyAcc-Mean-Z`
* `freq-BodyAcc-StdDev-X`
* `freq-BodyAcc-StdDev-Y`
* `freq-BodyAcc-StdDev-Z`
* `freq-BodyAcc-MeanFreq-X`
* `freq-BodyAcc-MeanFreq-Y`
* `freq-BodyAcc-MeanFreq-Z`
* `freq-BodyAccJerk-Mean-X`
* `freq-BodyAccJerk-Mean-Y`
* `freq-BodyAccJerk-Mean-Z`
* `freq-BodyAccJerk-StdDev-X`
* `freq-BodyAccJerk-StdDev-Y`
* `freq-BodyAccJerk-StdDev-Z`
* `freq-BodyAccJerk-MeanFreq-X`
* `freq-BodyAccJerk-MeanFreq-Y`
* `freq-BodyAccJerk-MeanFreq-Z`
* `freq-BodyGyro-Mean-X`
* `freq-BodyGyro-Mean-Y`
* `freq-BodyGyro-Mean-Z`
* `freq-BodyGyro-StdDev-X`
* `freq-BodyGyro-StdDev-Y`
* `freq-BodyGyro-StdDev-Z`
* `freq-BodyGyro-MeanFreq-X`
* `freq-BodyGyro-MeanFreq-Y`
* `freq-BodyGyro-MeanFreq-Z`
* `freq-BodyAccMagnitude-Mean`
* `freq-BodyAccMagnitude-StdDev`
* `freq-BodyAccMagnitude-MeanFreq`
* `freq-BodyAccJerkMagnitude-Mean`
* `freq-BodyAccJerkMagnitude-StdDev`
* `freq-BodyAccJerkMagnitude-MeanFreq`
* `freq-BodyGyroMagnitude-Mean`
* `freq-BodyGyroMagnitude-StdDev`
* `freq-BodyGyroMagnitude-MeanFreq`
* `freq-BodyGyroJerkMagnitude-Mean`
* `freq-BodyGyroJerkMagnitude-StdDev`
* `freq-BodyGyroJerkMagnitude-MeanFreq`



# Activity Values Tested
* `WALKING` (value 1): subject was walking during the test
* `WALKING_UPSTAIRS` (value 2): subject was walking up a staircase during the test
* `WALKING_DOWNSTAIRS` (value 3): subject was walking down a staircase during the test
* `SITTING` (value 4): subject was sitting during the test
* `STANDING` (value 5): subject was standing during the test
* `LAYING` (value 6): subject was laying down during the test

# Data Transformations

The  script performs a simple process in order to transform data into a tidy set. It followed the following process:

1. Loading data sets
2. Assigning activity types to activity values for each data set
3. Merging training and testing data sets into one larger set
4. Using grep to determine which columns in the data set to keep, searching only for mean and standard deviation columns
5. Renaming columns with more descriptive names, using a simply for loop
6. By using the `reshape2` package's functions `melt` and `dcast`, creating a tidy data set that is then recast into mean values by subject and activity type
