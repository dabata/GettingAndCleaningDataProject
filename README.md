#Getting and Cleaning Data Project (README.md)
========================================================


## Instructions
==================

* Download zip file in this link : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* unzip file in the working directory ( get working directory with getwd() R function)
* Run run_analysis.R
* the tidy summarized dataset "tidysumz.txt" is generated in the working directory (the same as the initial folder) 

## Description of run_analysis.R
==================================

1. import list of features and list of activities
2. read and column binding test data (subjects,activities and features)
3. read and column binding training data (subjects,activities and features)
4. append test data to training data
5. Extracts only the measurements on the mean and standard deviation for each measurement (only measurement ending with mean() or std() are retained)
6. shift each retained features by two columns : subject and activity columns already added
7. join with activity_labels dataset to add activity labels
8. average each variable by each activity and each subject
9. reshape data (columns names modified by sqldef function) and advance labels column to be next to activities codes
10. write data to txt file


## Notes
==========
script generated and tested under this environment:
R version 3.1.0 (2014-04-10) -- "Spring Dance"
Copyright (C) 2014 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)