function M = task1_2(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
% Output:
%  M : (K+1)-by-D mean vector matrix (double)
%      Note that M(K+1,:) is the mean vector of X.

%create a zero 10-by-784 matrix to represent first 1- samples of the class
CM = zeros(28,28,10);
counter = 1;
label =0;
[rw, cl] = size(Y);



for k = 1:rw %for each training sample
    for i = 1: label
    if (Y(k)==label) %check training label matches label [1...10]
        Img =( reshape(X(k,:)*255.0, 28, 28)' ); % reshape X
        CM(:,:, label) = Img; % add to 3D matrix   
        %counter = counter + 1; 
        disp(k);
    end
    end
end

	%present the number of class before moving onto the next one
for k = 1 : label +1
    for i = 1:rw
        for j = 1:cl
            means = MyMean(CM(i,j,label+1));

            MyMontage = montage(means); %creates montage
        %print(MyMontage(label), '-bestfit', 'path/to/output.pdf', '-dpdf');
        %MyMontage1 = getframe(MyMontage) %// Get content of current axes. I did it with sample images.
        %imwrite(MyMontage.cdata,'C:\Users\Jenny\Documents\hi.jpg', 'JPG');

            disp(counter);
        %counter = 1; % reset counter, to count dimensions
            label = label + 1; %increment label
            %k = 1; % reset k, to go through all training samples
            if (label > 10) 
                break
            end
        end
    end
    
end
end


