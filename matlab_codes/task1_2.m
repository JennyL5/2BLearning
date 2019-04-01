function M = task1_2(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
% Output:
%  M : (K+1)-by-D mean vector matrix (double)
%      Note that M(K+1,:) is the mean vector of X.

M = zeros(11,784);
Samples = size(Y,1);
sizes = zeros(11,1);
sizes(11) = Samples;
for i=1:Samples
    Index = Y(i) + 1;
    M(Index,:) = M(i,:);
    sizes(Index) = sizes(Index) + 1;
end
M = M ./ sizes;
montageImgs = zeros(28,28,11);
for i=1:11
    montageImgs(:,:,i) = reshape(M(i,:), 28, 28)';
end
montage(montageImgs);
save('task1_2_M.mat','M');
