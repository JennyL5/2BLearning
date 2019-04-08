
function task2_1(Xtrain, Ytrain, Xtest, Ytest, Ks)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain

num = size(Xtest,1);
K=10;

for k=1:size(Ks, 2)
    %Measure the time taken, and display it.
    tic
    Ypreds = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks(k));
    time = toc;
    
    fprintf('\nTime taken for k = %d at %.2fs.\n',Ks(k),time);
    
    %Get confusion matrix and accuracy for each k in Ks
    [cm, acc] = comp_confmat(Ytest, Ypreds(:,1),K);

    %Save each confusion matrix
    %save(sprintf('task2_1_cm%d.mat',Ks(k)));

    %Sum of wrongly classified samples
    Nerrs = num-sum(diag(cm));
    %fprintf('\nNumber of wrongly classified test samples: %d\n', wrong);
    
    %display
     fprintf('Number of K-nearest neighbours: %d. Number of test samples: %d. Number of wrongly classified test samples: %d, Accuracy: %.4fs.% \n',Ks(k),num, Nerrs, acc*100);                   
     
end
