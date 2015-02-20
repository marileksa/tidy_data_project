# Getting and Cleaning Data Course Project
This file explains how all of the run_analysis.R work

The initial data for this project was obtained from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

These data was initially collected for project: "Human Activity Recognition Using Smartphones"
A full description is available at the site: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The *.zip file was unzipped into directory "UCI_HAR_Dataset. Only subset of the files was used for this project:
* UCI_HAR_Dataset/features.txt
* UCI_HAR_Dataset/activity_labels.txt

* UCI_HAR_Dataset/test/X_test.txt
* UCI_HAR_Dataset/test/y_test.txt
* UCI_HAR_Dataset/test/subject_test.txt

* UCI_HAR_Dataset/train/X_train.txt
* UCI_HAR_Dataset/train/y_train.txt
* UCI_HAR_Dataset/train/subject_train.txt

run_analysis.R starts with the assumption that the Samsung data is available in the working directory 
in an unzipped UCI_HAR_Dataset folder 

### 1. Merges the training and the test sets to create one data set.
### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
### 3. Uses descriptive activity names to name the activities in the data set
### 4. Appropriately labels the data set with descriptive variable names. 
### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



# to check my tydy data you could do the following
#> data <- read.table("step5result.txt", header = TRUE)
#> View(data)

