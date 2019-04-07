function Dmap = task1_7(MAT_ClusterCentres, MAT_M, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  MAT_ClusterCentres: MAT filename of cluster centre matrix
%  MAT_M     : MAT filename of mean vectors of (K+1)-by-D, where K is
%              the number of classification (which is 10 for the MNIST data)
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec    : 1-by-D vector (double) to specify the position of the plane
%  nbins     : scalar (integer) to specify the number of bins for each PCA aE1is
% Output:
%  Dmap  : nbins-bE2-nbins matriE1 (uint8) - each element represents
%	   the cluster number that the point belongs to.

load(MAT_ClusterCentres,'C');
load(MAT_M,'M');
load(MAT_evecs,'EVecs');
load(MAT_evals,'EVals');

% For the start position of the plot, project mean vector into 2D pca space 
mean = M(end,:); % row vectors
E1 = EVecs(:,1); %column vectors
E2 = EVecs(:,2);
numGridPoints = nbins*nbins;
meanE1 = mean*E1;
meanE2 = mean*E2;
varE1 = EVals(1,:);
varE2 = EVals(2,:);

E1plot = linspace(meanE1-5*sqrt(varE1),meanE2+5*sqrt(varE1), nbins)';
E2plot = linspace(meanE1-5*sqrt(varE2),meanE2+5*sqrt(varE2), nbins)';
% Obtain the grid vectors for the two dimensions
[E1v E2v] = meshgrid(E1plot, E2plot);
Dmap = [E1v(:), E2v(:)]; % Concatenate to get a 2D point holding the class number

% Convert the 2D coordinate from the dmap back to a D dimensional 
% feature vector to feed it back into k-nn classfier
projectedGridPoints = zeros(numGridPoints,784);
for i=1:numGridPoints
    projectedGridPoints(i,:) = (EVecs*padarray(Dmap(i,:),[0 782], 'post')'+posVec')'; 
end

%Classification by assigning each data point to the closest center in C.
classification = length(E1v(:));
DM = MySqDist(projectedGridPoints,C,numGridPoints,size(C,1)); %Compute distances
for i=1:length(Dmap)
    [~,idE1] = min(DM(i,:));
    classification(i,:) = idE1;
end

Dmap = permute(reshape(classification,nbins,nbins),[2 1]);
Dmap = uint8(Dmap);

% Draws the decision boundaries
figure
[CC,h] = contourf(E1plot(:), E2plot(:),reshape(classification, length(E1plot), length(E2plot)));
set(h,'LineColor','none');

end
