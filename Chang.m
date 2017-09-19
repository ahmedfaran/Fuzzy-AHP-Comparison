function [CrispWeights] = Chang(n, FuzzyMatrix)
             
mExtendAnalysis = cell(1,n);
CrispWeights = zeros(1,n);

for i = 1:n
    vec = [FuzzyMatrix{i,:}];
    mExtendAnalysis{1,i} = sum(reshape(vec,3,[])');
end

vec = [mExtendAnalysis{1,:}];
mExtendAnalysisSum = sum(reshape(vec,3,[])');

for i = 1:n
    vec = [mExtendAnalysis{1,i}];
    vec = fliplr(vec);
    for j = 1:3
    val = mExtendAnalysisSum(1,j);
    valSum(1,j) = (vec(1,j))*(1/val);
    end
    mExtendAnalysis{1,i} = fliplr(valSum);
end

%%
% degree of possibility calculation
%              /---
%              | 1    if m2>=m1
%              |
%              | 0    if l1>=l2
% V(M2>=M1) = <
%              |     l1-u2
%              | --------------- otherwise
%              | (m1-u2)-(m1-l1)
%              \---

degreeOfPossibility = zeros(n*(n-1),3);
rowIndex = 1;

for i = 1:n
    for j = 1:n
        if i~=j

        degreeOfPossibility(rowIndex,[1 2]) = [i j];
        M1 = mExtendAnalysis{1,i};
        M2 = mExtendAnalysis{1,j};

        if M1(1,2) >= M2(1,2)
        degreeOfPossibility(rowIndex,3) = 1;
        elseif M2(1,1) >= M1(1,3)
        degreeOfPossibility(rowIndex,3) = 0;
        else
        degreeOfPossibility(rowIndex,3) = (M2(1,1)-M1(1,3))/((M1(1,2)-M1(1,3))-(M2(1,2)-M2(1,1)));
        end
        rowIndex = rowIndex + 1;
        end
     end
end

%% normalized weight calculation

for i = 1:n,

CrispWeights(1,i) = min(degreeOfPossibility([find(degreeOfPossibility(:,1) == i)], [3]));

end

end