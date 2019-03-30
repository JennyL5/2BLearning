function [EVecs, EVals] = comp_pca(X)
% Input: 
%   X:  N x D matrix (double)
% Output: 
%   EVecs: D-by-D matrix (double) contains all eigenvectors as columns
%       NB: follow the Task 1.3 specifications on eigenvectors.
%   EVals:
%       Eigenvalues in descending order, D x 1 vector (double)
%   (Note that the i-th columns of Evecs should corresponds to the i-th element in EVals)
  %% TO-DO

% %calculate mean
% col_sum=sum(X);
% means=double(col_sum)./size(X,1);
% % Calculate covariance matrix
%     N = size(M,1);
%     covar_m = 1/(N-1) * (M' * M);
%     
%     % Calculate eigenvectors and values of cov matrix
%     [PC, V] = eig(covar_m);
% V = diag(V);
% %calculate covariance of matrix
mu = sum(X) / size(X,1);
M = bsxfun(@minus,X,mu);
W= M'*M/(size(X,1)-1);

[V,D]=eig(W);
%V is eigenvector, D is eigenvalue

%first element of each eigenvector is non-negative & each eigenvector is a unit vector
for x=1:size(V)
   if V(1,x)<0
    V(:,x)=V(:,x)*(-1);
   end
end
% eigenvalues should be sorted in descending order, so that 1 is the largest and D is the smallest
% [D,ind]=sort(diag(D),'descend');
% Ds=D(:,:);
% Vs=V(:,ind);
% EVecs=Vs;
% EVals=Ds;
% Vs = sort(diag(D),'descend');

D=diag(sort(diag(D),'descend')); % make diagonal matrix out of sorted diagonal values of input D
[Ds, ind]=sort(diag(D),'descend'); % store the indices of which columns the sorted eigenvalues come from
Vs=V(:,ind); % arrange the columns in this order
EVecs = Vs;
EVals = Ds;


end

