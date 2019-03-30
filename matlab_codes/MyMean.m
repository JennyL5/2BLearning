function [means] = MyMean(X)
% Input:
%   X: M-by-D data matrix
% Output:
%   means: D-by-1 column vector of sample mean values, where means(i) = mean(matrix(:,i))

%to avoid dividing by 0
    if (size(X,1) == 0) 
        s = 1;
    else 
        s = size(X,1);
    end
    
    % Caclulate means
    means = (sum(X, 1)./ s )';


end