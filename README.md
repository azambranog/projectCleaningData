projectCleaningData
===================

This is my solution for the project assignment on the Cleaning Data Course.

## Overview
This project consisted of a script to get a tidy data set from data of the experiment described on

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data can be found on:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The goal of the project was to create a data set thatcontained only certain information from the original data.
The required specifications were:

* The data set should be a merge of the training and test data
* The variables on the set should be only the features that are mean and standard deviation
* The activity labels should be descriptive names and not numbers

## The run_analisys.R script
This script creates the required data set following these steps:

* 1) get the list of festures from the features file
* 2) keep only the features that are mean of standard deviation of a variable
* 3) get the features of the train and test sets
* 4) drop irrelevant columns from the test and training sets accoprding with the results of step 2
* 5) give the columns proper names found on the features file
* 6) add an extra coulumn to both sets with the activity information in the Y files
* 7) reaplce the numbers of the column created in step 6 for the labels in the activity_labels file
* 8) add a column to both data sets with subject information in the subject files
* 9) join both sets into s single tidy set
* 10) order the tody set by subject and activity only becuase it looks nicer :-)
* 11) write the tidy set into  txt and csv format (just cuz it is nice to have two formats)
