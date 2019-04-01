%
%
function task1_4(EVecs)
% Input:
%  Evecs : the same format as in comp_pca.m
%

M = zeros(10,784);

for i=1:784
    M(i,:) = EVecs(i,:);
end

img = zeros(28,28,11);
for i=1:10
    img(:,:,i) = reshape(EVecs(i,:),28,28)';
end
montage(img);

end
