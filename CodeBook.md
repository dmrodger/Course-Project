user: dmrodger
Date: 5/25/14

1. Files used:
subject_train.txt
X_train.txt
Y_train.txt
subject_test.txt
X_test.txt
Y_test.txt
features.txt
activity_labels.txt

These files include all the data needed in creating this tidy dataset.
The subject files include the subject numbers in the study.
The x files hold the actual data held, and the y files tell us which of the 6 activities the 
subject performed.
The features.txt file has the names for the 561 variables.
The activity_labels.txt has the names of the 6 different activities used.


2. Creating initial dataset
Using rbind and cbind, the first 6 files are merged to create our first dataset.
This dataset shows every subject and each activity with the 561 pieces of data for each.

3. Remove non-mean and non-sd variables
Subset the dataset by only retrieving the variables that calculate mean or sd.

4. Rename the columns to provide more meaningful variables
The first dataset uses V1-V561 to name the variables; we use the features.txt file
which holds the real variable names. Eventually, we clean up these names by removing "()" and dashes

5. Convert activity number to the meaningful names using the activity_labels.txt file
This replaces the 1-6 numbers with the actual activites performed.

6. Create subgroups and calculate the mean of all the variables for each subject and each activity
Utilize the reshape and reshape2 packages to aggregate the mean across each subject and activity.
This is our final tidy dataset.


Variable names: Where there is an XYZ, that denotes 3 separate variables for each dimension measured

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

For each of thes, there is a mean and standard deviation.