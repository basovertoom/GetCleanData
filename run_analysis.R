# Read in the data

features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")
subject_test <- read.table("test/subject_test.txt")
data_test <- read.table("test/X_test.txt")
activity_test <- read.table("test/y_test.txt")
subject_train <- read.table("train/subject_train.txt")
data_train <- read.table("train/X_train.txt")
activity_train <- read.table("train/y_train.txt")

# column bind both test and train data with the 'subject' and 'activity' data, and then row

data_test <- cbind(subject_test, activity_test, data_test)
data_train <- cbind(subject_train, activity_train, data_train)
data_set <- rbind(data_test, data_train)

# set the column for the data_set

features <- as.character(features$V2)
new_names <- c("Subject", "Activity")
column_names <- c(new_names, features)
names(data_set) <- column_names

#subset data for 'mean' and 'std' values

mean_values <- grep("mean", names(data_set))
std_values <- grep("std", names(data_set))
data_set <- data_set[ ,c(1,2,mean_values, std_values)]

#Reorder the data set on Subject and Activity 

library(plyr)
data_set <- arrange(data_set, data_set[, 1], data_set[, 2])

# split for unique activity AND subject and calculate column means for each subject and each activity

data_set.split <- split(data_set, list(data_set$Activity, data_set$Subject))
mean.data_set <- sapply(data_set.split, function(x) colMeans(x[, c(3:81)]))
tidy_data <- data.frame(t(mean.data_set))

# add Subject and Activity numbers and subsitute Acitvity_labels

Subject <- gl(30,6)
Activity <- rep(seq(1:6), 30)
Activity <- factor(Activity, label=activity_labels[, 2])
tidy_data <- cbind(Subject, Activity, tidy_data)
row.names(tidy_data) <- c(1:180)

# write txt.file
write.table(tidy_data, file="tidy_data.txt")
