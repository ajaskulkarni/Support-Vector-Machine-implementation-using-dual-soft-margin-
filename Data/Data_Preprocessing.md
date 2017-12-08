Data preprocessing, is performed in R and details about data preprocessing for every condition are explained below,

• 3s vs. 6s classification
1) First 250 rows from data files were extracted for training data and stored in two different variables. After that, both the variables were converted into a data frame and concatenated. The concatenated data then stored in a variable.
2) Scaling is performed on data by dividing maximum value from each column to every value in the same column. The results generated from scaling was in between 0 and 1. We stored the scaled data in one variable, and then checked for NaN values. In the data, label 3 is replaced by -1 and label 6 is replaced by 1.
3) After doing all the above steps, we saved the data into a train_data.csv file, which will be the training data for our model.
4) Similar preprocessing is performed for the test data, and the test data is selected from test3.txt and test6. txt. After performing above preprocessing, we stored the test data in test_data.csv file.

• Even vs. odd classification
1) For even and odd classifications we extracted 0, 2, 4, 6 and 8 digits as even numbers from their respective train and test data files. In case of odd numbers, we extracted 1, 3, 5, 7 and 9 digits from their respective train and test data files. For this classification, we have extracted 100 data points for every digit. So our test and training data both will have 1000 data points each.
2) After extracting all the data points, we combined the data and stored it in one data frame. We performed all the preprocessing steps as mentioned above for training and test data. In the end, we replace all even number labels by -1 and all odd number labels by 1.

• Multiclass classification
1) For multiclass classification, we used 100 data points for every digit in training as well as in test data. We also performed all the preprocessing steps as mentioned above with one change.
2) For this type of classification, we created 10 independent data files for training data and one common test data file. In training data suppose if you want to detect a particular digit say 0 then we replaced the label 0 as +1 and other labels (1, 2, 3, .. , 9) to -1. So in this way, we prepared 10 training data files.
