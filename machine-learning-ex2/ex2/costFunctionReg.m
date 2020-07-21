function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
for i=1:m
	J = J -y(i)*log((1+e^(-1*X(i,:)*theta))^(-1))-(1-y(i))*log(1-(1+e^(-X(i,:)*theta))^(-1));
end

n = length(theta);
J =1/m*J +lambda/(2*m)*sum(theta.^2);

theta1 = theta;
theta1(1) = 0;
grad = 1/m*X'*((e.^(-1*X*theta) + 1).^(-1) - y) + (lambda/m).*theta1;



% =============================================================

end
