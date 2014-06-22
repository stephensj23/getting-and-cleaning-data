## Tiny Data Processing Script for
##
## Human Activity Recognition using Smartphones Dataset
## Version 1.0
## Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
## Smartlab - Non Linear Complex Systems Laboratory
## DITEN - Università degli Studi di Genova.
## Via Opera Pia 11A, I-16145, Genoa, Italy.
## activityrecognition@smartlab.ws
## www.smartlab.ws
##
## Merge the training and test set into one set (done)
## Extract the measurements for mean and stdev for each measurement (done)
## Use descriptive activity names to name the activities in the dataset (done)
## Appropriately label the data set with descriptive activity names (done)
## Create a second, independent tiny data set with the average for each 
## variable for each activity and each subject

#######################################################################
# Read and process training data sets
#######################################################################

# Read in X_train.txt
xtrain <- read.table("train/X_train.txt")

# Read in y_train.txt
ytrain <- read.table("train/y_train.txt")

# Read in subject_train.txt
subject.train <- read.table("train/subject_train.txt")

# Merge training data
training.data <- cbind(ytrain,xtrain)
training.data <- cbind(subject.train,training.data)

#######################################################################
# Read and process test data sets
#######################################################################

# Read in X_test.txt
xtest <- read.table("test/X_test.txt")

# Read in y_train.txt
ytest <- read.table("test/y_test.txt")

# Read in subject_train.txt
subject.test <- read.table("test/subject_test.txt")

# Merge training data
testing.data <- cbind(ytest,xtest)
testing.data <- cbind(subject.test,testing.data)

#######################################################################
# Assemble training and test data sets into one set
#######################################################################

big.data <- rbind(testing.data,training.data)

#######################################################################
# Replace column headers with descriptions
#######################################################################
# Read in file
features <- read.table("features.txt",stringsAsFactors=FALSE)
#Assemble column names array and assign to frame
colnames(big.data) <- c("subject","activity",features[,2])

#######################################################################
# Extract mean and stdev for each variable
#######################################################################
small.columns <- as.integer(c("1","2",grep("mean",colnames(big.data)),grep("std",colnames(big.data))))
small.data <- big.data[,small.columns]

#######################################################################
## Replace activity labels with descriptive names
#######################################################################

# Read in coding for activity labels
activity.labels <- read.table("activity_labels.txt",stringsAsFactors=FALSE)
activity.vector <- activity.labels$V2

# Create activity name array from tidy.data numbers and acticity labels
for (i in 1:nrow(small.data)){
        if (i==1){activity.names <- activity.vector[small.data$activity[i]]}
        else
                if (!is.na(small.data$activity[i])) {
                        activity.names <- c(activity.names,activity.vector[small.data$activity[i]])
                        }
                }
# Replaces activity with descriptive activity names to data set
small.data <- data.frame(activity.names,small.data, stringsAsFactors = FALSE)
small.data <- subset(small.data,select=-activity)

#######################################################################
## Creating the tidy data set for submission
#######################################################################

#Melt the data into a single tall frame
tall.data <- melt (small.data, id=c("subject","activity.names"))
tidy.data <- dcast(tall.data, subject + activity.names ~ variable, fun.aggregate=mean)

#Write out tidy.txt for uploading to Coursera
write.table(tidy.data,"tidy.txt")
