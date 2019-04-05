
function task1_6(MAT_ClusterCentres)
% Input:
%  MAT_ClusterCentres : file name of the MAT file that contains cluster centres C.

% Displays the image of each cluster centre
load(MAT_ClusterCentres,'C');
num = size(C,1);
Imgs = zeros(28,28,num);

for n=1:num
    Imgs(:,:,n) = reshape(C(n,:), 28, 28)';
end

figure
montage(Imgs);
end
