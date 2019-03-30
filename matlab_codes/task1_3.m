%
%
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

%Mean=double(sum(X))./size(X,1);
%variances=sum(bsxfun(@minus,EVecs,Mean).^2)./(size(EVecs,1)-1);
variances = var(pca(X));
%computes cumulative variances
CumVar=cumsum(variances);

MinDims=zeros(4,1);
total=size(CumVar,2);

% Sort prinicipal components ie. e-vectors by eigenvalue
V = V(:,D);
% Project matrix X to principal component subspace
PC_A = X * V;

%plots principle component 1 with var
plot(PC_A(:,1), CumVar)
%plot(CumVar);
ylabel('Cumulative variance');
xlabel('Number of Principal Components');
box on



% finds the minimum number of PCA dimensions to cover 70%, 80%, 90%, 95% of the total variance
for i=1:total
    if CumVar(i)>=0.7*CumVar(total) && MinDims(1)==0
        MinDims(1)=i;
    end
    
    if CumVar(i)>=0.8*CumVar(total)  && MinDims(2)==0
        MinDims(2)=i;
    end
    
    if CumVar(i)>=0.9*CumVar(total)  && MinDims(3)==0
        MinDims(3)=i;
    end
    
    if CumVar(i)>=0.95*CumVar(total)  && MinDims(4)==0
        MinDims(4)=i;
        break
    end
end

end
