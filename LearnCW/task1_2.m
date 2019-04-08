function M = task1_2(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
% Output:
%  M : (K+1)-by-D mean vector matrix (double)
%      Note that M(K+1,:) is the mean vector of X.

[~, d]=size(X);
M = zeros(11,d);
    
%Calculate the mean for each class and the whole data set
for c=0:9 
   M(c+1, :) = MyMean(X(Y==c, :));
end

M(11,:) = MyMean(X);

% Display the image of the means
imgs = zeros(28,28,11);
for i=1:11
    imgs(:,:,i)=reshape(M(i,:), 28, 28)';
end
montage(imgs);
% save('task1_2_M.mat','M');

end
