function Dmap = task2_2(Xtrn, Ytrn, k, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  E1trn : M-bE1E2-D data matriE1 (double)
%  E1E2trn : M-bE1E2-1 label vector (uint8)
%  k    : scalar (integer) - the number of nearest neighbours
%  MAT_evecs : MAT filename of eigenvector matriE1 of D-bE1E2-D
%  MAT_evals : MAT filename of eigenvalue vector of D-bE1E2-1
%  posVec    : 1-bE1E2-D vector (double) to specitE1E2 the position of the plane
%  nbins     : scalar (integer) - the number of bins for each PCA aE1is
% Output:
%  Dmap  : nbins-bE1E2-nbins matriE1 (uint8) - each element represents
%	   the cluster number that the point belongs to.

load(MAT_evecs,'EVecs');
load(MAT_evals,'EVals');

den = size(Xtrn,1);
mean = sum(Xtrn,1)/den;
E1 = EVecs(:,1); 
E2 = EVecs(:,2);
numGridPoints = nbins*nbins;
meanE1 = mean*E1;
meanE2 = mean*E2;
varE1 = EVals(1,:);
varE2 = EVals(2,:);

E1plot = linspace(meanE1-5*sqrt(varE1),meanE2+5*sqrt(varE1), nbins)';
E2plot = linspace(meanE1-5*sqrt(varE2),meanE2+5*sqrt(varE2), nbins)';
% Obtain the grid vectors for the two dimensions
[E1v, E2v] = meshgrid(E1plot, E2plot);
Dmap = [E1v(:), E2v(:)]; % Concatenate to get a 2D point holding the class number

% Convert the 2D coordinate from the dmap back to a D dimensional 
% feature vector to feed it back into k-nn classfier
projectedGridPoints = zeros(numGridPoints,784);
for i=1:numGridPoints
    projectedGridPoints(i,:) = (EVecs*padarray(Dmap(i,:),[0 782], 'post')'+posVec')'; 
end

%k-NN Classification
Ypreds = run_knn_classifier(Xtrn, Ytrn, projectedGridPoints, k);
classifcation = Ypreds(:,1);

Dmap = permute(reshape(classifcation,nbins,nbins),[2 1]);
Dmap = uint8(Dmap);

% Draws the decision boundaries
figure
[~,h] = contourf(E1plot(:), E2plot(:),reshape(classifcation, length(E1plot), length(E2plot)));
set(h,'LineColor','none');

end
