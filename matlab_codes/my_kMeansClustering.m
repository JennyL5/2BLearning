
function [C, idx, SSE] = my_kMeansClustering(X, k, initialCentres, maxIter)
% Input
%   X : N-by-D matrix (double) of input sample data
%   k : scalar (integer) - the number of clusters
%   initialCentres : k-by-D matrix (double) of initial cluster centres
%   maxIter  : scalar (integer) - the maximum number of iterations
% Output
%   C   : k-by-D matrix (double) of cluster centres
%   idx : N-by-1 vector (integer) of cluster index table
%   SSE : (L+1)-by-1 vector (double) of sum-squared-errors

%If 'maxiter' argument is not given, we set default to 500
if nargin < 4
    maxIter = 500;
end

[num, d] = size(X);
idx = zeros(num, 1);                                      
C = initialCentres;

% Iterate 'maxiter' times
for i = 1:maxIter
    idxInvariant = true;
    SSE(i,1) = 0;
    % Compute Squared Euclidean distance between each cluster centre and each observation
    DM = MySqDist(X,C, num, k);
    
    for n = 1 : num
        % Assign data to clusters 
        % Ds are the actual distances and ind are the cluster assignments
        [Ds, ind] = min(DM(n,:)); %find min dist. for each observation
        SSE(i,1) = SSE(i,1) + Ds;
        if idx(n) ~= ind
            idxInvariant = false;
            idx(n) = ind;
        end
    end
    
     if idxInvariant
         break;
     end
     
    % Update cluster centres
    C = zeros(k, d);
    for c = 1:k
        %check the number of samples assigned to this cluster 
        if (sum(idx==c) == 0)
             fprintf('cluser %d is empty', c);
        end
         C(c, :) = (1/size(X(idx==c,:),1) * sum(X(idx==c,:)));
    end

end



