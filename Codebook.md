Tiny Data Processing Script for Human Activity Recognition using Smartphones Dataset
Jeffrey C. Stephens

Source data obtained from

Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

DATA COLLECTION DESCRIPTION                      
The purpose of this script is to process the data contained in the Source data into a tidy data set
suitable for further processing. 

Extent of collection: 4 data files
Codebook.MD - this document, variables used, columns of data, reference to original data
README.txt - description of how the data was processed, assumptions, and a second citation of the original data
Run_analysis.R - R script designed to be run in the top level directory of the Source files and process them into a tidy
data set.
tidy.txt - output of the R_analysis.R script

Part 1: Average of the                                   
        File Structure: rectangular                 
        Subjects: 30                                              
        Activities Measured: 6 
        Observations: 180

VARIABLE                VALUES OR EXPLANATION        
xtrain                  Data Frame holding the contents of the x_train.txt file
ytrain                  Data Frame holding the contents of the y_train.txt file
subject.train           Data Frame holding the contents of the subject_train.txt file
training.data           Data Frame holding the combined contents of the xtrain, ytrain, and subject.train frames
xtest                   Data Frame holding the contents of the X_test.txt file
ytest                   Data Frame holding the contents of the y_test.txt file
subject.test            Data Frame holding the contents of the subject_test.txt file
testing.data            Data Frame holding the combined contents of the xtest, ytest, and subject.test frames
big.data                Data Frame holding the contenst of the combined testing and training data. 
                        10299 measurements x 563 variables
features                Data Frame holding the contents of the features.txt file
small.columns           Character array of the columns from big.data that include mean or std.
small.data              Data frame that includes the small.columns from big.data
                        10299 x 81. This varies from student to student depending on which "mean" variables were dropped 
                        during processing.
activity.labels         Data Frame holding the contents of the activity.txt file. Values ranged from 1-6 and included:
                        1       WALKING
                        2       WALKING_UPSTAIRS
                        3       WALKING_DOWNSTAIRS
                        4       SITTING
                        5       STANDING
                        6       LAYING
activity.vector         Character array holding the contents of the readable version of the labels.
activity.names          Character array holding the column names of the small.data set. Note that activity.names is the new 
                        column header for activity.
tall.data               Data frame containing the melted small.data set. The format is each row is a unique combination of                              subject/activity/variable with an accompanying value that can be processed numerically. This makes the                          data suitable for plotting or casting into a preferred format.
                        813621 x 4.
tidy.data               Data frame containing 180 observations for 81 variables. Each subject/activity combination has an
                        average variable reported in a separate column.

Description of the 79 Features Reported.
*Taken directly from the source data README*
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
