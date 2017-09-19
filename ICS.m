function [FuzzyWeights] = ICS(n, FuzzyMatrix)

mExtendAnalysis = cell(1,n);
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

FuzzyWeights{1,i} = EWeights;

end

end