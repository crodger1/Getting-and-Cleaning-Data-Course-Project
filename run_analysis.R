# You should create one R script called run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# pseudo code:
# read subject_test
# merge to the right with y_test (cbind)
# merge to the right with x_test (cbind)
# this is one dataset


# repeat process with train directory (cbind subject train with y_train and x_train)

## read in the labels document
  features<-read.table("./UCI HAR Dataset/features.txt")
  as.list(features)
  head(features)
  features<-features[,2]
  
## read in the datasets
  subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
  head(subject_test)
  y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
  head(y_test)
  x_test<-read.table("./UCI HAR Dataset/test/x_test.txt")
  head(x_test[,3:6])
  
  attributes(features)
  attributes(x_test)
  
  attr(x_test, "names")<-features
  head(x_test)
  
  features2<-as.list(features)
  
dim(subject_test)
dim(y_test)
dim(x_test)



?read.table
