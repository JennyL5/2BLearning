function [Ypreds, MMs, MCovs] = run_mgcs(Xtrain, Ytrain, Xtest, epsilon, L)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector for Xtrain (uint8)
%   Xtest  : N-by-D test data matrix (double)
%   epsilon : A scalar parameter for regularisation (double)
%   L      : scalar (integer) of the number of Gaussian distributions per class
% Output:
%  Ypreds : N-by-1 matrix of predicted labels for Xtest (integer)
%  MMs     : (L*K)-by-D matrix of mean vectors (double)
%  MCovs   : (L*K)-by-D-by-D 3D array of covariance matrices (double)

% Initialisation
[num, dim] = size(Xtrain);
MMs = zeros(10*L, dim);
MCovs = zeros(10*L, dim, dim);
% Corresponding class labels of training data for K*L classes
MYtrain = zeros(num,1);

% Run kmeans clustering to obtain L centers for each class
for i = 0 : 9
    Xc = Xtrain(Ytrain==i,:);
    [Cc, idx, SSE] = my_kMeansClustering(Xc, L, Xc(1:L,:));
    % Update the class labels to match multiple classifier for each
    % class
    MYtrain(Ytrain==i,:) = i +(idx - 1) * 10;
end  

% Run Gaussian classifiers on test data and recover the original class label
[Ypreds, MMs, MCovs] = run_gaussian_classifiers(Xtrain, MYtrain, Xtest, epsilon);
Ypreds = mod(Ypreds, 10);
end
