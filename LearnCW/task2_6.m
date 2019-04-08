
function Dmap = task2_6(X, Y, epsilon, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  X        : M-by-D data matrix (double)
%  Y        : M-by-1 label vector (uint8)
%  epsilon  : scalar (double) for covariance matrix regularisation
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec   : 1-by-D vector (double) to specity the position of the plane
%  nbins     : scalar (integer) denoting the number of bins for each PCA axis
% Output
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.

load(MAT_evecs,'EVecs');
load(MAT_evals,'EVals');

% For the start position of the plot, project mean vector into 2D pca space 
den = size(X,1);
mu = sum(X,1)/den;
E1 = EVecs(:,1); 
E2 = EVecs(:,2);
num = nbins*nbins;
meanE1 = mu*E1;
meanE2 = mu*E2;
varE1 = EVals(1,:);
varE2 = EVals(2,:);

E1plot = linspace(meanE1-5*sqrt(varE1),meanE2+5*sqrt(varE1), nbins)';
E2plot = linspace(meanE1-5*sqrt(varE2),meanE2+5*sqrt(varE2), nbins)';
% Obtain the grid vectors for the two dimensions
[E1v E2v] = meshgrid(E1plot, E2plot);
Dmap = [E1v(:), E2v(:)]; % Concatenate to get a 2D point holding the class number

% Convert the 2D coordinate from the dmap back to a D dimensional 
% feature vector to feed it back into k-nn classfier
GridPoints = zeros(num,784);
for i=1:num
    GridPoints(i,:) = (EVecs*padarray(Dmap(i,:),[0 782], 'post')'+posVec')'; 
end

%Classification by assigning each data point to the closest center in C.
%Gaussian Classification
[Ypreds, Ms, Covs] = run_gaussian_classifiers(X, Y, GridPoints, 0.01);
classification = Ypreds(:,1);

Dmap = permute(reshape(classification,nbins,nbins),[2 1]);
Dmap = uint8(Dmap);

% Draws the decision boundaries
figure
[CC,h] = contourf(E1plot(:), E2plot(:),reshape(classification, length(E1plot), length(E2plot)));
set(h,'LineColor','none');

%save('task2_6_dmap.mat', 'Dmap');
    
end
