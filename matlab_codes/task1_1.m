% task1_1(Xtrn, Ytrn)
function task1_1(X, Y)

%create a zero 10-by-784 matrix to represent first 1- samples of the class
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
        MyMontage = montage(CM); %creates montage
        %print(MyMontage(label), '-bestfit', 'path/to/output.pdf', '-dpdf');
        %MyMontage1 = getframe(MyMontage) %// Get content of current axes. I did it with sample images.
        %imwrite(MyMontage.cdata,'C:\Users\Jenny\Documents\hi.jpg', 'JPG');

        disp(label);
        counter = 1; % reset counter, to count dimensions
        label = label + 1; %increment label
        k = 1; % reset k, to go through all training samples
        if (label > 10) 
            break
        end
    end
end

end