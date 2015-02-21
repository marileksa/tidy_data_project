## Getting and Cleaning Data Course Project
This file describes the variables, the data, and any transformations or work that I performed to clean up the data.

The initial data file for this project was obtained from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The set of data was initially collected for project: "Human Activity Recognition Using Smartphones"
A full description is available at the site: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The *.zip file was unzipped into directory "UCI_HAR_Dataset". 

2 files were examined to understand the provided data:
* README.txt
* features_info.txt

#### Initial set of measurements contains 17 items ("features_info.txt")
* 1. tBodyAcc-XYZ
* 2. tGravityAcc-XYZ
* 3. tBodyAccJerk-XYZ
* 4. tBodyGyro-XYZ
* 5. tBodyGyroJerk-XYZ
* 6. tBodyAccMag
* 7. tGravityAccMag
* 8. tBodyAccJerkMag
* 9. tBodyGyroMag
* 10. tBodyGyroJerkMag
* 11. fBodyAcc-XYZ
* 12. fBodyAccJerk-XYZ
* 13. fBodyGyro-XYZ
* 14. fBodyAccMag
* 15. fBodyAccJerkMag
* 16. fBodyGyroMag
* 17. fBodyGyroJerkMag

#### Calculation of the expected number of feature variables
* 9 of the 17 measurements ('*.Mag') by 2 functions ( 'std()' and 'mean()' ) for each measurement  
correspond to 18 variables from "features.txt": 9 x 2 = 18

* 8 of the 17 measurements ('*.XYZ') by 3 (X,Y and Z) by 2 functions for each measurement
correspond to 48 variables from "features.txt": 8 x 3 x 2 = 48

* total: 18 + 48 = 66 feature variables should be selected for this project

NOTE: I have decided to to include features with 'meanFreq()' and 'angle() 
since these were listed as separate functions in "features_info.txt" 

#### Calculation of the expected number of observations in the final tidy data set
* Since there are 66 variables for each of the 30 subjects for each of the 6 activities, 
the expected number of observations: 66 x 180 = 11,880 ( see "step5result.txt" )  

#### Analysis of the initial data files
Only subset of 8 files from the *.zip was used to modify the data in order to complete this project

* UCI_HAR_Dataset/features.txt - loaded as
'data.frame':        561 obs. of  2 variables:

* UCI_HAR_Dataset/activity_labels.txt - loaded as
'data.frame':        6 obs. of  2 variables:

* UCI_HAR_Dataset/test/X_test.txt - loaded as
'data.frame':        2947 obs. of  561 variables:

* UCI_HAR_Dataset/test/y_test.txt - loaded as
'data.frame':        2947 obs. of  1 variable:

* UCI_HAR_Dataset/test/subject_test.txt - loaded as
'data.frame':        2947 obs. of  1 variable:

* UCI_HAR_Dataset/train/X_train.txt - loaded as
'data.frame':        7352 obs. of  561 variables:

* UCI_HAR_Dataset/train/y_train.txt - loaded as
'data.frame':        7352 obs. of  1 variable:

* UCI_HAR_Dataset/train/subject_train.txt - loaded as
'data.frame':        7352 obs. of  1 variable:


#### Data Dictionary

