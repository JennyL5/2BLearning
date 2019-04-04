
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
    % Compute Squared Euclidean distance (i.e. the squared distance)
    %   between each cluster centre and each observation
    %for d = 1:k
     DM = MySqDist(X,C, num, k);
    %end
    
    for n = 1 : num
        [minD, ind] = min(DM(n,:));
        SSE(i,1) = SSE(i,1) + minD;
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
       
        if (sum(idx==c) == 0)
             fprintf('cluser %d is empty', c);
        end

        Xcluster = X(idx==c,:);
        bott = size(Xcluster,1);
        C(c, :) = (1/bott) * sum(Xcluster);
    end
    
     SSE = 0;
    % Calculate sum squared error for iteration i
    for c = 1:k
        member_mat = X(idx==c,:);                                                  % Matrix of points that belong to cluster c
        centre_sub_mat = member_mat - repmat(initialCentres(c, :), size(member_mat,1),1); % Subtracts cluster centre from each point
        l2_norm_mat = sqrt(sum(centre_sub_mat.^2,2));                              % Calculates L2 norm of each vector
        SSE = sum(l2_norm_mat,1) + SSE;
    end

    C=initialCentres;
end



