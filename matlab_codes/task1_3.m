
function [EVecs, EVals, CumVar, MinDims] = task1_3(X)
% Input:
%  X : M-by-D data matrix (double)
% Output:
%  EVecs, Evals: same as in comp_pca.m
%  CumVar  : D-by-1 vector (double) of cumulative variance
%  MinDims : 4-by-1 vector (integer) of the minimum number of PCA dimensions
%            to cover 70%, 80%, 90%, and 95% of the total variance.

%calls comp_pca
[EVecs,EVals]=comp_pca(X);

%computes cumulative variances
CumVar=cumsum(EVals);
MinDims=zeros(4,1);
total=CumVar(end);

%plots principle component 1 with Cumulative Variance
plot(CumVar)
ylabel('Cumulative variance');
xlabel('Number of Principal Components');
box on

% finds the minimum number of PCA dimensions to cover 70%, 80%, 90%, 95% of the total variance
MinDims(1) = find(CumVar >= 0.7*total,1);
MinDims(2) = find(CumVar >= 0.8*total,1);
MinDims(3) = find(CumVar >= 0.9*total,1);
MinDims(4) = find(CumVar >= 0.95*total,1);

% disp(MinDims);
% save('task1_3_evecs.mat','EVecs');
% save('task1_3_evals.mat','EVals');
% save('task1_3_cumvar.mat','CumVar');
% save('task1_3_mindims.mat','MinDims');
end
 


