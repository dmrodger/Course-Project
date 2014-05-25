
library(plyr)

#merges training and test sets
setwd("C:/Users/Dylan/Desktop/Coursera R/Tidy Data Project")

# read and merge files to create dataset
subject.train <- read.table("./train/subject_train.txt")
x.train <- read.table("./train/X_train.txt")
y.train <- read.table("./train/Y_train.txt")
train <- cbind(subject.train, y.train, x.train)

subject.test <- read.table("./test/subject.test.txt")
x.test <- read.table("./test/X_test.txt")
y.test <- read.table("./test/Y_test.txt")
test <- cbind(subject.atest, y.test, x.test)

dataset <- rbind(train, test)

#rename subject and activity columns
colnames(dataset)[1] <- "subject"
colnames(dataset)[2] <- "activity"


# retrieve features that only calculate mean and sd
# subset the dataset to only have mean, sd and subject and activity
feature.file <- read.table("./features.txt", col.names = c("index", "name"))
features <- subset(feature.file, grepl('-mean[(]|std[(])', feature.file$name))

# store the column numbers and names needed
list.of.columns <- as.numeric(as.character(features$index))
list.of.columns <- c(1, 2, list.of.columns+c(2))
name.of.columns <- as.character(features$name)
name.of.columns <- c("subject", "activity", name.of.columns)

# subset the data
dataset <- dataset[,list.of.columns]

# rename the columns using name.of.columns
colnames(dataset) <- name.of.columns

# read activity labels
activity.labels <- read.table("./activity_labels.txt")
activity <- tolower(as.character(activity.labels$V2))

# convert activity from number to descriptive names
dataset$activity[dataset$activity == 1] <- activity[1]
dataset$activity[dataset$activity == 2] <- activity[2]
dataset$activity[dataset$activity == 3] <- activity[3]
dataset$activity[dataset$activity == 4] <- activity[4]
dataset$activity[dataset$activity == 5] <- activity[5]
dataset$activity[dataset$activity == 6] <- activity[6]

# rename column names
names(dataset) <- gsub("-",".",names(dataset))
names(dataset) <- gsub("()","",names(dataset), fixed=TRUE)

# create tidy dataset: calculate averages for each variable for
# each activity and each subject
melted.dataset <- melt(dataset, id=c("subject","activity"))
tidy.dataset <- dcast(melted.dataset, subject + activity ~ variable, fun.aggregate=mean)