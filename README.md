## Getting and Cleaning Data Course Project
This file explains how all of the run_analysis.R work to complete the following project requirements:

* STEP 1. Merges the training and the test sets to create one data set.
* STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
* STEP 3. Uses descriptive activity names to name the activities in the data set
* STEP 4. Appropriately labels the data set with descriptive variable names. 
* STEP 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#### run_analysis.R
* starts with the assumption that the Samsung data is available in the working directory 
in an unzipped UCI_HAR_Dataset folder 

* loads 8 files ( see CodeBook.md ) into data frames

for each of the 2 sets of data frames ( X_train / X_test )
* selects a set of features (66) based on two patterns 'std()' and 'mean()' in variable names
* modifies variable names removing '(',')','-' chars, capitalizing 'Mean' and 'Std' and correcting BodyBody to Body to match the specs
* uses the selected set of features to select subset of data resulting in 66 column with features as column names

for each of the 2 sets of data frames ( X_train, y_train, subject_train / X_test, y_test, subject_test)
* merges data "vertically" by binding columns in 3 data frames
* replaces activity numbers with activity labels

* merges train and test "horizontally" by binding rows

* reshapes the data generating tidy data set in the long form

* groups data by Activity, Subject and feature variable and applies function mean to each record

* writes data out to file "step5result.txt"

#### the final data set is tidy because:
* data set has headings so it is clear which columns are which
* each column corresponds to one variable
* there are no duplicate columns
* there are no NA's 

* all(colSums(is.na(result)) == 0)
* [1] TRUE

#### stats for final data frame:
* 'data.frame':        11880 obs. of  4 variables:
* $ Activity: chr  "LAYING" "SITTING" "STANDING" "WALKING" ...
* $ Subject : int  1 1 1 1 1 1 2 2 2 2 ...
* $ Feature : Factor w/ 66 levels "tBodyAccMeanX",..: 1 1 1 1 1 1 1 1 1 1 ...
* $ Mean    : num  0.222 0.261 0.279 0.277 0.289 ...

#### to check my tidy data do the following:
* data <- read.table("step5result.txt", header = TRUE)
* View(data)

