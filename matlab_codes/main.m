 dset_dir = 'C:\Users\Jenny\Documents\INF2B-CW2\cwk2\d\s1705544';
  [Xtrn, Ytrn, Xtst, Ytst] = load_my_data_set(dset_dir);
  Xtrn = double(Xtrn)/255.0;
  Xtst = double(Xtst)/255.0;
  %disp_one(Xtrn, Ytrn);

A=toMatrix(Xtrn(1,:));
B=toMatrix(Xtrn(2,:));

J = mat2gray(A);
K = mat2gray(B);

mat=[3 7 4 9 9 7;
     7 5 5 3 8 8;
     7 5 5 0 8 4;
     5 6 8 5 9 8;
    5 8 8 8 10 9;
     7 7 8 4 7 8];
 

%task1_1(Xtrn,Ytrn);
task1_2(Xtrn,Ytrn);
%[Evecs, Evals] = comp_pca(Xtrn);
%disp(Evecs);
%[vectors, values,variance,mins]=task1_3(Xtrn);
%img=mat2gray(toMatrix(vectors(1,:)));
%imshow(img);
%task1_4(vectors)

%Ks = [1,2,3,4,5,7,10,15,20]; 
%task1_5(Xtrn, Ks); 

%Ks = [1,3,5,10,20]; 
%task2_1(Xtrn, Ytrn, Xtst, Ytst, Ks);