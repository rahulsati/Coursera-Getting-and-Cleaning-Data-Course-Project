# Getting and Cleaning Data Course Project
This repository hosts the R code and documentation files for the Data Science's track course "Getting and Cleaning data", available in coursera.

## Project Summary
The goal is to prepare tidy data that can be used for later analysis. Data for this project was obtain from the Coursera assignment instructions. Data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R script should be run on the [data] and it will complete the following steps to transform the data into something that we are able to glean information out of.

1 - Merges the training and the test sets to create one data set.
2 - Extracts only the measurements on the mean and standard deviation for each measurement.
3 - Uses descriptive activity names to name the activities in the data set
4 - Appropriately labels the data set with descriptive variable names.
5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Analysis File Description
The run_analysis.R can be run as long as setting your working directory to the UCI HAR Dataset folder. Dplyr package was required to run this script.

Analysis will read all the test data and train data merge them into one data set. Each variables were names accordingly based on the features listed in the features.txt file.

Using the combined data set, independent tidy data set with the average of each variable for each activity and each subject was created and written into tidyData.txt file.