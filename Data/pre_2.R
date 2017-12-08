# Data Preprocessing for Training data
t1 = read.table("train0.txt")
t11 = t1[1:100,]
dim(t11)

t2 = read.table("train2.txt")
t12 = t2[1:100,]
dim(t12)

t3 = read.table("train4.txt")
t13 = t3[1:100,]
dim(t13)

t4 = read.table("train6.txt")
t14 = t4[1:100,]
dim(t14)

t5 = read.table("train8.txt")
t15 = t5[1:100,]
dim(t15)

to1 = read.table("train1.txt")
to11 = to1[1:100,]
dim(to11)

to2 = read.table("train3.txt")
to12 = to2[1:100,]
dim(to12)

to3 = read.table("train5.txt")
to13 = to3[1:100,]
dim(to13)

to4 = read.table("train7.txt")
to14 = to4[1:100,]
dim(to14)

to5 = read.table("train9.txt")
to15 = to5[1:100,]
dim(to15)


# Converting data into dataframe
t11 = data.frame(t11)
t12 = data.frame(t12)
t13 = data.frame(t13)
t14 = data.frame(t14)
t15 = data.frame(t15)
to11 = data.frame(to11)
to12 = data.frame(to12)
to13 = data.frame(to13)
to14 = data.frame(to14)
to15 = data.frame(to15)

# Combining data into variable training_data
training_data = rbind(t11,t12,t13,t14,t15,to11,to12,to13,to14,to15) 
d = dim(training_data)
d

# Scaling
for (i in 2:785) {
  k = max(training_data[,i])
  if(k!=0) {
    training_data[,i] = training_data[,i]/k
  }
}

# Labeling even as -1 and odd as 1
for (i in 1:1000) {
  if((training_data[i,1]%%2)==0){
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
write.csv(training_data, file = "train_data_even_odd.csv", row.names = FALSE)

# Data Preprocessing for Test data
t1 = read.table("test0.txt")
t11 = t1[1:100,]
dim(t11)

t2 = read.table("test2.txt")
t12 = t2[1:100,]
dim(t12)

t3 = read.table("test4.txt")
t13 = t3[1:100,]
dim(t13)

t4 = read.table("test6.txt")
t14 = t4[1:100,]
dim(t14)

t5 = read.table("test8.txt")
t15 = t5[1:100,]
dim(t15)

to1 = read.table("test1.txt")
to11 = to1[1:100,]
dim(to11)

to2 = read.table("test3.txt")
to12 = to2[1:100,]
dim(to12)

to3 = read.table("test5.txt")
to13 = to3[1:100,]
dim(to13)

to4 = read.table("test7.txt")
to14 = to4[1:100,]
dim(to14)

to5 = read.table("test9.txt")
to15 = to5[1:100,]
dim(to15)


# Converting data into dataframe
t11 = data.frame(t11)
t12 = data.frame(t12)
t13 = data.frame(t13)
t14 = data.frame(t14)
t15 = data.frame(t15)
to11 = data.frame(to11)
to12 = data.frame(to12)
to13 = data.frame(to13)
to14 = data.frame(to14)
to15 = data.frame(to15)

# Combining data into variable training_data
test_data = rbind(t11,t12,t13,t14,t15,to11,to12,to13,to14,to15) 
d = dim(test_data)
d

# Scaling
for (i in 2:785) {
  k = max(test_data[,i])
  if(k!=0) {
    test_data[,i] = test_data[,i]/k
  }
}

# Labeling even as -1 and odd as 1
for (i in 1:1000) {
  if((test_data[i,1]%%2)==0){
    test_data[i,1] = -1
  }
  else
  {
    test_data[i,1] = 1
  }
}

# Checking NaN values
sum(is.na(test_data))

# Storing training data in csv file
write.csv(test_data, file = "testdata_even_odd.csv", row.names = FALSE)