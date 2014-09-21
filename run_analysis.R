#read in original data files from UCI HAR Dataset
activity<-read.table("activity_labels.txt")
features<-read.table("features.txt")
subject_test<-read.table("subject_test.txt")
  colnames(subject_test)<-c("subject")
subject_train<-read.table("subject_train.txt")
  colnames(subject_train)<-c("subject")
x_test<-read.table("x_test.txt")
x_train<-read.table("x_train.txt")
y_test<-read.table("y_test.txt")
  colnames(y_test)<-c("activityLabel")
y_train<-read.table("y_train.txt")
  colnames(y_train)<-c("activityLabel")

#create columns names for test and train datasets
featuresV2<-as.character(features$V2)
colnames(x_test)<-c(featuresV2)
colnames(x_train)<-c(featuresV2)

#combine test and train datasets
x<-rbind(x_test, x_train)
y<-rbind(y_test, y_train)
subject<-rbind(subject_test, subject_train)

#subset the x dataset down to mean() and sd() columns
xMean<-grep("mean()", colnames(x))
xSD<-grep("std()",colnames(x))
x2<-x[ ,c(xMean,xSD)]

#attach subject id to the x2 dataset
subject_x2<-cbind(subject, x2)

#attach activity label to the dataset
xComplete<-cbind(y, subject_x2)

#Use descriptive activity names to name the activities in xComplete 
xComplete$activityLabel[xComplete$activityLabel==1]<-gsub(1, "Walking",xComplete$activityLabel)
xComplete$activityLabel[xComplete$activityLabel==2]<-gsub(2, "WalkingUpstairs",xComplete$activityLabel)
xComplete$activityLabel[xComplete$activityLabel==3]<-gsub(3, "WalkingDownstairs",xComplete$activityLabel)
xComplete$activityLabel[xComplete$activityLabel==4]<-gsub(4, "Sitting",xComplete$activityLabel)
xComplete$activityLabel[xComplete$activityLabel==5]<-gsub(5, "Standing",xComplete$activityLabel)
xComplete$activityLabel[xComplete$activityLabel==6]<-gsub(6, "Laying",xComplete$activityLabel)

#labels variables with descriptive variable names
colnames(xComplete)<-gsub("-","_",colnames(xComplete))
colnames(xComplete)<-gsub("\\()","",colnames(xComplete))

#reshape data to show the average of each variable, for each subject and activity
xMeanSD<-xComplete[,!colnames(xComplete) %in% c("activityLabel","subject")]
xAgg<-aggregate(xMeanSD,by=list(xComplete$subject,xComplete$activityLabel),FUN=mean)
colnames(xAgg)[1]<- "Subject"
colnames(xAgg)[2]<- "Activity"

#write xAgg dataset to a .txt file for submission
write.table(xAgg,file="run_analysis_output.txt",row.name=FALSE)
