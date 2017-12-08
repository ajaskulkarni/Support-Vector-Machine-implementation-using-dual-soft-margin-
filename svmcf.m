function [C, order, Acc] = svmcf(train, test)

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
UB = 1000*ones(1,nrow);

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
f = (alpha.*y_train)'*rbf(x_test, x_train)' + b;
pred = sign(f);
[C, order] = confusionmat(y_test,pred);
Acc = (C(1,1)+C(2,2))/size(y_test,1);
Acc = Acc * 100;
end