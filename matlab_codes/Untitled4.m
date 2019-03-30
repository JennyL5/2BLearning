%
% Template for my_knn_system.m
%
% load the data set
 dset_dir = 'C:\Users\Jenny\Documents\INF2B-CW2\cwk2\d\s1705544';
  [Xtrn, Ytrn, Xtst, Ytst] = load_my_data_set(dset_dir);
  Xtrn = double(Xtrn)/255.0;
  Xtst = double(Xtst)/255.0;


%YourCode - Prepare measuring time

% Run K-NN classification

tic
kb = [1,3,5,10,20];
Ypreds = run_knn_classifier(Xtrn, Ytrn, Xtst, kb');
toc

%YourCode - Measure the time taken, and display it.

%YourCode - Get confusion matrix and accuracy for each k in kb.
%YourCode - Save each confusion matrix.

for i=1:length(kb)
    idx = kb(i);
    [cm, acc] = comp_confmat(Ytst, Ypreds(:,i));
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
    
    
    NumNeighbours = sprintf('Number of K-nearest neighbours: %d, Number of test samples: %d, Number of wrongly classified test samples: %d, Accuracy: %d',idx,size(Xtst,1), sum, acc);
                          
    disp(NumNeighbours);
end

