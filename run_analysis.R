# please see the provided README.md file for an overview of this code


## read in the variable names for the data and convert to a vector to be used as names
  features<-read.table("./UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)
  vnames<-features[,2]
  ## create an index for the columns that should be kept by matching
  ## to text "mean()" and "std()" (non-case sensitive)
  means<-grep("mean()",vnames,fixed=TRUE)  # keeps if text contains "mean()"
  Means<-grep("Mean()",vnames,fixed=TRUE)  # keeps if text contains "mean()"
  stds<-grep("std()",vnames,fixed=TRUE)    # keeps if text contains "std()"
  Stds<-grep("Std()",vnames,fixed=TRUE)    # keeps if text contains "std()"
  keep<-sort(c(means,Means,stds,Stds))     # used to retain original var sequence


## read in the main analysis datasets (x_test and x_train)
  ## read test data
    x_test<-read.table("./UCI HAR Dataset/test/x_test.txt")
    head(x_test[,4:10])             # checking table import
    attr(x_test, "names")<-vnames   # adds variable names
    head(x_test[,4:10])             # checking variable names added
  ## restrict to means and standard deviations data only
    x_test<-x_test[,keep]           # restricting to columns of interest
    head(x_test[,4:10])             # confirming data restricted to cols of interest

  ## read train data
    x_train<-read.table("./UCI HAR Dataset/train/x_train.txt")
    head(x_train[,4:10])            # checking table import
    attr(x_train, "names")<-vnames  # adds variable names
    head(x_train[,4:10])            # checking variable names added
  ## restrict to means and standard deviations
    x_train<-x_train[,keep]         # restricting to columns of interest
    head(x_train[,4:10])            # confirming data restricted to cols of interest


## add information on subject (person tested) and the activity (e.g. walking)
  ## add this information to test data
    subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
    attr(subject_test, "names")<-c("Subject")
    head(subject_test)

    y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
    attr(y_test, "names")<-c("Activity")
    head(y_test)
    ## combine the test data with subject and activity, add variable indicating Source
    test<-cbind(Source="Test",subject_test,y_test,x_test)

  ## add this information to the train data
    subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
    attr(subject_train, "names")<-c("Subject")
    head(subject_train)

    y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
    attr(y_train, "names")<-c("Activity")
    head(y_train)

    ## combine the train data with subject and activity, add variable indicating Source
    train<-cbind(Source="Train",subject_train,y_train,x_train)


## combine the full test and train data
  ## start by checking what the dimensions should be
    dim(train)
    dim(test)
    nrow(train)+nrow(test)
  ## combine and check new dimensions
    fulldata<-rbind(train,test)
    dim(fulldata)


## change the Activity column to use activity name labels instead of just values
    fulldata$Activity <- factor(fulldata$Activity,
            levels = c(1,2,3,4,5,6),
            labels = c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying") )


## collapse the data to get the means for mean() and std() information
  ## create a list of variables to sumamrize (exclude the grouping vars Source, Subject and Activity)
    vars<-attr(fulldata[,-c(1,2,3)],"names")

  ## use dplyr library to help with collapsing the data
    library(dplyr)

    mean_data <- fulldata %>%
      group_by(Source,Subject,Activity) %>%
      summarise_each(funs(mean))

## export the data for uploading to course website
    write.table(mean_data,"./summary_file.txt",row.name=FALSE)
