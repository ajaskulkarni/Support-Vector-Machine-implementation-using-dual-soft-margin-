clear;
%--------------------------------------------------------------------------------------------------------------
% Q. 3,4)
%--------------------------------------------------------------------------------------------------------------

% SVM classification for 3s vs. 6s
train = csvread('train_data.csv',1);
test = csvread('test_data.csv',1);
[C, order, Acc] = svmcf(train, test);
disp('Confusion matrix is')
C
%   -1      1
%   250     0
%    11    239
fprintf('Percentage accuracy is %f%%\n', Acc)
% 97.80%
fprintf('Percentage error is %f%%\n', 100-Acc)
% 2.2%

% --------------------------------------------------------------------------------------------------------------
% Q. 5)
%--------------------------------------------------------------------------------------------------------------

% Reducing orignal number of pixels by 50%
train = csvread('train_50.csv',1);
test = csvread('test_50.csv',1);
[C, order, Acc] = svmcf(train, test);
disp('Confusion matrix is')
C
%   -1      1
%   248     2
%     1    249
fprintf('Percentage accuracy is %f%%\n', Acc)
% 99.40%
fprintf('Percentage error is %f%%\n', 100-Acc)
% 0.60%
% --------------------------------------------------------------------------------------------------------------
% Reducing orignal number of pixels by 75%
train = csvread('train_25.csv',1);
test = csvread('test_25.csv',1);
[C, order, Acc] = svmcf(train, test);
disp('Confusion matrix is')
C
%   -1      1
%   244     6
%     5    245
fprintf('Percentage accuracy is %f%%\n', Acc)
% 97.80%
fprintf('Percentage error is %f%%\n', 100-Acc)
% 2.20%% 
%--------------------------------------------------------------------------------------------------------------
% Reducing orignal number of pixels by 90%
train = csvread('train_10.csv',1);
test = csvread('test_10.csv',1);
[C, order, Acc] = svmcf(train, test);
disp('Confusion matrix is')
C
%   -1      1
%   241     9
%     7    243
fprintf('Percentage accuracy is %f%%\n', Acc)
% 96.80%
fprintf('Percentage error is %f%%\n', 100-Acc)
% 3.20%
%--------------------------------------------------------------------------------------------------------------
% Reducing orignal number of pixels by 95%
train = csvread('train_5.csv',1);
test = csvread('test_5.csv',1);
[C, order, Acc] = svmcf(train, test);
disp('Confusion matrix is')
C
%   -1      1
%   235    15
%    17    233
fprintf('Percentage accuracy is %f%%\n', Acc)
% 93.60%
fprintf('Percentage error is %f%%\n', 100-Acc)
% 6.40%

%--------------------------------------------------------------------------------------------------------------
% Q. 6)
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
%   -1      1
%   250     0
%     9    241
fprintf('Percentage accuracy is %f%%\n', Acc)
% 98.20%
fprintf('Percentage error is %f%%\n', 100-Acc)
% 1.80%
%--------------------------------------------------------------------------------------------------------------
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
%   -1      1
%   249     1
%     3    247
fprintf('Percentage accuracy is %f%%\n', Acc)
% 99.20%
fprintf('Percentage error is %f%%\n', 100-Acc)
% 0.80%
%--------------------------------------------------------------------------------------------------------------
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
%   -1      1
%   249     1
%     2    248
fprintf('Percentage accuracy is %f%%\n', Acc)
% 99.40%
fprintf('Percentage error is %f%%\n', 100-Acc)
% 0.60%
%--------------------------------------------------------------------------------------------------------------
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
%   -1      1
%   249     1
%     1    249
fprintf('Percentage accuracy is %f%%\n', Acc)
% 99.60%
fprintf('Percentage error is %f%%\n', 100-Acc)
% 0.40%

%--------------------------------------------------------------------------------------------------------------
% Q. 7)
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
%   -1      1
%   248     2
%    15    235
fprintf('Percentage accuracy is %f%%\n', Acc)
% 96.60%
fprintf('Percentage error is %f%%\n', 100-Acc)
% 3.40%
%--------------------------------------------------------------------------------------------------------------
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
%   -1     1
%   250    0
%   47    203
fprintf('Percentage accuracy is %f%%\n', Acc)
% 90.60%
fprintf('Percentage error is %f%%\n', 100-Acc)
% 9.40%
%--------------------------------------------------------------------------------------------------------------
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
%   -1     1
%   250    0
%    79   171
fprintf('Percentage accuracy is %f%%\n', Acc)
% 84.20%
fprintf('Percentage error is %f%%\n', 100-Acc)
% 15.80%
%--------------------------------------------------------------------------------------------------------------
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
%   -1     1
%   250    0
%   140   110
fprintf('Percentage accuracy is %f%%\n', Acc)
% 72.00%
fprintf('Percentage error is %f%%\n', 100-Acc)
% 28.00%

%--------------------------------------------------------------------------------------------------------------
% Q. 8)
%--------------------------------------------------------------------------------------------------------------

train = csvread('train_data_even_odd.csv',1);
test = csvread('test_data_even_odd.csv',1);
[C, order, Acc] = svmcf(train, test);
disp('Confusion matrix is')
C
%   -1      1
%   474     26
%    40    460
fprintf('Percentage accuracy is %f%%\n', Acc)
% 93.40%
fprintf('Percentage error is %f%%\n', 100-Acc)
% 6.60%

%--------------------------------------------------------------------------------------------------------------
% Q. 9)
%--------------------------------------------------------------------------------------------------------------

train = csvread('train_data_0.csv',1);
test = csvread('test_data_new_0_9.csv',1);
[C, order, Acc] = svmcf(train, test);
disp('Confusion matrix is')
C
%   -1      1
%   474     26
%    40    460
fprintf('Percentage accuracy is %f%%\n', Acc)
% 93.40%
fprintf('Percentage error is %f%%\n', 100-Acc)
% 6.60%

