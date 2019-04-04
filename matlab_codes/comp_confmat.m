function [CM, acc] = comp_confmat(Ytrues, Ypreds, K)
% Input:
%   Ytrues : N-by-1 ground truth label vector
%   Ypreds : N-by-1 predicted label vector
%   K The number of classes (which is 10 for our data set) 
% Output:
%   CM : K-by-K confusion matrix, where CM(i,j) is the number of samples whose target is the ith class that was classified as j
%   acc : accuracy (i.e. correct classification rate)

% Initialisation of confusion matrix
CM = zeros(K, K);
C = size(Ytrues,1);

% Iterate over each class
for i = 1:C
    CM(Ytrues(i)+1,Ypreds(i)+1) = CM(Ytrues(i)+1,Ypreds(i)+1) + 1;
end

% Compute accuracy
acc = sum(diag(CM))/C;

% Display accuracy as percentage
acc = acc*100;
fprintf('Accuracy: %.4f. \n',acc);


end