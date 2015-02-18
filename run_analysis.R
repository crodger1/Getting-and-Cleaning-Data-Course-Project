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

setwd("C:/Users/crodger/Documents/GitHub/Getting-and-Cleaning-Data-Course-Project")

## read in the labels for the data and convert to a vector to be used as names
  features<-read.table("./UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)
  vnames<-features[,2]
  
## read in the datasets
  ## read in the main analysis datasets (x_test and x_train)
  x_test<-read.table("./UCI HAR Dataset/test/x_test.txt")
  head(x_test[,3:6])
  attr(x_test, "names")<-vnames
  head(x_test[,3:6])

  x_train<-read.table("./UCI HAR Dataset/train/x_train.txt")
  head(x_train[,3:6])
  attr(x_train, "names")<-vnames
  head(x_train[,3:6])

  ## combine these data with the subject (person tested) and the activity (e.g. walking)

  subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
  attr(subject_test, "names")<-c("Subject")
  head(subject_test)

  y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
  attr(y_test, "names")<-c("Activity")

  head(y_test)

dim(subject_test)
   dim(y_test)
   dim(x_test)
  test<-cbind(subject_test,y_test,x_test)
  dim(test)
  head(test[,1:10])


attr(x_train, "names")<-vnames
head(x_train[,3:6])



subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
head(subject_test)
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
head(y_test)


  features2<-as.list(features)
  
dim(subject_test)
dim(y_test)
dim(x_test)



?read.table
