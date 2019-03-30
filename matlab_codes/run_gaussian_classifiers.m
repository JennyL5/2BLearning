function [Ypreds, Ms, Covs] = run_gaussian_classifiers(Xtrain, Ytrain, Xtest, epsilon)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector for Xtrain (uint8)
%   Xtest  : N-by-D test data matrix (double)
%   epsilon : A scalar variable (double) for covariance regularisation
% Output:
%  Ypreds : N-by-1 matrix (uint8) of predicted labels for Xtest
%  Ms     : K-by-D matrix (double) of mean vectors
%  Covs   : K-by-D-by-D 3D array (double) of covariance matrices

%YourCode - Bayes classification with multivariate Gaussian distributions.

% Size of matrices
D = size(Xtrain,2);
N = size(Xtest,1);
K = 10;             % number of classes

%compute covairance matrix
L = size(matrix, 1);
diff = matrix' - repmat(MyMean, 1, L);
myCov = (diff * diff') / L;


% Compute matrix of sample mean vectors 
%   & 3D array of sample covariance matrices (including regularisation)
Ms = zeros(D,K);
Covs = zeros(D,D,K);
for k = 1:K
    samples = Xtrain(Ytrain == k, :);           % training samples from class k
    mu = myMean(samples);
    Ms(:,k) = mu;
    Covs(:,:,k) = MyCov(samples, mu) + eye(D) * epsilon;
end

% NB: No need to include the prior probability to compute the posterior
%     probability, since we assume a uniform prior distribution over class

% Compute posterior probabilities for the test samples, in the log domain
post_log = zeros(N, K);
for k = 1:K
    mu = Ms(:,k);
    sigma = Covs(:,:,k);
    diff = Xtst' - repmat(mu, 1, N);
    post_matrix = - 0.5 * diff' * inv(sigma) * diff - 0.5 * log(det(sigma));
    post_log(:,k) =  diag(post_matrix);
end

% Choose the class corresponding to the max posterior probability, for each test sample
[~, Ypreds] = max(post_log, [], 2);


end
