dset_dir = 'C:\Users\Jenny\Documents\INF2B-CW2\Original\d\s1705544';
[Xtrn, Ytrn, Xtst, Ytst] = load_my_data_set(dset_dir);
Xtrn = double(Xtrn)/255.0;
Xtst = double(Xtst)/255.0;
%disp_one(Xtrn, Ytrn);

%task1_1(Xtrn,Ytrn);
%task1_2(Xtrn,Ytrn);

% [Evecs, Evals] = comp_pca(Xtrn);
% [vectors, values,variance,mins]=task1_3(Xtrn);
% task1_4(vectors);
% 
% Ks = [1,2,3,4,5,7,10,15,20]; 
% task1_5(Xtrn, Ks); 
% for i=1:size(Ks, 2)
%      figure
%      task1_6(sprintf('task1_5_c_%d.mat',Ks(i)));
% end

% k = [1,2,3,5,10]; 
% Dmap = task1_7('task1_5_c_1.mat', 'task1_2_M.mat', 'task1_3_evecs.mat','task1_3_evals.mat', mean(Xtrn), 200);
% save('task1_7_dmap_1.mat','Dmap');
% Dmap = task1_7('task1_5_c_2.mat', 'task1_2_M.mat', 'task1_3_evecs.mat','task1_3_evals.mat', mean(Xtrn), 200);
% save('task1_7_dmap_2.mat','Dmap');
% Dmap = task1_7('task1_5_c_3.mat', 'task1_2_M.mat', 'task1_3_evecs.mat','task1_3_evals.mat', mean(Xtrn), 200);
% save('task1_7_dmap_3.mat','Dmap');
% Dmap = task1_7('task1_5_c_5.mat', 'task1_2_M.mat', 'task1_3_evecs.mat','task1_3_evals.mat', mean(Xtrn), 200);
% save('task1_7_dmap_5.mat','Dmap');
% Dmap = task1_7('task1_5_c_10.mat', 'task1_2_M.mat', 'task1_3_evecs.mat','task1_3_evals.mat', mean(Xtrn), 200);
% save('task1_7_dmap_10.mat','Dmap');
  
%  Ks = [1,3,5,10,20]; 
%  task2_1(Xtrn, Ytrn, Xtst, Ytst, Ks);