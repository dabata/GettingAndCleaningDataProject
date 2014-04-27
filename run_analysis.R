#import list of features and list of activities
getwd()
setwd("./Data/UCI HAR Dataset")
features<-read.table(file="features.txt")
activity<-read.table(file="activity_labels.txt")
colnames<-features$V2

#read and column binding test data
setwd("./test")
ytst<-read.table(file="y_test.txt",col.names=c("activity"))
stst<-read.table(file="subject_test.txt",col.names="subject")
xtst<-read.table(file="X_test.txt",col.names=colnames,check.names=FALSE)
tst<-cbind(stst,ytst,xtst)

#read and column binding training data
setwd("../train")
ytrain<-read.table(file="y_train.txt",col.names=c("activity"))
strain<-read.table(file="subject_train.txt",col.names="subject")
xtrain<-read.table(file="X_train.txt",col.names=colnames,check.names=FALSE)
train<-cbind(strain,ytrain,xtrain)

#append test data to training data
all<-rbind(train,tst)

#Extracts only the measurements on the mean and standard deviation for each measurement
#shift each retained features by two columns : subject and activity columns already added
MeasuresCols<-grep("mean.\\)$|std.\\)$",colnames)
ShiftMeasuresCols<-MeasuresCols+2
AllCols<-c(1,2,ShiftMeasuresCols)

#join to add activity labels
setwd("..")
actlbls<-read.table(file="activity_labels.txt",col.names=c("activity","activity_label"))
MyData<-all[,AllCols]
install.packages("plyr")
library(plyr)
tidy<-join(MyData, actlbls, by="activity")

#average each variable by each activity and each subject
install.packages("sqldf")
library(sqldf)
tidysumz<-sqldf("select * from tidy group by subject,activity")

#reshape data (columns names modified by sqldef function) and advance labels column
names(tidysumz)<-names(tidy)
tidysumz<-tidysumz[,c(1,2,21,3:20)]

#write data to txt file
write.table(tidysumz, file = "tidysumz.txt", row.names = FALSE)



