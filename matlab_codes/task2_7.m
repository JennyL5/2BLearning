%
%
function [CM, acc] = task2_7(Xtrain, Ytrain, Xtest, Ytest, epsilon, ratio)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  ratio  : scalar (double) - ratio of training data to use.
% Output:
%  CM     : K-by-K matrix (integer) of confusion matrix
%  acc    : scalar (double) of correct classification rate

M = round(size(Xtrain,1) * ratio);
[Ypreds, ~, ~] = run_gaussian_classifiers(Xtrain(1:M,:), Ytrain(1:M,:), Xtest, epsilon);
[CM, acc] = comp_confmat(Ytest, Ypreds, 10);
ratio = ratio*100;
save(sprintf('task2_7_cm_%d.mat',ratio), 'CM');

end
