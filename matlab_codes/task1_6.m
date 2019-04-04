%
%
function task1_6(MAT_ClusterCentres)
% Input:
%  MAT_ClusterCentres : file name of the MAT file that contains cluster centres C.
%       

load(MAT_ClusterCentres,'C');
numC = size(C,1);
montageImages = zeros(28,28,numC);
for i=1:numC
    montageImages(:,:,i) = reshape(C(i,:), 28, 28)';
end
figure
montage(montageImages);
end
