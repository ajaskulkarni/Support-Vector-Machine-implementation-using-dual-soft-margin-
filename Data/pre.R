# Data Preprocessing for Training data
t1 = read.table("train3.txt")
t11 = t1[1:250,]
dim(t11)

t2 = read.table("train6.txt")
t12 = t2[1:250,]
dim(t12)

# Converting data into dataframe
t11 = data.frame(t11)
t12 = data.frame(t12)

# Combining data into variable training_data
training_data = rbind(t11,t12) 
d = dim(training_data)
d

# Scaling
for (i in 2:785) {
  k = max(training_data[,i])
  if(k!=0) {
    training_data[,i] = training_data[,i]/k
  }
}

# Labeling 3 as -1 and 6 as 1
for (i in 1:500) {
  if(training_data[i,1]==3){
    training_data[i,1] = -1
  }
  else
  {
    training_data[i,1] = 1
  }
}

# Checking NaN values
sum(is.na(training_data))

# Storing training data in csv file
write.csv(training_data, file = "train_data.csv", row.names = FALSE)

# Data Preprocessing for Test data
ts1 = read.table("test3.txt")
ts11 = ts1[1:250,]
dim(ts11)

ts2 = read.table("test6.txt")
ts12 = ts2[1:250,]
dim(ts12)

# Converting data into dataframe
ts11 = data.frame(ts11)
ts12 = data.frame(ts12)

# Combining data into variable test_data
test_data = rbind(ts11,ts12) 
d = dim(test_data)
d

# Scaling
for (i in 2:785) {
  k = max(test_data[,i])
  if(k!=0) {
    test_data[,i] = test_data[,i]/k
  }
}

# Labeling 3 as -1 and 6 as 1
for (i in 1:500) {
  if(test_data[i,1]==3){
    test_data[i,1] = -1
  }
  else
  {
    test_data[i,1] = 1
  }
}

# Checking NaN values
sum(is.na(test_data))

# Storing test data in csv file
write.csv(test_data, file = "test_data.csv", row.names = FALSE)

install.package("bigpca")
library(bigpca)
k = uni