%
%
function Dmap = task1_7(MAT_ClusterCentres, MAT_M, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  MAT_ClusterCentres: MAT filename of cluster centre matrix
%  MAT_M     : MAT filename of mean vectors of (K+1)-by-D, where K is
%              the number of classes (which is 10 for the MNIST data)
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec    : 1-by-D vector (double) to specify the position of the plane
%  nbins     : scalar (integer) to specify the number of bins for each PCA axis
% Output
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.


load(MAT_evecs,'EVecs');
load(MAT_evals,'EVals');
load(MAT_M,'M');
load(MAT_ClusterCentres,'C');
mean = M(end,:); % row vectors
Y1 = EVecs(:,1); %column vectors
Y2 = EVecs(:,2);
numGridPoints = nbins*nbins;
% The means are the projection of the mean onto the 2 principal components
meanY1 = mean*Y1;
meanY2 = mean*Y2;
varY1 = EVals(1,:);
varY2 = EVals(1,:);
Y1plot = linspace(meanY1-5*sqrt(varY1),meanY2+5*sqrt(varY1), nbins)';
Y2plot = linspace(meanY1-5*sqrt(varY2),meanY2+5*sqrt(varY2), nbins)';
% Obtain the grid vectors for the two dimensions
[Y1v Y2v] = meshgrid(Y1plot, Y2plot);
grid2D = [Y1v(:), Y2v(:)]; % Concatenate to get a 2-D point.			  
%Dmap = grid2D;
% Revert projection into D-Space 
projectedGridPoints = zeros(numGridPoints,784);
for i=1:numGridPoints
    projectedGridPoints(i,:) = (EVecs*padarray(grid2D(i,:),[0 782], 'post')'+posVec')'; % Orthogonality of EVecs implies that the inverse of EVecs is EVecs'
end

%1-NN Classification
classesOfPoints = zeros(numGridPoints,1);
distMatr = mySqDist(projectedGridPoints,C,numGridPoints,size(C,1));
for i=1:numGridPoints
    [minDist,clusterIndex] = min(distMatr(i,:));
    classesOfPoints(i,:) = clusterIndex;
end

Dmap = permute(reshape(classesOfPoints,nbins,nbins),[2 1])

% This function will draw the decision boundaries
figure
[CC,h] = contourf(Y1plot(:), Y2plot(:),reshape(classesOfPoints, length(Y1plot), length(Y2plot)));
set(h,'LineColor','none');

end
