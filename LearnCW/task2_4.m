%
%
function [Corrs] = task2_4(Xtrain, Ytrain)
% Input:
%  Xtrain : M-by-D data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for X
% Output:
%  Corrs  : (K+1)-by-1 vector (double) of correlation $r_{12}$ 
%           for each class k = 1,...,K, and the last element holds the
%           correlation for the whole data, i.e. Xtrain.

% Compute PCA 
[EVecs, EVals] = comp_pca(Xtrain);
% Convert training data to the first two principle components
PC = Xtrain * EVecs;
PC = PC(:,1:2);

% Calculate the correlation between first two principle component for
% each class and all classes
Corrs = zeros(11,1);
for i=0:9
    PCc = PC(Ytrain==i,:);
    x=PCc(:,1);
    y=PCc(:,2);
    % Normalise the data against the mean
    xs = bsxfun(@minus,x,MyMean(x));
    ys = bsxfun(@minus,y,MyMean(y));
    corr = sum(xs.*ys) / (sqrt(sum(xs.^2)) * sqrt(sum(ys.^2)));
    Corrs(i+1,:) = corr;
    disp(sprintf("%d : %d",i+1,corr));
end
Corrs(11,:) = corr;
% save('task2_4_corrs.mat','Corrs');
end
