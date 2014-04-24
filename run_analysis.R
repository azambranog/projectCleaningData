##############################################################################
### This script takes the samsung data and returns a tidy data set that contains
### only info on averages and standard deviations.
### The resulting data set is a csv file with column names.
### The activity labels are set to be single words instead of numbers.
### There is a column for activity (labels) and one for test subject 
###############################################################################

###############################################################################
### first we will only take care of the X (features) 
### From the features file we want to check which features we want to keep
### We want to keep the features that contain mean() and std()

features<-read.table("features.txt",col.names=c("number","name")) #get features

logicalmean<-grepl("mean()",features$name,fixed=TRUE)
logicalstd<-grepl("std()",features$name,fixed=TRUE)

#keep only features that are mean or standard deviations
features<-features[logicalmean|logicalstd,]

################################################################################
### Now we read the X files, keep the columns that interst us and
### give them proper names. 

#read
train<-read.table(".\\train\\X_train.txt")
test<-read.table(".\\test\\X_test.txt")

#drop irrelevant columns
train<-train[,features$number]
test<-test[,features$number]

#give columns names
names(train)<-features$name
names(test)<-features$name

###########################################################################
### we add the extra colum with the activity labels

#add the original columns
train<-cbind(read.table(".\\train\\y_train.txt",col.names="Activity"),train)
test<-cbind(read.table(".\\test\\y_test.txt",col.names="Activity"),test)

#get the labels for activities
activities<-read.table("activity_labels.txt",col.names=c("number","name"))

#replace activity numbers for names
train$Activity<-factor(train$Activity,labels=activities$name)
test$Activity<-factor(test$Activity,labels=activities$name)

############################################################################
### add the column for the subject and merge data sets

##add subjects
train<-cbind(read.table(".\\train\\subject_train.txt",col.names="Subject"),train)
test<-cbind(read.table(".\\test\\subject_test.txt",col.names="Subject"),test)

## join the sets
tidySet<-rbind(train,test)

## order the sets by subject just so it looks nicer:)
tidySet<-tidySet[order(tidySet$Subject,tidySet$Activity),]


##############################################################################
### export to csv and txt files

write.csv(tidySet,"tidySet.csv",row.names=FALSE)
write.csv(tidySet,"tidySet.txt",row.names=FALSE)
