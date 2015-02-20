# based on the information from this course's TA - CodeBook.md contains info on the final data set ("step5result.txt"), README.md contains info on the analysis and manipulations of the initial data set.

### DATA DICTIONARY - Getting and Cleaning Data Course Project
# ref: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf


| # | Variable     | Var Description                     | Value                | Val Description                              |
|:-:|:------------ |:------------------------------------|:---------------------|:---------------------------------------------|
| 1 | Activity     | activity performed by the subject   |                      |
|   |              |                                     | WALKING              |.number 1 from activity_labels.txt|
|   |              |                                     | WALKING_UPSTAIRS     |.number 2| 
|   |              |                                     | WALKING_DOWNSTAIRS   |.number 3|
|   |              |                                     | SITTING              |.number 4|
|   |              |                                     | STANDING             |.number 5|
|   |              |                                     | LAYING               |.number 6|
|:-:|:------------ |:------------------------------------|:---------------------|:---------------------------------------------|                
| 2 | Subject      | subject number |1-30|    .Unique identifier assigned to each volumteed within this study, integer|
|:-:|:------------ |:------------------------------------|:---------------------|:---------------------------------------------|                 
| 3 | Feature      | mean and standard deviation calculations for each of 66 features for eah activity and each subject based on mesurements collected for the initial study|
||||                tBodyAccMeanX|           .1| initial number from "features.txt"|
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
|:-:|:------------ |:------------------------------------|:---------------------|:---------------------------------------------|                 
| 4 |Mean| mean value of the initial measurements calculated for each feature for each activity for each subject| | |
                

