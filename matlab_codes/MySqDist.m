function DM = MySqDist(X1, X2, D1, D2 )
%Input: X1 is the Xtrn, X2 is the Xtst, D1 is the dimension of Xtrn, and D2
%is the dimension of Xtst
%DM = MySqDist(X, initialCentres(X,C, num, k));

%Using Vectorisation
X1Sqr = zeros(D1,1);
X2Sqr = zeros(D2,1);
for i=1:D1
    X1Sqr(i,:) = X1(i,:)*X1(i,:)';
end

for i=1:D2
    X2Sqr(i,:) = X2(i,:)*X2(i,:)';
end

DM = repmat(X1Sqr,1,D2) - 2*X1*X2' + repmat(X2Sqr,1,D1)';

end
