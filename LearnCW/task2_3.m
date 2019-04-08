
function task2_3(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector for X (unit8)

%Compute PCA
[EVecs, EVals] = comp_pca(X);
projectedPoints = (EVecs(:,1:2)' * X')';
numPoints = size(projectedPoints,1);

% Parameter Estimation for Gaussian
% Draw the contour of Gaussian classification for each class
for i=1:10
    classElems = projectedPoints((Y==i-1),:);
    if(size(classElems,1)>2)
        %Each gaussian is a mean vector and a covariance matrix
        mu = MyMean(classElems);  %centre defined by the mean vector
        CovM = MyCov(classElems);
        %Plots the 2D Gaussian
        % Determine the elipse contour based on mean and covariance
        ls=linspace(0,2*pi,50)';
        x = cos(ls); 
        y=sin(ls); 
        ap = [x(:) y(:)]';
        [v,a]=eig(CovM); 
        a = sqrt(a); 
        dp = (v*a*ap) + repmat(mu, 1, size(ap,2)); 
        plot(dp(1,:), dp(2,:), '-', 'parent', gca);
        hold on
        xlabel('1st Principal Component');
        ylabel('2nd Principal Component');  
        title('Class-wise Gaussian distributions');
        lgd = legend('Location','southwest');
        lgd.FontSize = 8;
    end
   
end

end
