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

VARIABLE NAME    VARIABLE                   VALUES OR                 
POSITION                                     EXPLANATION        
xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")
subject.train <- read.table("train/subject_train.txt")
training.data <- cbind(ytrain,xtrain)
training.data <- cbind(subject.train,training.data)
xtest <- read.table("test/X_test.txt")
ytest <- read.table("test/y_test.txt")
subject.test <- read.table("test/subject_test.txt")
testing.data <- cbind(ytest,xtest)
testing.data <- cbind(subject.test,testing.data)
big.data <- rbind(testing.data,training.data)
features <- read.table("features.txt",stringsAsFactors=FALSE)
small.columns <- as.integer(c("1","2",grep("mean",colnames(big.data)),grep("std",colnames(big.data))))
small.data <- big.data[,small.columns]
activity.labels <- read.table("activity_labels.txt",stringsAsFactors=FALSE)
activity.vector <- activity.labels$V2
activity.names <- c(activity.names,activity.vector[small.data$activity[i]])
small.data <- data.frame(activity.names,small.data, stringsAsFactors = FALSE)
small.data <- subset(small.data,select=-activity)
tall.data <- melt (small.data, id=c("subject","activity.names"))
tidy.data <- dcast(tall.data, subject + activity.names ~ variable, fun.aggregate=mean)
