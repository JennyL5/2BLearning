function [Ypreds] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector (uint8) for Xtrain
%   Xtest  : N-by-D test data matrix (double)
%   Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain
% Output:
%   Ypreds : N-by-L matrix (uint8) of predicted labels for Xtest

% Matrix sizes
N = size(Xtest, 1);          % number of test samples
L = size(Ks, 2);            % number of different k-values to use

% Compute distances between each test sample and each training sample
DI = MySqDist(Xtrain, Xtest);

% Sort the distances between each test sample and all the training samples
[~, idx] = sort(DI, 2, 'ascend');                   % idx = N-by-M matrix

% Initialise prediction matrix (N-by-L)
Ypreds = zeros(N, L);

% Iterate over each value of k from Ks
for i = 1:L   
    % Select the indexes corresponding to k nearest neighbours
    k = Ks(i);
    % Add 1 column in case k==1
    k_idx = [idx(:, 1:k) ones(N,1)];                % k_idx = N-by-(k+1) matrix

    % Choose the most frequent class out of the k neighbours, for each sample
    classes = Ytrain(k_idx);
    classes = classes(:,1:end-1);                   % remove last column
    Ypreds(:,i) =  mode(classes, 2);
end

end
