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


%computes cumulative variances
CumVar=cumsum(EVals);

MinDims=zeros(4,1);
total=size(CumVar,2);

%plots principle component 1 with var
plot(CumVar)
ylabel('Cumulative variance');
xlabel('Number of Principal Components');
box on


% finds the minimum number of PCA dimensions to cover 70%, 80%, 90%, 95% of the total variance
for i=1:total
    if CumVar(i)>=0.7*CumVar(total) && MinDims(1)==0
        MinDims(1)=i;
    end
    
    if CumVar(i)>=0.8*CumVar(total) && MinDims(2)==0
        MinDims(2)=i;
    end
    
    if CumVar(i)>=0.9*CumVar(total) && MinDims(3)==0
        MinDims(3)=i;
    end
    
    if CumVar(i)>=0.95*CumVar(total) && MinDims(4)==0
        MinDims(4)=i;
        break
    end
    
end

for i = 1 : 4
    disp(i + ": " + MinDims);
    %disp(MinDims(i));
end
