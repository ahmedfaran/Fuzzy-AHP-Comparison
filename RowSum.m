function [FuzzyWeights] = RowSum(n, FuzzyMatrix)

mExtendAnalysis = cell(1,n);
FuzzyWeights    = cell(1,n);

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
    FuzzyWeights{1,i} = valSum;
end

end