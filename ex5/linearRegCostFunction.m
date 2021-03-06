function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
squared_err = (X * theta - y) .^ 2;
total = sum(squared_err) / (2 * m);
param = theta;
param(1) = 0;
temp = sum(param .^ 2);
J = total + temp * lambda / (2 * m);

% Compute gradients.
err = X * theta - y;
for j = 1:size(theta)
    grad(j) = err' * X(1:end, j);
end
reg = theta;
reg(1) = 0;
reg = reg * lambda;
grad = (grad + reg) / m;




% =========================================================================

grad = grad(:);

end
