%
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

  %% If 'maxIter' argument is not given, we set by default to 500
  if nargin < 4
    maxIter = 500;
  end
  
  [N dim] = size(x);      % dataset dimensions
  D = zeros(k, N);        % KxN matrix for storing distances between
                        % cluster centres and observations
  idx_prev = zeros(1, N); % 1xN vector storing cluster assignments

  for i = 1:maxIter
% Compute Squared Euclidean distance (i.e. the squared distance)
% between each cluster centre and each observation
    for c = 1:k
        D(c,:) = square_dist(X, initialCentres(c,:));
    end
    % Assign data to clusters
    % Ds are the actual distances and idx are the cluster assignments
    [Ds, idx] = min(D); % find min dist. for each column

    % Update cluster initialCentres
    for c = 1 : k
        %check the number of samples assigned to this cluster
        if( sum(idx==c) == 0 )
            warn('k-means: cluster %d is empty', c);
        else
            C(c, :) = mean( X(idx==c,:) );
        end
    end

    % Check for convergence
    if( sum( abs(idx - idx_prev) ) == 0 )
        break;
    end

    % update previous assignment vector with current
    idx_prev = idx;
  end
  
    SSE = 0;
    for k = 1:size(C,1)
        k_points = X(idx == k, :);  % points in kluster k
        sq_diff = sum(bsxfun(@minus, k_points, C(k,:)) .^ 2, 2); 
        SSE = SSE + (1/size(A,1)) * sum(sq_diff);
    
    end
 
end
