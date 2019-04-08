function [Ypreds] = run_knn_classifier(Xtrn, Ytrn, Xtst, Ks)
%Input:
%   Xtrn : M-by-D training data matrix (double)
%   Ytrn : M-by-1 label vector (unit8) for Xtrain
%   Xtst  : N-by-D test data matrix (double)
%   Ytst  : N-by-1 label vector (unit8) for Xtest
%   Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain
%Output:
%   [Ypreds] : N-by-L matrix of predicted labels for Xtst

%Calculating the Eucledean Distance
numXtrn = size(Xtrn,1);
numXtst = size(Xtst,1);
num = size(Ks,2);
%Calls MySqDist (vectorisation)
DM = MySqDist(Xtst,Xtrn,numXtst,numXtrn);

Ypreds = zeros(numXtst,num);

for i=1:num
    for j=1:numXtst
        [d I] = sort(DM(j,:), 'ascend');
        % Calculate the mode of the predicted data
        Ypreds(j,i) = mode(Ytrn(I(1:Ks(i))));
    end
end

end



