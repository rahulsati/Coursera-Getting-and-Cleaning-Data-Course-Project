library(plyr)

# Load Train Data
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Load Test Data
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Load Features Data
features <- read.table("./UCI HAR Dataset/features.txt")

# Load Activity Data
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Step 1
# Merge the training and test sets to create one data set - (xData, yData, subjectData)

# create 'x' data set
xData <- rbind(xTrain, xTest)

# create 'y' data set
yData <- rbind(yTrain, yTest)

# create 'subject' data set
subjectData <- rbind(subjectTrain, subjectTest)

# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement

# get only columns with mean() or std() in their names
# meanAndStdFeatures <- grep("-(mean|std)\\(\\)", features[, 2])
meanAndStdFeatures <- grep('mean|std', features[, 2])

# subset the desired columns
xData <- xData[, meanAndStdFeatures]

# correct the column names
names(xData) <- features[meanAndStdFeatures, 2]

# Step 3
# Use descriptive activity names to name the activities in the data set

# update values with correct activity names
yData[, 1] <- activities[yData[, 1], 2]

# correct column name
names(yData) <- "activity"

# Step 4
# Appropriately label the data set with descriptive variable names

# correct column name
names(subjectData) <- "subject"

# bind all the data in a single data set
allData <- cbind(xData, yData, subjectData)

# Step 5
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject

# 66 <- 68 columns but last two (activity & subject)
tidyData <- ddply(allData, .(subject, activity), function(x) colMeans(x[, 1:79]))

write.table(tidyData, "tidyData.txt", row.name=FALSE)