| # | Variable     | Var Description          | Value                | Val Description                              |
|:-:|:------------ |:-------------------------|:---------------------|:---------------------------------------------|
| 1 | Activity     | activity performed by the subject   | WALKING              |.number 1 from activity_labels.txt|
|   |              |                                     | WALKING_UPSTAIRS     |.number 2| 
|   |              |                                     | WALKING_DOWNSTAIRS   |.number 3|
|   |              |                                     | SITTING              |.number 4|
|   |              |                                     | STANDING             |.number 5|
|   |              |                                     | LAYING               |.number 6|              
| 2 | Subject      | subject number |1-30|    .Unique identifier assigned to each volunteer within this study, integer|               
| 3 | Feature      | one of the 66 feature variable names selected out of the 561 items listed in "features.txt" based on information provided in "features_info.txt"|tBodyAccMeanX|           .1 - initial number from "features.txt"|
||||                tBodyAccMeanY|          .2|
||||                tBodyAccMeanZ|           .3|
||||                tBodyAccStdX|            .4|
||||                tBodyAccStdY|            .5|
||||                tBodyAccStdZ|            .6|
||||                tGravityAccMeanX|       .41|
||||                tGravityAccMeanY|        .42|
||||                tGravityAccMeanZ|        .43|
||||                tGravityAccStdX|         .44|
||||                tGravityAccStdY|         .45|
||||                tGravityAccStdZ|        .46|
||||                tBodyAccJerkMeanX|       .81|
||||                tBodyAccJerkMeanY|       .82|
||||                tBodyAccJerkMeanZ|       .83|
||||                tBodyAccJerkStdX|        .84
||||                tBodyAccJerkStdY |       .85|
||||                tBodyAccJerkStdZ |       .86|
||||                tBodyGyroMeanX |         .121|
||||                tBodyGyroMeanY |         .122|
||||                tBodyGyroMeanZ|          .123|
||||                tBodyGyroStdX|           .124|
||||                tBodyGyroStdY |          .125|
||||                tBodyGyroStdZ  |         .126|
||||                tBodyGyroJerkMeanX|      .161|
||||                tBodyGyroJerkMeanY |     .162|
||||                tBodyGyroJerkMeanZ  |    .163|
||||                tBodyGyroJerkStdX    |   .164|
||||                tBodyGyroJerkStdY     |  .165|
||||                tBodyGyroJerkStdZ      | .166|
||||                tBodyAccMagMean         |.201|
||||                tBodyAccMagStd |         .202|
||||                tGravityAccMagMean|      .214|
||||                tGravityAccMagStd  |     .215|
||||                tBodyAccJerkMagMean |    .227|
||||                tBodyAccJerkMagStd   |   .228|
||||                tBodyGyroMagMean      |  .240|
||||                tBodyGyroMagStd        | .241|
||||                tBodyGyroJerkMagMean|    .253|
||||                tBodyGyroJerkMagStd  |   .254|
||||                fBodyAccMeanX         |  .266|
||||                fBodyAccMeanY          | .267|
||||                fBodyAccMeanZ      |     .268|
||||                fBodyAccStdX        |    .269|
||||                fBodyAccStdY         |   .270|
||||                fBodyAccStdZ          |  .271|
||||                fBodyAccJerkMeanX |      .345|
||||                fBodyAccJerkMeanY  |     .346|
||||                fBodyAccJerkMeanZ   |    .347|
||||                fBodyAccJerkStdX     |   .348|
||||                fBodyAccJerkStdY   |     .349|
||||                fBodyAccJerkStdZ    |    .350|
||||                fBodyGyroMeanX      |    .424|
||||                fBodyGyroMeanY      |    .425|
||||                fBodyGyroMeanZ      |    .426|
||||                fBodyGyroStdX       |    .427|
||||                fBodyGyroStdY    |       .428|
||||                fBodyGyroStdZ    |       .429|
||||                fBodyAccMagMean  |       .503|
||||                fBodyAccMagStd   |       .504|
||||                fBodyAccJerkMagMean |    .516|
||||                fBodyAccJerkMagStd  |    .517|
||||                fBodyGyroMagMean    |    .529|
||||                fBodyGyroMagStd     |    .530|
||||                fBodyGyroJerkMagMean|    .542|
||||                fBodyGyroJerkMagStd |    .543 |                 
| 4 |Mean| mean value of the initial measurements calculated for each feature for each activity for each subject|-0.9976661 to 0.9745087 |signed real number |
                
* NOTE: the range of values for variable 'Mean' was obtained by applying max() and mean() functions to 11,880 observations
* > min(data$Mean)
* [1] -0.9976661
* > max(data$Mean)
* [1] 0.9745087


