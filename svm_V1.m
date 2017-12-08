% Storing imported data into train and test variables
train = table2array(traindata);
test = table2array(testdata);

% Storing labels and data in different variables
x_train = train(:,[2:785]);
y_train = train(:,1);

% Storing labels and data in different variables
x_test = test(:,[2:785]);
y_test = test(:,1);

% Total number of columns in training data
nrow = size(x_train,1);
% Total number of rows in training data
ncol = size(x_train,2);

% Defining vectors and matrics for quarpro function
% Radial basis function
d = pdist2(x_train, x_train);
d = d.^2;
k = exp(-0.05.*d);

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

% Defining vectors and matrics for quarpro function
% Radial basis function
d1 = pdist2(x_train, xi0);
d1 = d1.^2;
k1 = exp(-0.05.*d1);

% Calculating bias
b = yi0 - (alpha.*y_train)'*k1;

% Radial basis function
d2 = pdist2(x_test, x_train);
d2 = d2.^2;
k2 = exp(-0.05.*d2);

f = (alpha.*y_train)'*k2' + b;
f1 = sign(f)
