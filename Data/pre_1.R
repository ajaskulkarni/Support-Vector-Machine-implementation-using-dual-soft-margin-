install.package("bigpca")
library(bigpca)

train = read.csv("train_data.csv")
test = read.csv("test_data.csv")
train_new = train[,2:785]
test_new = test[,2:785]

# ------------------------------------------------------------------------------------------
# Uniform reduction of 50% of pixels
u1 = uniform.select(train_new, keep = 0.5, rows = FALSE, random = FALSE)

train_50 = as.data.frame(train_new[,u1$order.c])
train_c = as.data.frame(train[,1])
train_50 = cbind(train_c, train_50)
colnames(train_50)[1] = "V1"
View(train_50)

test_50 = as.data.frame(test_new[,u1$order.c])
test_c = as.data.frame(test[,1])
test_50 = cbind(test_c, test_50)
colnames(test_50)[1] = "V1"
View(test_50)

write.csv(train_50, file = "train_50.csv", row.names = FALSE)
write.csv(test_50, file = "test_50.csv", row.names = FALSE)
# ------------------------------------------------------------------------------------------
# Uniform reduction of 75% of pixels
u2 = uniform.select(train_new, keep = 0.25, rows = FALSE, random = FALSE)

train_25 = as.data.frame(train_new[,u2$order.c])
train_c = as.data.frame(train[,1])
train_25 = cbind(train_c, train_25)
colnames(train_25)[1] = "V1"
View(train_25)

test_25 = as.data.frame(test_new[,u2$order.c])
test_c = as.data.frame(test[,1])
test_25 = cbind(test_c, test_25)
colnames(test_25)[1] = "V1"
View(test_25)

write.csv(train_25, file = "train_25.csv", row.names = FALSE)
write.csv(test_25, file = "test_25.csv", row.names = FALSE)
# ------------------------------------------------------------------------------------------
# Uniform reduction of 90% of pixels
u3 = uniform.select(train_new, keep = 0.10, rows = FALSE, random = FALSE)

train_10 = as.data.frame(train_new[,u3$order.c])
train_c = as.data.frame(train[,1])
train_10 = cbind(train_c, train_10)
colnames(train_10)[1] = "V1"
View(train_10)

test_10 = as.data.frame(test_new[,u3$order.c])
test_c = as.data.frame(test[,1])
test_10 = cbind(test_c, test_10)
colnames(test_10)[1] = "V1"
View(test_10)

write.csv(train_10, file = "train_10.csv", row.names = FALSE)
write.csv(test_10, file = "test_10.csv", row.names = FALSE)
# ------------------------------------------------------------------------------------------
# Uniform reduction of 95% of pixels
u4 = uniform.select(train_new, keep = 0.05, rows = FALSE, random = FALSE)

train_5 = as.data.frame(train_new[,u4$order.c])
train_c = as.data.frame(train[,1])
train_5 = cbind(train_c, train_5)
colnames(train_5)[1] = "V1"
View(train_5)

test_5 = as.data.frame(test_new[,u4$order.c])
test_c = as.data.frame(test[,1])
test_5 = cbind(test_c, test_5)
colnames(test_5)[1] = "V1"
View(test_5)

write.csv(train_5, file = "train_5.csv", row.names = FALSE)
write.csv(test_5, file = "test_5.csv", row.names = FALSE)