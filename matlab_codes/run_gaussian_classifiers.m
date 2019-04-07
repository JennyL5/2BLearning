
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
    
[numTrain, dimTrain] = size(Xtrain);
[numTest, dimTest] = size(Xtest);
Ms = zeros(10,dimTrain);
Covs = zeros(10,dimTrain,dimTrain);

%Learn parameters
for i=1:10
    classElements = Xtrain((Ytrain==i-1),:);
    Ms(i,:) = MyMean(classElements);
    Covs(i,:,:) = MyCov(classElements);
end

%Classification
logProbMatrix = zeros(10,numTest);
for i=1:10
    % returns log likelihood array for N X D data points x
    mu=Ms(i,:);
    Sigma = reshape(Covs(i,:,:), [dimTrain,dimTrain]);
    Sigma = Sigma + epsilon*eye(size(Sigma,1));
    [N,D] = size(Xtest);
    const = -0.5 * D * log(2*pi);
    xc = bsxfun(@minus,Xtest,mu);
    logp = (-0.5 * sum((xc / Sigma) .* xc, 2))' + (const - 0.5 * logdet(Sigma));
    logProbMatrix(i,:) = logp;%(Ms(i,:),reshape(Covs(i,:,:), [dimTrain,dimTrain]), Xtest, epsilon);
end

[maxV,maxI] = max(logProbMatrix);
Ypreds = (maxI - ones(1,numTest))'; %Subtract 1 since working with labels zero


end