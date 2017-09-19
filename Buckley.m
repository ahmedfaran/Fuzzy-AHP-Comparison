function [FuzzyWeights] = Buckley(n, FuzzyMatrix)

mExtendAnalysis = cell(1,n);
FuzzyWeights    = cell(1,n);

 for i = 1:n
     for j = 1:n
     Trap = zeros(1,4);
     Bucket  = FuzzyMatrix{i,j};
     Trap(1) = Bucket(1);
     Trap(2) = Bucket(2);
     Trap(3) = Bucket(2);
     Trap(4) = Bucket(3);
     FuzzyMatrix{i,j} = Trap;
     end                      
end

for i = 1:n
     FuzzyMatrix{i,i} = [1 1 1 1];
end
                            
for i = 1:n
    vec = [FuzzyMatrix{i,:}];
    mExtendAnalysis{1,i} = (prod(reshape(vec,4,[])')).^(1/n);
end

vec = [mExtendAnalysis{1,:}];
mExtendAnalysisSum = sum(reshape(vec,4,[])');

% Weights Calculation
w = zeros(1,4);
for i = 1:n
    for k = 1:4
        iValue  = mExtendAnalysis{1,i};
        if k == 1
        w(k)   = iValue(1)/mExtendAnalysisSum(4);
        elseif k == 2
        w(k)  = iValue(2)/mExtendAnalysisSum(3);
        elseif k == 3
        w(k)  = iValue(3)/mExtendAnalysisSum(2);
        elseif k == 4
        w(k)  = iValue(4)/mExtendAnalysisSum(1);
        end
     end

FuzzyWeights{1,i} = w;    

end

end