function [FuzzyWeights] = Laarhoven(n, FuzzyMatrix)
FuzzyWeights    = cell(1,n);

r = 1;

for i = 1:n
    AA{i}          = [FuzzyMatrix{i,:}];
    AA{i}(r:1:r+2) = [];
    r              = r + 3;
end

[~, k] = size(AA{i});

k = k/3;

for j = 1:n
    p = 1;
    for i = 1:k
    bl(i,j) = log(AA{j}(p));
    p = p + 3;
    end
end

Sl = sum(bl);

for j = 1:n
p = 2;
    for i = 1:k
    bm(i,j) = log(AA{j}(p));
    p = p + 3;
    end
end

Sm = sum(bm);

for j = 1:n
p = 3;
    for i = 1:k
    bu(i,j) = log(AA{j}(p));
    p = p + 3;
    end
end

Su = sum(bu);

bColumn = [Sl Sm Su]';

A1 = zeros(n, n); 
A2 = zeros(n, n); 
A3 = zeros(n, n);

for i = 1:n
    for j = 1:n
        if i == j
            A1(i,j) = n-1;
        end
    end
end

for i = 1:n
    for j = 1:n
        if i ~= j
            A3(i,j) = -1;
        end
    end
end

A = [A1 A2 A3];

B1 = zeros(n, n); 
B2 = zeros(n, n); 
B3 = zeros(n, n);

for i = 1:n
    for j = 1:n
        if i == j
        B2(i,j) = n-1;
        elseif i~=j
        B2(i,j) = -1;
        end
    end
end

B = [B1 B2 B3];

C1 = zeros(n, n); C2 = zeros(n, n); C3 = zeros(n, n);

for i = 1:n
    for j = 1:n
        if i == j
            C3(i,j) = n-1;
        end
    end
end

for i = 1:n
    for j = 1:n
        if i ~= j
            C1(i,j) = -1;
        end
    end
end

C = [C1 C2 C3];

aMatrix = [A;B;C];

[X] = lsqnonneg(aMatrix,bColumn);
Y = exp(X);
expMatrix = reshape(Y,[],3);

ColumnSum = sum(expMatrix, 1);
normWeights = zeros;

for i = 1:n
    for j = 1:3

        if j == 1
        normWeights(1) = expMatrix(i,j)/ ColumnSum(3);
        elseif j == 2
        normWeights(2) = expMatrix(i,j)/ ColumnSum(2); 
        elseif j == 3
        normWeights(3) = expMatrix(i,j)/ ColumnSum(1);     
        end

    end

FuzzyWeights{1,i} = sort(normWeights);

end

end