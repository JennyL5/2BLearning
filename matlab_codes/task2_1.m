%
%
function task2_1(Xtrain, Ytrain, Xtest, Ytest, Ks)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain

%Runs a classi?cation experiment on the data set using run knn classifier.
tic
[Ypreds] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks);
toc
 %Measures the user time taken for the classi?cation experiment, and display the 
 %time (in seconds) to the standard output (i.e. display). 
 
 
 for i=1:length(Ks)
    idx = Ks(i);
    [cm, acc] = comp_confmat(Ytest, Ypreds(:,i));
    save(sprintf('cm%d',idx), 'cm');
    
    %Sum of wrongly classified samples
    sum = 0;
    
    %Number of wrongly classified samples
    for j=1:26
        for k=1:26
            if j~=k 
                sum = sum + cm(j,k);
            end
        end
    end
    
    
    %NumNeighbours = sprintf('Number of K-nearest neighbours: %d, Number of test samples: %d, Number of wrongly classified test samples: %d, Accuracy: %d',idx,size(Xtst,1), sum, acc);
                          
    %disp(NumNeighbours);
 
 k= idx;
 N=size(Xtest, 1);
  disp(k); % The number of nearest neighbours idx
  disp(N); % The number of test samples size(Xtst,1),
  disp(Nerrs) % The number of wrongly classi?ed test samples  sum
  disp(acc) %Accuracy (i.e. correct classi?cation rate) acc


end
