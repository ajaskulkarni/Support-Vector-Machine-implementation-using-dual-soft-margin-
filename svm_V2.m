clear;
train = csvread('train_data.csv',1);
test = csvread('test_data.csv',1);

[C, Acc] = svmcf(train, test)

% Converting data into matrix
train = table2array(traindata);
test = table2array(testdata);

% Storing labels and data in different variables
x_train = train(:,[2:785]);
y_train = train(:,1);

% Storing labels and data in different variables
x_test = test(:,[2:785]);
y_test = test(:,1);

% Total number of rows and columns in training data
[nrow,ncol] = size(x_train);

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
e1 = 1e-6
alpha(alpha < e1) = 0;
ind = find((alpha > e1)&(alpha < 100));
xi0 = x_train(ind(1),:);
yi0 = y_train(ind(1)); 

% Calculating bias
b = yi0 - (alpha.*y_train)'*rbf(x_train, xi0);

% Radial basis function
d2 = pdist2(x_test, x_train);
d2 = d2.^2;
k2 = exp(-0.05.*d2);

f = (alpha.*y_train)'*rbf(x_test, x_train)' + b;
pred = sign(f)
C = confusionmat(y_test,pred)
Acc = (C(1,1)+C(2,2))/size(y_test,1);
Acc = Acc * 100;
