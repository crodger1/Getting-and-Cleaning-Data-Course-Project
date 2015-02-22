# Getting-and-Cleaning-Data-Course-Project

This folder contains the code and data for the project assignment for the Coursera "Getting and Cleaning Data" course (Coursera getdata-011)

For this assignment, we created a run_analysis.R file that takes Samsung activity monitoring data and manipulates it to generate mean values for the collected mean and standard deviation data, and summarizes them by subject (individual for whom the data were collected) and activity type (e.g. Walking).

This script starts with the assumption that the Samsung data is available in the working directory in an unzipped UCI HAR Dataset folder.  The data source is noted below


Specifically, run_analysis.R does the following:

* imports the source data downloaded from the UCI
* adds variable names to the columns in the test and train data
* restricts variables to the set containing the specific test "mean()", "Mean()", "std()", or "Std()"
* combines the source datasets into a single data set
* uses value labels to add descriptive activity names to the 6 activity types
* creates a tidy dataset with the _average_ of each mean and standard deviation (std) in the source data
* this final dataset is collapsed to the Source, Subject, and Activity level (one record for each activity type per subject)

A data dictionary is provided (data_dictionary.txt) which describes the included variables

The source data  were downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

There is more information about this dataset here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
