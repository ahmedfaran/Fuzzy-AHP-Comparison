function [FuzzyMatrix] = FuzzifyMatrix(n, alpha, InconsistentMatrix)

FuzzyMatrix = cell(n,n);

for i = 1:n
    for j = 1:n
        
       if InconsistentMatrix{i,j} < alpha
       x = 1/((1/InconsistentMatrix{i,j})+ alpha);
       y = 1/(1/InconsistentMatrix{i,j});
       l = 1/((1/InconsistentMatrix{i,j})- alpha);
       else
       x = InconsistentMatrix{i,j} - alpha;
       y = InconsistentMatrix{i,j};
       l = InconsistentMatrix{i,j} +  alpha;
       end
                        
       FuzzyWeights = [x y l];
       FuzzyMatrix{i,j} = FuzzyWeights;

     end
end

for i = 2:n
    for j = 1:i-1
               
    LowerTriangle = FuzzyMatrix{j,i};    
    a = 1/LowerTriangle(3);
    b = 1/LowerTriangle(2);
    c = 1/LowerTriangle(1);
                    
    FuzzyWeights = [a b c];
    FuzzyMatrix{i,j} = FuzzyWeights;
               
    end
end
           
for i = 1:n
    FuzzyMatrix{i,i} = [1 1 1];
end

end