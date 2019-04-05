
function task1_5(X, Ks)
% Input:
%  X  : M-by-D data matrix (double)
%  Ks : 1-by-L vector (integer) of the numbers of nearest neighbours

for i=1:size(Ks,2)
  k = Ks(i);
  t = tic; 
  [C,idx,SSE] =  my_kMeansClustering(X,k,X(1:k,:)); 
  times = toc(t);
  fprintf('k: %d at %d\n', k, times);
  
  save(sprintf('task1_5_c_%d.mat',k),'C');
  save(sprintf('task1_5_idx_%d.mat',k),'idx');
  save(sprintf('task1_5_sse_%d.mat',k),'SSE');
  
  %Plot Graph
  figure;
  plot (SSE);
  hold on;
  title(['SSE for k = ' Ks(i)]);
  xlabel("Number of Iterations")
  ylabel("SSE")

end

end
