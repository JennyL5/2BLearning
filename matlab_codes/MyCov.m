function Covs = MyCov(Matrix, Means)
% Input:
%    Matrix : A-by-D data matrix
%    Means  : D-by-1 sample mean vector
% Output:
%    Covs: D-by-D sample covariance matrix

% Size
A = size(Matrix, 1);

% Compute covariance matrix
d = Matrix' - repmat(Means, 1, A);
Covs = (d * d') / A;

end