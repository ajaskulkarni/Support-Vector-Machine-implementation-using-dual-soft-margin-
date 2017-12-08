# Data Preprocessing for Training data
t1 = read.table("train0.txt")
t11 = t1[1:100,]
dim(t11)

t2 = read.table("train1.txt")
t12 = t2[1:100,]
dim(t12)

t3 = read.table("train2.txt")
t13 = t3[1:100,]
dim(t13)

t4 = read.table("train3.txt")
t14 = t4[1:100,]
dim(t14)

t5 = read.table("train4.txt")
t15 = t5[1:100,]
dim(t15)

t6 = read.table("train5.txt")
t16 = t6[1:100,]
dim(t16)

t7 = read.table("train6.txt")
t17 = t7[1:100,]
dim(t17)

t8 = read.table("train7.txt")
t18 = t8[1:100,]
dim(t18)

t9 = read.table("train8.txt")
t19 = t9[1:100,]
dim(t17)

t10 = read.table("train9.txt")
t10 = t10[1:100,]
dim(t10)

# Converting data into dataframe
t11 = data.frame(t11)
t12 = data.frame(t12)
t13 = data.frame(t13)
t14 = data.frame(t14)
t15 = data.frame(t15)
t16 = data.frame(t16)
t17 = data.frame(t17)
t18 = data.frame(t18)
t19 = data.frame(t19)
t10 = data.frame(t10)

# Combining data into variable training_data
training_data = rbind(t11,t12,t13,t14,t15,t16,t17,t18,t19,t10) 
d = dim(training_data)
d

# Scaling
for (i in 2:785) {
  k = max(training_data[,i])
  if(k!=0) {
    training_data[,i] = training_data[,i]/k
  }
}

for (i in 1:1000) {
  if(training_data[i,1]==7){
    training_data[i,1] = 1
  }
  else
  {
    training_data[i,1] = -1
  }
}

# Checking NaN values
sum(is.na(training_data))

# Storing training data in csv file
write.csv(training_data, file = "train_data_7.csv", row.names = FALSE)

# Data Preprocessing for Test data
tr1 = read.table("test0.txt")
t21 = tr1[1:100,]
dim(t21)

tr2 = read.table("test1.txt")
t22 = tr2[1:100,]
dim(t22)

tr3 = read.table("test2.txt")
t23 = tr3[1:100,]
dim(t23)

tr4 = read.table("test3.txt")
t24 = tr4[1:100,]
dim(t24)

tr5 = read.table("test4.txt")
t25 = tr5[1:100,]
dim(t25)

tr6 = read.table("test5.txt")
t26 = tr6[1:100,]
dim(t26)

tr7 = read.table("test6.txt")
t27 = tr7[1:100,]
dim(t27)

tr8 = read.table("test7.txt")
t28 = tr8[1:100,]
dim(t28)

tr9 = read.table("test8.txt")
t29 = tr9[1:100,]
dim(t29)

tr10 = read.table("test9.txt")
t20 = tr10[1:100,]
dim(t20)

# Converting data into dataframe
t21 = data.frame(t21)
t22 = data.frame(t22)
t23 = data.frame(t23)
t24 = data.frame(t24)
t25 = data.frame(t25)
t26 = data.frame(t26)
t27 = data.frame(t27)
t28 = data.frame(t28)
t29 = data.frame(t29)
t20 = data.frame(t20)

# Combining data into variable test_data
test_data = rbind(t21,t22,t23,t24,t25,t26,t27,t28,t29,t20) 
d = dim(test_data)

# Scaling
for (i in 2:785) {
  k = max(test_data[,i])
  if(k!=0) {
    test_data[,i] = test_data[,i]/k
  }
} 

# Checking NaN values
sum(is.na(test_data))

# Storing test data in csv file
write.csv(test_data, file = "test_data_new_0_9.csv", row.names = FALSE)


