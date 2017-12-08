# Support Vector Machine implementation using dual soft margin

Support Vector Machine with the dual soft-margin is implemented in Matlab for hand written digits classification. 
Support Vector Machine is implemend with Radial Basis function and dual soft-margin equation is optimized using “quadprog”
function in Matlab.

In this project, we have used SVM for binary classification as well as for multiclass classification. 
In binary classification, we have classified 3s vs. 6s for three conditions using 500 data points for training as well as for
test the model. In the first condition, we used all the data, i.e., 500 data points for training. For the second condition we 
reduced the pixels (784) uniformly by 50%, 75%, 90% and 95% and in the third condition, we reduced the pixels (784) using SVD by 
50%, 75%, 90% and 95%. In addition to that, we also have checked the results after reducing training examples by 50%, 75%,
90% and 95%. Further, we used SVM to classify even vs. odd numbers. For even-odd classification, we have used 1000 data points 
(100 data points for every digit) for training as well as for test data. In the end, we performed multi-class classification 
using SVM. For multi-class classification, we generated 10 SVMs, and we used 1000 data points for training as well as for test the 
model.
