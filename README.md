#Course project - Getting and Cleaning Data

The R script file run_analysis.R is my solution to the course project for Getting and Cleaning Data, a module in the Data Science track from Johns Hopkin sUniversity, offered through Coursera.   

The script file:

* Checks for a data folder within the working directory containing the Samsung Galaxy accelerometer data from the machine learning repository at UC Irvine. If the data does not exists, then it is downloaded. The time of the download is recorded in the file date_downloaded. You can force a fresh download by deleting the data folder.
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Writes the two datasets to the working directory. The larger dataset is called result1.csv and the smaller tidy dataset is result2.csv.

For details of the datasets, please refer to the file CODEBOOK.md.

Nick Langmaid 
26 July 2014.