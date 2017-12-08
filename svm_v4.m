clear;
% SVM classification for 3s vs. 6s
train = csvread('train_data.csv',1);
test = csvread('test_data.csv',1);
[C, order, Acc] = svmcf(train, test);
disp('Confusion matrix is')
C
fprintf('Percentage accuracy is %f%%\n', Acc)
fprintf('Percentage error is %f%%\n', 100-Acc)
% --------------------------------------------------------------------------------------------------------------
% Reducing orignal number of pixels by 50%
train = csvread('train_50.csv',1);
test = csvread('test_50.csv',1);
[C, order, Acc] = svmcf(train, test);
disp('Confusion matrix is')
C
fprintf('Percentage accuracy is %f%%\n', Acc)
fprintf('Percentage error is %f%%\n', 100-Acc)

% Reducing orignal number of pixels by 75%
train = csvread('train_25.csv',1);
test = csvread('test_25.csv',1);
[C, order, Acc] = svmcf(train, test);
disp('Confusion matrix is')
C
fprintf('Percentage accuracy is %f%%\n', Acc)
fprintf('Percentage error is %f%%\n', 100-Acc)

% Reducing orignal number of pixels by 90%
train = csvread('train_10.csv',1);
test = csvread('test_10.csv',1);
[C, order, Acc] = svmcf(train, test);
disp('Confusion matrix is')
C
fprintf('Percentage accuracy is %f%%\n', Acc)
fprintf('Percentage error is %f%%\n', 100-Acc)

% Reducing orignal number of pixels by 95%
train = csvread('train_5.csv',1);
test = csvread('test_5.csv',1);
[C, order, Acc] = svmcf(train, test);
disp('Confusion matrix is')
C
fprintf('Percentage accuracy is %f%%\n', Acc)
fprintf('Percentage error is %f%%\n', 100-Acc)
%--------------------------------------------------------------------------------------------------------------
% Using SVD Reducing dimension by 50%
train = csvread('train_data.csv',1);
test = csvread('test_data.csv',1);
train_new = train(:,2:785);
test_new = test(:,2:785);
[U,S,V] = svd(train_new);
% Selecting first 50% columns 
S1 = S(:,1:392);
V1 = V(:,1:392);
train_1 = U*S1;
test_1 = test_new*V1;
train_2 = [train(:,1),train_1];
test_2 = [test(:,1), test_1];
[C, order, Acc] = svmcf(train_2, test_2);
disp('Confusion matrix is')
C
fprintf('Percentage accuracy is %f%%\n', Acc)
fprintf('Percentage error is %f%%\n', 100-Acc)

% Using SVD Reducing dimension by 75%
train = csvread('train_data.csv',1);
test = csvread('test_data.csv',1);
train_new = train(:,2:785);
test_new = test(:,2:785);
[U,S,V] = svd(train_new);
% Selecting first 25% columns 
S1 = S(:,1:196);
V1 = V(:,1:196);
train_1 = U*S1;
test_1 = test_new*V1;
train_2 = [train(:,1),train_1];
test_2 = [test(:,1), test_1];
[C, order, Acc] = svmcf(train_2, test_2);
disp('Confusion matrix is')
C
fprintf('Percentage accuracy is %f%%\n', Acc)
fprintf('Percentage error is %f%%\n', 100-Acc)

% Using SVD Reducing dimension by 90%
train = csvread('train_data.csv',1);
test = csvread('test_data.csv',1);
train_new = train(:,2:785);
test_new = test(:,2:785);
[U,S,V] = svd(train_new);
% Selecting first 10% columns 
S1 = S(:,1:78);
V1 = V(:,1:78);
train_1 = U*S1;
test_1 = test_new*V1;
train_2 = [train(:,1),train_1];
test_2 = [test(:,1), test_1];
[C, order, Acc] = svmcf(train_2, test_2);
disp('Confusion matrix is')
C
fprintf('Percentage accuracy is %f%%\n', Acc)
fprintf('Percentage error is %f%%\n', 100-Acc)

% Using SVD Reducing dimension by 95%
train = csvread('train_data.csv',1);
test = csvread('test_data.csv',1);
train_new = train(:,2:785);
test_new = test(:,2:785);
[U,S,V] = svd(train_new);
% Selecting first 5% columns 
S1 = S(:,1:39);
V1 = V(:,1:39);
train_1 = U*S1;
test_1 = test_new*V1;
train_2 = [train(:,1),train_1];
test_2 = [test(:,1), test_1];
[C, order, Acc] = svmcf(train_2, test_2);
disp('Confusion matrix is')
C
fprintf('Percentage accuracy is %f%%\n', Acc)
fprintf('Percentage error is %f%%\n', 100-Acc)
%--------------------------------------------------------------------------------------------------------------
train = csvread('train_data.csv',1);
test = csvread('test_data.csv',1);
% Randomly selecting 50% training examples
rng(1);
c = randperm(500);
c = c(1:250);
train_new = train(c,:);
[C, order, Acc] = svmcf(train_new, test);
disp('Confusion matrix is')
C
fprintf('Percentage accuracy is %f%%\n', Acc)
fprintf('Percentage error is %f%%\n', 100-Acc)

train = csvread('train_data.csv',1);
test = csvread('test_data.csv',1);
% Randomly selecting 25% rows
rng(1);
c=randperm(500);
c = c(1:125);
train_new = train(c,:);
[C, order, Acc] = svmcf(train_new, test);
disp('Confusion matrix is')
C
fprintf('Percentage accuracy is %f%%\n', Acc)
fprintf('Percentage error is %f%%\n', 100-Acc)

train = csvread('train_data.csv',1);
test = csvread('test_data.csv',1);
% Randomly selecting 10% rows
rng(1);
c=randperm(500);
c = c(1:50);
train_new = train(c,:);
[C, order, Acc] = svmcf(train_new, test);
disp('Confusion matrix is')
C
fprintf('Percentage accuracy is %f%%\n', Acc)
fprintf('Percentage error is %f%%\n', 100-Acc)

train = csvread('train_data.csv',1);
test = csvread('test_data.csv',1);
% Randomly selecting 5% rows
rng(1);
c=randperm(500);
c = c(1:25);
train_new = train(c,:);
[C, order, Acc] = svmcf(train_new, test);
disp('Confusion matrix is')
C
fprintf('Percentage accuracy is %f%%\n', Acc)
fprintf('Percentage error is %f%%\n', 100-Acc)
%--------------------------------------------------------------------------------------------------------------
train = csvread('train_data_even_odd.csv',1);
test = csvread('test_data_even_odd.csv',1);
[C, order, Acc] = svmcf(train, test);
disp('Confusion matrix is')
C
fprintf('Percentage accuracy is %f%%\n', Acc)
fprintf('Percentage error is %f%%\n', 100-Acc)
