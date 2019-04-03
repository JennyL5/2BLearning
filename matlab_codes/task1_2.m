function M = task1_2(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
% Output:
%  M : (K+1)-by-D mean vector matrix (double)
%      Note that M(K+1,:) is the mean vector of X.

M = zeros(11,784);
samples = size(Y,1);
sizes = zeros(11,1);
sizes(11) = samples;

for i=1:samples
    Ind = Y(i) + 1;
    M(Ind,:) = M(i,:);
    sizes(Ind) = sizes(Ind) + 1;
end

M = M ./ sizes;
Imgs = zeros(28,28,11);
for j=1:11
    Imgs(:,:,j) = reshape(M(j,:), 28, 28)';
end
montage(Imgs);
%save('task1_2_M.mat','M');
end
