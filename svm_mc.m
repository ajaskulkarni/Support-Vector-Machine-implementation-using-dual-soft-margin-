clear;
clc;
% Data for 10 SVMs
train = csvread('train_data_0.csv',1);
%train = csvread('train_data_1.csv',1);
%train = csvread('train_data_2.csv',1);
%train = csvread('train_data_3.csv',1);
%train = csvread('train_data_4.csv',1);
%train = csvread('train_data_5.csv',1);
%train = csvread('train_data_6.csv',1);
%train = csvread('train_data_7.csv',1);
%train = csvread('train_data_8.csv',1);
%train = csvread('train_data_9.csv',1);
test = csvread('test_data_new_0_9.csv',1);

% Total number of rows and columns in training data
[nrow,ncol] = size(train);
[nrow1,ncol1] = size(test);

% Storing labels and data in different variables
x_train = train(:,[2:ncol]);
y_train = train(:,1);

% Storing labels and data in different variables
x_test = test(:,[2:ncol1]);
y_test = test(:,1);

% Radial basis function
k = rbf(x_train, x_train);

% Other matrices and vectors
H = (y_train*y_train').*k;
f = -1*ones(1, nrow);
A = [];
b = [];
Aeq = y_train';
beq = 0;
LB = zeros(1,nrow);
UB = 100*ones(1,nrow);

% function call to quadprog
alpha = quadprog(H,f,A,b,Aeq,beq,LB,UB);

% Replacing small number by 0 (alpha*)
e1 = 1e-6;
alpha(alpha < e1) = 0;
ind = find((alpha > e1)&(alpha < 100));
xi0 = x_train(ind(1),:);
yi0 = y_train(ind(1)); 

% Calculating bias
b = yi0 - (alpha.*y_train)'*rbf(x_train, xi0);
% Decision rule
f = (alpha.*y_train)'*rbf(x_test, x_train) + b;
pred = sign(f);
% Change this value according to digit you want to classify
% in test data
% For example -> if you want to classify 0 then pred(1:100)
% If you want to classify 7 then pred(701:800)
acc = sum(pred(1:100)==1);
acc