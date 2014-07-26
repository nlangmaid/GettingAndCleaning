##################################################################################################
#
# This is a solution to the course project for "Getting and Cleaning Data"
# which is one of the modules in the Johns Hopkins University Data Science track
#
# The assignment is to download raw data from the UC Irvine machine learning repository
# and tidy it up, producing the two summary data sets defined in the assignment instructions
#
# See the accompanying codebook for detaile definitions 
#
# Nick Langmaid   26 July 2014
#
#################################################################################################

#
# download the raw data and decompress
#
#  - skip the download if we already have the data (it's big!) 
#  - the file "date_downloaded" records when the data was last obtained
#  - delete the "data" folder if you want to force a fresh download
#
if (!file.exists("data")) {
  dir.create("data")
}
if (!file.exists("data/UCI HAR Dataset")) {
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, destfile="data/UCI_HAR.zip", method="curl")
  write(date(), "data/date_downloaded")
  unzip("data/UCI_HAR.zip", overwrite=TRUE, exdir="data")
  unlink("data/UCI_HAR.zip")
}

#
# load the raw data
#   the subject files contain the subject
#   the "y" files contain the activity
#   the "X" files contain the accelerometer data
#
subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("data/UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("data/UCI HAR Dataset/test/X_test.txt")
y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("data/UCI HAR Dataset/test/y_test.txt")

#
# merge the training and test datasets to create a single dataset
#
subject <- rbind(subject_train, subject_test)
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)

#
# extract only the columns with the mean and standard deviation for each measurement
#
result1 <- data.frame( subject, 
                       y, 
                       X[,c(1:6, 41:46, 81:86, 121:126, 161:166,
                       201:202, 214:215, 227:228, 241:242, 253:254,
                       266:271, 345:350, 424:429,
                       503:504, 516:517, 529:530, 542:543)] )

#
# use descriptive activity names for the activities in the dataset
#
result1[2] <- factor( result1[[2]], labels=c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying") )

#
# label all the columns with descriptive variable names
#
colnames(result1) <- 
  c("subject", "activity",
    "time.BodyAcc.X.mean", "time.BodyAcc.Y.mean", "time.BodyAcc.Z.mean", "time.BodyAcc.X.stdev", "time.BodyAcc.Y.stdev", "time.BodyAcc.Z.stdev",
    "time.GravityAcc.X.mean", "time.GravityAcc.Y.mean", "time.GravityAcc.Z.mean", "time.GravityAcc.X.stdev", "time.GravityAcc.Y.stdev", "time.GravityAcc.Z.stdev",
    "time.BodyAccJerk.X.mean", "time.BodyAccJerk.Y.mean", "time.BodyAccJerk.Z.mean", "time.BodyAccJerk.X.stdev", "time.BodyAccJerk.Y.stdev", "time.BodyAccJerk.Z.stdev",
    "time.BodyGyro.X.mean", "time.BodyGyro.Y.mean", "time.BodyGyro.Z.mean", "time.BodyGyro.X.stdev", "time.BodyGyro.Y.stdev", "time.BodyGyro.Z.stdev",
    "time.BodyGyroJerk.X.mean", "time.BodyGyroJerk.Y.mean", "time.BodyGyroJerk.Z.mean", "time.BodyGyroJerk.X.stdev", "time.BodyGyroJerk.Y.stdev", "time.BodyGyroJerk.Z.stdev",
    "time.BodyAcc.Mag.mean", "time.BodyAcc.Mag.stdev",
    "time.GravityAcc.Mag.mean", "time.GravityAcc.Mag.stdev",
    "time.BodyAccJerk.Mag.mean", "time.BodyAccJerk.Mag.stdev",
    "time.BodyGyro.Mag.mean", "time.BodyGyro.Mag.stdev",
    "time.BodyGyroJerk.Mag.mean", "time.BodyGyroJerk.Mag.stdev",
    "freq.BodyAcc.X.mean", "freq.BodyAcc.Y.mean", "freq.BodyAcc.Z.mean", "freq.BodyAcc.X.stdev", "freq.BodyAcc.Y.stdev", "freq.BodyAcc.Z.stdev",
    "freq.BodyAccJerk.X.mean", "freq.BodyAccJerk.Y.mean", "freq.BodyAccJerk.Z.mean", "freq.BodyAccJerk.X.stdev", "freq.BodyAccJerk.Y.stdev", "freq.BodyAccJerk.Z.stdev",
    "freq.BodyGyro.X.mean", "freq.BodyGyro.Y.mean", "freq.BodyGyro.Z.mean", "freq.BodyGyro.X.stdev", "freq.BodyGyro.Y.stdev", "freq.BodyGyro.Z.stdev",
    "freq.BodyAcc.Mag.mean", "freq.BodyAcc.Mag.stdev",
    "freq.BodyAccJerk.Mag.mean", "freq.BodyAccJerk.Mag.stdev",
    "freq.BodyGyro.Mag.mean", "freq.BodyGyro.Mag.stdev",
    "freq.BodyGyroJerk.Mag.mean", "freq.BodyGyroJerk.Mag.stdev")

#
# create a second tidy dataset grouping the observations by subject and activity with the average of each variable 
#
result2 <- aggregate( result1[,3:length(result1)], list(subject=result1$subject, activity=result1$activity), mean )

#
# and finally, write the datasets out for submission as part of the course project
#
write.csv(result1, "result1.csv", row.names=FALSE)
write.csv(result2, "result2.csv", row.names=FALSE)
