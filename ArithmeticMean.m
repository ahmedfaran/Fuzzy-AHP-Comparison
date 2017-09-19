function [FuzzyWeights] = ArithmeticMean(n, FuzzyMatrix)

mExtendAnalysis = cell(1,n);
ColumnSum       = cell(1,n);
VectorMatrix    = cell(n,n);
FuzzyWeights    = cell(1,n);

for i = 1:n
    vec = [FuzzyMatrix{:,i}];
    mExtendAnalysis{1,i} = sum(reshape(vec,3,[])');
end

for i = 1:n
    preWeights = mExtendAnalysis{1,i};
    EWeights(1) = 1/preWeights(3);
    EWeights(2) = 1/preWeights(2);
    EWeights(3) = 1/preWeights(1);

    ColumnSum{1,i} = EWeights;

end

for i = 1:n
    for j = 1:n

    VectorMatrix{j,i} = FuzzyMatrix{j,i}.*ColumnSum{1,i};

    end
end

for i = 1:n
    vec = [VectorMatrix{i,:}];
    FuzzyWeights{1,i} = mean(reshape(vec,3,[])');
end

end
