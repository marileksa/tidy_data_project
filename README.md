
#### This is a Getting and Cleaning Data Course Project
#### using dataset initially collected for another project: "Human Activity Recognition Using Smartphones"
#### A full description is available at the site where the data was obtained: 
#### http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

##### the data for this project was obtained from: 
##### https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# The following subset of the files was used for this project:
* UCI_HAR_Dataset/features.txt
* UCI_HAR_Dataset/activity_labels.txt

* UCI_HAR_Dataset/test/X_test.txt
* UCI_HAR_Dataset/test/y_test.txt
* UCI_HAR_Dataset/test/subject_test.txt

* UCI_HAR_Dataset/train/X_train.txt
* UCI_HAR_Dataset/train/y_train.txt
* UCI_HAR_Dataset/train/subject_train.txt

##### run_analysis.R starts with the assumption that the Samsung data is available in the working directory 
##### in an unzipped UCI_HAR_Dataset_folder 

### 1. Merges the training and the test sets to create one data set.
### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
### 3. Uses descriptive activity names to name the activities in the data set
### 4. Appropriately labels the data set with descriptive variable names. 
### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable ### for each activity and each subject.



# to check my tydy data you could do the following
#> data <- read.table("step5result.txt", header = TRUE)
#> View(data)

#address <- "https://s3.amazonaws.com/coursera-uploads/user-longmysteriouscode/asst-3/massivelongcode.csv"
#address <- sub("^https", "http", address)
#data <- read.table(url(address), header = TRUE) #if they used some other way of saving the file than a default #write.table, this step will be different
#View(data)

#In theory, if you have a library like psych installed and loaded it is fairly easy to read the data off the #clipboard (I haven't checked this with every possible computer though)

#library(psych)
#address <- read.clipboard.tab(header = FALSE, stringsAsFactors = FALSE)[1,1]
#address <- sub("^https", "http", address)
#data <- read.table(url(address), header = TRUE) #if they used some other way of saving the file than a default #write.table, this step will be different
#View(data)
#The above examples assume they used write table without setting the delimiters, if they did something like that ##(or used write .csv and changed the file extension) hopefully they noted that somewhere so you know how to read #their file into R.
