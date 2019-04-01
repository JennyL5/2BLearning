dset_dir = 'C:\Users\Jenny\Documents\INF2B-CW2\Original\d\s1705544';
[Xtrn, Ytrn, Xtst, Ytst] = load_my_data_set(dset_dir);
Xtrn = double(Xtrn)/255.0;
Xtst = double(Xtst)/255.0;
%disp_one(Xtrn, Ytrn);

%task1_1(Xtrn,Ytrn);
%task1_2(Xtrn,Ytrn);
[Evecs, Evals] = comp_pca(Xtrn);
[vectors, values,variance,mins]=task1_3(Xtrn);
%disp(mins);
%task1_4(vectors);

%Ks = [1,2,3,4,5,7,10,15,20]; 
%task1_5(Xtrn, Ks); 

%Dmap = task1_7('task1 5 c k.mat', 'task1 2 M.mat', 'task1 3 evecs.mat',
%'task1 3 evals.mat', mean(Xtrn), 200);

%Ks = [1,3,5,10,20]; 
%task2_1(Xtrn, Ytrn, Xtst, Ytst, Ks);