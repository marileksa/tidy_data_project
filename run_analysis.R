##################################################################################################
# run_analysis.R 
# input:  - 8 files, see list of files in CodeBook.md
# output: - tidy data for this project "step5result.txt"
##################################################################################################

setwd("~/tidy_data_project/")
library(dplyr)
library(reshape2)

##################################################################################################
# STEP 2.a. Extracts only the measurements on the mean and standard deviation for each measurement
##################################################################################################
get_variables <- function() {
        #load data file into data frames
        features <- read.table("UCI_HAR_Dataset/features.txt", stringsAsFactors=FALSE)
        
        # select variables with 2 patterns 'std()' and 'mean()'
        trimmed_features <- rbind(features[grep('-std[()]', features$V2 ), ], features[grep('-mean[()]', features$V2 ), ])
        
        # modify variable names removing '(',')','-' chars and capitalizing 'Mean' and 'Std'
        t1 <- gsub('mean','Mean', trimmed_features$V2)
        t2 <- gsub('std','Std', t1)
        t3 <- gsub('[-()]','', t2)
        
        # correct some var names to match the data specs
        trimmed_features$V2 <- gsub('fBodyBody','fBody', t3)
        
        # expected number of variables: 66, checking:
        #> length(trimmed_features$V2)
        #[1] 66
        
        # sort to preserve the initial numbering
        sorted_trimmed_features <- select(arrange(trimmed_features, V1), V1,V2)  
        return(sorted_trimmed_features)
}

####################################################################################################
# STEP 2.b. Select only signficant columns from X_test or X_train data 
# using vector of indeces of features, rename column names using vector of varible names of features
####################################################################################################
select_rename_columns <- function(X_file, selected_features) {
        
        selected_features <- get_variables()
        
        subset_X_file <- X_file[,selected_features$V1]      
        colnames(subset_X_file) <- selected_features$V2        
        return(subset_X_file)
}

#################################################################################################
# STEP 3. Uses descriptive activity names to name the activities in the data set
#################################################################################################
label_with_activity <- function(y_file) { 
        #load data file into data frames
        activity_labels <- read.table("UCI_HAR_Dataset/activity_labels.txt", stringsAsFactors=FALSE)
        for (i in 1:length(y_file$V1) ) {
                for (ii in 1:length(activity_labels$V1)) {
                     if ( y_file[i,1] == activity_labels[ii,1] ) {
                             y_file[i,1] = activity_labels[ii,2]     
                     }        
                }
        }
        return(y_file)      
}
#################################################################################################
# STEP 1-3
#################################################################################################
combine_vertical_data <- function( X_file, y_file, subject) {
        # using custom function to replace 1-6 with one of 6 strings from activity_labels.txt
        labeled_y_file <- label_with_activity(y_file)        

        # since there is only one column we raname it with one string
        colnames(labeled_y_file) <- "Activity"

        # since there is only one column we raname it with one string
        colnames(subject) <- "Subject"
        
        # select 'std()' and 'mean()' columns, rename column headers
        X_data <- select_rename_columns(X_file)
       
        # add allvertical data sets together
        y_data <- cbind(labeled_y_file, subject )
        data <- cbind(X_data, y_data)
         
        return(data)
}

#################################################################################################
# STEPS 1-4
#################################################################################################
combine_horizontal_data <- function() {   
      
        # Load data files into data frames
        X_test <- read.table("UCI_HAR_Dataset/test/X_test.txt", stringsAsFactors=FALSE)
        y_test <- read.table("UCI_HAR_Dataset/test/y_test.txt", stringsAsFactors=FALSE)
        subject_test <- read.table("UCI_HAR_Dataset/test/subject_test.txt", stringsAsFactors=FALSE)
        
        X_train <- read.table("UCI_HAR_Dataset/train/X_train.txt", stringsAsFactors=FALSE)
        y_train <- read.table("UCI_HAR_Dataset/train/y_train.txt", stringsAsFactors=FALSE)
        subject_train <- read.table("UCI_HAR_Dataset/train/subject_train.txt", stringsAsFactors=FALSE)
        
        # merges data "vertically" by binding columns in 3 data frames
        y_train_df <- combine_vertical_data(X_train, y_train, subject_train )
        y_test_df <- combine_vertical_data(X_test, y_test, subject_test)
        
        # merges train and test "horizontally" by binding rows
        combined_data <- rbind(y_train_df, y_test_df)
        return(combined_data)
}

##################################################################################################
# STEPS 1-4
##################################################################################################
df <- combine_horizontal_data()

#######################################################################################################
# STEPS 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
#######################################################################################################
# reshape data so that it generates the tidy data set in a long form ( accepted, see Forum discussions)
dfMelt <- melt(df, id=c("Subject","Activity"))

# group data by Activity, Subject and variable and applying function mean to each record
result <- aggregate(value ~ Activity * Subject * variable, data=dfMelt, FUN=mean)

# rename columns with explicit names
colnames(result) <- c("Activity", "Subject", "Feature", "Mean")

# write out data 
write.table(result, "step5result.txt", row.names=FALSE)
