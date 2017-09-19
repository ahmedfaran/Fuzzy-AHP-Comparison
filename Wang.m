function [CrispWeights] = Wang(n, FuzzyMatrix)

mExtendAnalysis = cell(1,n);
CrispWeights = zeros(1,n);

for i = 1:n
    vec = [FuzzyMatrix{i,:}];
    mExtendAnalysis{1,i} = sum(reshape(vec,3,[])');
end

EAMatrix = zeros(n,3);

for i = 1:n
     RowPick = [mExtendAnalysis{1,i}];
     for j = 1:3
     EAMatrix(i,j) = RowPick(j);
     end
end

ColumnSum = sum(EAMatrix,1);

for i = 1:n

    for j = 1:3

        if j == 1 
        Denominator(j) = EAMatrix(i,j) + ColumnSum(3) - EAMatrix(i,3);
        valSum(j) = EAMatrix(i,j)*1/Denominator(j);

        elseif j == 2
        Denominator(j) = ColumnSum(2);
        valSum(j) = EAMatrix(i,j)*1/Denominator(j);

        elseif j == 3
        Denominator(j) = EAMatrix(i,j) + ColumnSum(1) - EAMatrix(i,1);
        valSum(j) = EAMatrix(i,j)*1/Denominator(j);
        end

    end
    mExtendAnalysis{1,i} = valSum;
end

%%
% degree of possibility calculation

degreeOfPossibility = zeros(m*(m-1),3);
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

% normalized weight calculation
for i=1:m,
CrispWeights(1,i) = min(degreeOfPossibility([find(degreeOfPossibility(:,1) == i)], [3]));
end
                        
end