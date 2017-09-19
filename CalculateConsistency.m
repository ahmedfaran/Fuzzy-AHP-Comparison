function [CR] = CalculateConsistency(InconsistentMatrix)

BM = cell2mat(InconsistentMatrix);

n  = length(BM);
[~, D]   = eig(BM);
[maxLambdaValue, ~] = max(diag(D));

if n == 3 
    RI = 0.58;
elseif n == 4 
    RI = 0.90;
elseif n == 5 
    RI = 1.12;
elseif n == 6 
    RI = 1.24;
elseif n == 7 
    RI = 1.32;
elseif n == 8 
    RI = 1.41;
elseif n == 9 
    RI = 1.45;
elseif n == 10 
    RI = 1.49;
elseif n == 11 
    RI = 1.51;
elseif n == 12 
    RI = 1.48;
elseif n == 13 
    RI = 1.56;
elseif n == 14 
    RI = 1.57;
elseif n == 15 
    RI = 1.59;
end


CI = (maxLambdaValue - n)/(n-1);

CR = CI/RI;

end