

# load amd unzip source data into working directory
# soure data location https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


# 1. Read and merge  data files from working directory : 
subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

merged_data <- cbind(rbind(subtrain, subtest), rbind(ytrain, ytest), rbind(xtrain, xtest))


# 2. Give  id columns proper names and label other columns based on features files content  
colnames(merged_data) <- c("subject", "activity", as.character(features[, 2]))


# 3. Replace activity Id with activity name 
merged_data[, 2] <- activities[merged_data[, 2], 2]

# 4. Create reduced data with only mean and st.dev features 
reduced_data <- merged_data[,grep("-(mean|std)\\(\\)", features[, 2])]

# 5. Remove parenthesys from names 
names(reduced_data) <- gsub('\\(|\\)',"",names(reduced_data), perl = TRUE)

# 6. Group and calucate average by activity and subject, write results to file
result_data <- ddply(reduced_data, .(subject, activity), numcolwise(mean))
write.table(result_data, "result_data.txt", row.name=FALSE)

