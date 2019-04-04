
function task1_5(X, Ks)
% Input:
%  X  : M-by-D data matrix (double)
%  Ks : 1-by-L vector (integer) of the numbers of nearest neighbours

for i=1:size(Ks,2)
   k = Ks(i);
   t = tic;
  [C,idx,SSE] =  my_kMeansClustering(X,k,X(1:k,:));
  times=toc(t);
  save(sprintf('task1_5_c_%d.mat',k),'C');
  save(sprintf('task1_5_idx_%d.mat',k),'idx');
  save(sprintf('task1_5_sse_%d.mat',k),'SSE');
   %fprintf('\nTime taken by my_knnmeans_Clustering(): %.3f seconds for k=%d.\n', times, k);

   fprintf('k: %d at %d\n', k, times);
   
%    figure
%     plot(SSE,[1:C]);
%     hold on;
%     xlabel("Number of Iterations")
%     ylabel("SSE")
%     title("SSE vs Number of Iterations of each k")

end

%Load Data
% s1 =(load("task1_5_SSE_1.mat", 'SSE'));  
% k1 =(load("task1_5_idx_1.mat", 'idx'));     

%plotting SSE
%plot each SSE(2,3,4,5,7,10,15,20) with k(2,3,4,5,7,10,15,20)

end
