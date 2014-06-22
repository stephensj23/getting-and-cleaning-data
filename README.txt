Getting and Cleaning Data 
=========================
## Tiny Data Processing Script for
## Human Activity Recognition using Smartphones Dataset
## Version 1.0
## Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
## Smartlab - Non Linear Complex Systems Laboratory
## DITEN - Università degli Studi di Genova.
## Via Opera Pia 11A, I-16145, Genoa, Italy.
## activityrecognition@smartlab.ws
## www.smartlab.ws

This must be run in the working directory of the HAR dataset. It does not check for missing data or change the directory.

Processing Instructions
1.  Read and process training data sets
    1.1.  Read in X_train.txt
    1.2.  Read in y_train.txt
    1.3.  Read in subject_train.txt
2.  Merge training data
3.  Read and process test data sets
    3.1   Read in X_test.txt
    3.2   Read in y_train.txt
    3.3   Read in subject_train.txt
4.  Merge training data
5.  Assemble training and test data sets into one set by stacking them on top of each other. 
    5.1   NOTE: At this point, it is not possible to separate the training from the test data.
6.  Replace column headers with descriptions in text file
    6.1   NOTE: I did not attempt to change the default descriptions in the original
          reference. I just read them in and attempted to assign them appropriately.
7.  Read in activity description file
8.  Assemble column names array and assign to frame
9.  Extract mean and stdev for each variable
    9.1   NOTE: I did a search for all variables with mean or std. I did not attempt to simplify further by eliminating 
          variables that were already averages of existing columns.
10.  Replace activity labels with descriptive names
    10.1  Read in coding for activity labels
    10.2  Create activity name array from tidy.data numbers and activity labels.
    10.3  Replace activity with descriptive activity names to data set
          10.3.1  NOTE: I actually added in this column and subtracted out the old instead of replacing them.
11. Creating the tidy data set for submission
    11.1  Melt the data into a single tall frame. This creates a very long data structure with one column of numbers suitable for           processing. All other variables are considered IDs and will be re-separated out during the casting process.
    11.2  Casts the data into a tidy data set with each person/activity combination as the row ID and all of the measurement               variables the column names. The averages are reported making this tidy.
12. Write out tidy.txt for uploading to Coursera
    12.1 NOTE: Space separated text file for 30 subjects, 6 activities, and their averages for each variable.
