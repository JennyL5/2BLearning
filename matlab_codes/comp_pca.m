function [EVecs, EVals] = comp_pca(X)
% Input: 
%   X:  N x D matrix (double)
% Output: 
%   EVecs: D-by-D matrix (double) contains all eigenvectors as columns
%       NB: follow the Task 1.3 specifications on eigenvectors.
%   EVals:
%       Eigenvalues in descending order, D x 1 vector (double)
%   (Note that the i-th columns of Evecs should corresponds to the i-th element in EVals)

%calculate covariance of matrix
mu = sum(X) / size(X,1); %calculates mean vector
M = bsxfun(@minus,X,mu); 
W= M'*M/(size(X,1)-1); % covariance matrix

[V,D]=eig(W);
D = diag(D);
%V is eigenvector, D is eigenvalue

%first element of each eigenvector is non-negative & each eigenvector is a unit vector
for i=1:size(V)
   if V(1,i)<0
    V(:,i)=(-1)*V(:,i);
   end
end

% eigenvalues should be sorted in descending order, so that 1 is the largest and D is the smallest
[EVals, indices]=sort(D,'descend'); 
EVecs = V(:,indices); 
end

