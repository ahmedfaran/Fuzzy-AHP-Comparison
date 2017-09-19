function [CompMatrix Weights] = GenerateConsistentMatrix(n)

CompMatrix = cell(n,n);
a = 5;
b = 1;
Weights = a + (b-a).*rand(n,1);
S = sum(Weights);
Weights = Weights/S;

for i = 1:n
    for j = 1:n
    CompMatrix{i,j} = Weights(i)./Weights(j);       
    end
end

end