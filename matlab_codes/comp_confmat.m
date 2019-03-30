function [CM, acc] = comp_confmat(Ytrues, Ypreds)
% Input:
%   Ytrues : N-by-1 ground truth label vector
%   Ypreds : N-by-1 predicted label vector
% Output:
%   CM : K-by-K confusion matrix, where CM(i,j) is the number of samples whose target is the ith class that was classified as j
%   acc : accuracy (i.e. correct classification rate)


% Initialisation of confusion matrix
K = 10;
CM = zeros(K, K);

% Iterate over each class
for k = 1:K
   % Compute vector of predictions corresponding to truth of class k
   preds = Ypreds(Ytrues == k);
   % Increment the kth row (samples that should be of class k) in CM 
   for j = preds'
       CM(k,j) = CM(k,j) + 1;
   end 
end

% Compute accuracy
acc = trace(CM) / size(Ytrues, 1);

end
