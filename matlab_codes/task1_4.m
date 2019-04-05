
function task1_4(EVecs)
% Input:
%  Evecs : the same format as in comp_pca.m

%Displays the images of the first 10 principle axes of PCA

imgs = zeros(28,28,10);

for i=1:10
   imgs(:,:,i) = (reshape(EVecs(:,i),28,28)');
end

montage(imgs, 'DisplayRange',[-0.5,0.5]);
end
