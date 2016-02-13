library(data.table)
library(reshape2)

path <- getwd()
getwd()


###Get the data through the website and save in the local file under directory
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file <- "dataset.zip"

if(!file.exists(path)){
    dir.create(path)
}
download.file(url,file.path(path,file))

###Then unzip the file

executable <- file.path("C:", "Program Files (x86)", "WinRAR", "WinRAR.exe")
parameters <- "x"
cmd <- paste(paste0("\"", executable, "\""), parameters, paste0("\"", file.path(path,file), "\""))
system(cmd)

#Check the files 
pathIn <- file.path(path, "UCI HAR Dataset")
list.files(pathIn, recursive = TRUE)
pathIn


#Read the files
#use fread read subject files at first
SubjectTrain <- fread(file.path(pathIn,"train","subject_train.txt"))
SubjectTest <- fread(file.path(pathIn,"test","subject_test.txt"))

#then read the activity files (or we call labels)
activityTrain <- fread(file.path(pathIn,"train","Y_train.txt"))
activityTest <- fread(file.path(pathIn,"test","Y_test.txt"))
class(activityTest)

#read the major feacture files
train <- fread(file.path(pathIn, "train", "X_train.txt"))
test <- fread(file.path(pathIn, "test", "X_test.txt"))


#Assignment 1 Merget the training and the test sets

subjectTotall <- rbind(SubjectTrain,SubjectTest)
#change the name of variable
setnames(subjectTotall,"V1","subject")  # first is data, second is the variable orginal name and third one is the changed name
activityTotall <- rbind(activityTrain,activityTest)
#change the name of variable
setnames(activityTotall,"V1","activityNum")
data <- rbind(train,test)

#Q1 Merge the coloumns of subject, activityNum and major dataset
subjectTotall <- cbind(subjectTotall,activityTotall)
data <- cbind(subjectTotall,data)

#set key
setkey(data,subject,activityNum)


##Q2 Extract only the mean and standard deviation

# first read the features.txt which is the codebook for name in dataset

features <- fread(file.path(pathIn,"features.txt"))
#find only the name with "mean" and "standard dev" in it

setnames(features,names(features),c("featureNum","featureName"))
features <- features[grepl("mean\\(\\)|std\\(\\)",featureName)]

features$featureCode <- features[,paste0("V",featureNum)]
head(features)

#Then subset the target variables using the these names
select <- c(key(data),features$featureCode)
data <- data[,select,with=FALSE]


#Q3 Use descriptive activity names
activityNames <- fread(file.path(pathIn,"activity_labels.txt"))
setnames(activityNames,names(activityNames),c("activityNum","activityName"))


#Q4 Label with descriptive ativity names
#add labels to activities in the dataset
data$activityNum <- with(data, factor(activityNum,levels = activityNames$activityNum,labels=activityNames$activityName))
str(data)

#Q5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy.data <- aggregate(data[,3:68,with=FALSE],by = list(data$subject,data$activityNum), FUN = mean)
names(tidy.data) <- c("subject","activity",features$featureName)
head(tidy.data)
write.table(tidy.data, file="tidy_data.txt", row.names = FALSE)

###function which important to remember for me 
#1. fread
#2. setnames
#3. file.path
#4.setkey/key
#5.grep/grepl
#6 // just mean / to escape
#paste0 
#7 data.table //with = option
#aggregate function 






























