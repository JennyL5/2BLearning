
function task1_4(EVecs)
% Input:
%  Evecs : the same format as in comp_pca.m

img = zeros(28,28,10);

for i=1:10
   img(:,:,i) = (reshape(EVecs(:,i),28,28)');
end

montage(img, 'DisplayRange',[-0.5,0.5]);
end
