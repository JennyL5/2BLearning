function task1_1(X, Y)

CM = zeros(28,28,10);
counter = 1;
label =0;
[rw, cl] = size(Y);

for k = 1:rw %for each training sample
    if (Y(k)==label) %check training label matches label [1...10]
        Img =( reshape(X(k,:)*255.0, 28, 28)' ); % reshape X
        CM(:,:, counter) = Img; % add to 3D matrix   
        counter = counter + 1;
    end
	%present the 10 first samples of a class before moving onto the next one
    if (counter > 10)
        figure;
        MyMontage = montage(CM); %creates montage
        disp(label);
        counter = 1; % reset counter, to count dimensions
        label = label + 1; 
        k = 1; % reset k, to go through all training samples
        if (label > 10) 
            break
        end
    end
end

end