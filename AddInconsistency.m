function [InconsistentMatrix] = AddInconsistency(n, beta, CompMatrix)

InconsistentMatrix = cell(n,n);

for i = 1:n
    for j = 1:n
    elements = CompMatrix{i,j};
                                     
    a = elements - beta*elements;
    b = elements + beta*elements;
               
    RandomNumber = a + (b-a).*rand;
                          
    InconsistentMatrix{i,j} = RandomNumber;
    end 
end
           
for i = 2:n
    for j = 1:i-1               
    elements2 = InconsistentMatrix{j,i};
    xyz = 1/elements2;
    InconsistentMatrix{i,j} = xyz;
    end
end
            
for i = 1:n      
    InconsistentMatrix{i,i} = 1; 
end
           
end