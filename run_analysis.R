# this does the following:
# Merges the training and the test sets to create one data set.
# Extracts the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# labels the data set with descriptive variable names.


# repeat process with train directory (cbind subject train with y_train and x_train)

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



setwd("C:/Users/crodger/Documents/GitHub/Getting-and-Cleaning-Data-Course-Project")

## read in the labels for the data and convert to a vector to be used as names
  features<-read.table("./UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)
  vnames<-features[,2]
  ## create an index for the columns that should be kept by matching
  ## to text "mean()" and "std()" (non-case sensitive)
  means<-grep("mean()",vnames,ignore.case=TRUE)
  stds<-grep("std()",vnames,ignore.case=TRUE)
  keep<-sort(c(means,stds))  # used to retain original var sequence

  ## read in the main analysis datasets (x_test and x_train)
  x_test<-read.table("./UCI HAR Dataset/test/x_test.txt")
  head(x_test[,3:6])
  attr(x_test, "names")<-vnames # adds variable names based on
  head(x_test[,3:6])
    ## restrict to means and standard deviations data only
    x_test<-x_test[,keep]
    head(x_test[,1:6])

  x_train<-read.table("./UCI HAR Dataset/train/x_train.txt")
  head(x_train[,3:6])
  attr(x_train, "names")<-vnames
  head(x_train[,3:6])
    ## restrict to means and standard deviations
    x_train<-x_train[,keep]
    head(x_train[,1:6])



#grep("mean",vnames,ignore.case=TRUE)+2
# x_test2<-x_test[,grep("mean",vnames,ignore.case=TRUE)]
# head(x_test2[,1:10])

  ## combine these data with the subject (person tested) and the activity (e.g. walking)
# attr(x_test,"names")

  subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
  attr(subject_test, "names")<-c("Subject")
  head(subject_test)

  y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
  attr(y_test, "names")<-c("Activity")
  head(y_test)
  ## combine the test data with subject and activity
    test<-cbind(subject_test,y_test,x_test)


  subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
  attr(subject_train, "names")<-c("Subject")
  head(subject_train)

  y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
  attr(y_train, "names")<-c("Activity")
  head(y_train)
  ## combine the train data with subject and activity
    train<-cbind(subject_train,y_train,x_train)

  ## combine the full test and train data
    dim(train)
    dim(test)
    nrow(train)+nrow(test)
    fulldata<-rbind(train,test)
    dim(fulldata)

  ## create a list of variables to sumamrize (need to exclude the grouping vars of Subject and Activity)
  vars<-attr(fulldata[,-c(1,2)],"names")

  library(dplyr)

  mean_data <- fulldata %>%
    group_by(Subject,Activity) %>%
    summarise_each(funs(mean))



write.table(mean_data,"./summary_file.txt",row.name=FALSE)


