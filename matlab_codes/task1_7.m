function Dmap = task1_7(MAT_ClusterCentres, MAT_M, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  MAT_ClusterCentres: MAT filename of cluster centre matrix
%  MAT_M     : MAT filename of mean vectors of (K+1)-by-D, where K is
%              the number of classes (which is 10 for the MNIST data)
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec    : 1-by-D vector (double) to specify the position of the plane
%  nbins     : scalar (integer) to specify the number of bins for each PCA axis
% Output:
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.

load(MAT_ClusterCentres,'C');
load(MAT_M,'M');
load(MAT_evecs,'EVecs');
load(MAT_evals,'EVals');

% For the start position of the plot, project mean vector into 2D pca space 
mean = M(end,:); % row vectors
X = EVecs(:,1); %column vectors
Y = EVecs(:,2);
numGridPoints = nbins*nbins;
meanX = mean*X;
meanY = mean*Y;
varX = EVals(1,:);
varY = EVals(1,:);

Xplot = linspace(meanX-5*sqrt(varX),meanY+5*sqrt(varX), nbins)';
Yplot = linspace(meanX-5*sqrt(varY),meanY+5*sqrt(varY), nbins)';
% Obtain the grid vectors for the two dimensions
[Xv Yv] = meshgrid(Xplot, Yplot);
Dmap = [Xv(:), Yv(:)]; % Concatenate to get a 2D point holding the class number

% Convert the 2D coordinate from the dmap back to a D dimensional 
% feature vector to feed it back into k-nn classfier
projectedGridPoints = zeros(numGridPoints,784);
for i=1:numGridPoints
    projectedGridPoints(i,:) = (EVecs*padarray(Dmap(i,:),[0 782], 'post')'+posVec')'; 
end

%K-NN Classification for each test point
classes = length(Xv(:));
DM = MySqDist(projectedGridPoints,C,numGridPoints,size(C,1)); %Compute distances
for i=1:length(Dmap)
    [~,idx] = min(DM(i,:));
    classes(i,:) = idx;
end

Dmap = permute(reshape(classes,nbins,nbins),[2 1]);

% Draws the decision boundaries
figure
[CC,h] = contourf(Xplot(:), Yplot(:),reshape(classes, length(Xplot), length(Yplot)));
set(h,'LineColor','none');

end
