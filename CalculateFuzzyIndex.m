function [FuzzyInconsistencyIndex] = CalculateFuzzyIndex(n, FuzzyWeights, FuzzyMatrix)

% clc
% clear all;
% n = 3;
% FuzzyMatrix = {[1.00	1.00	1.00]	[2.00	3.00	4.00]	[4.00	5.00	6.00]
%                [0.25	0.33	0.50]	[1.00	1.00	1.00]	[3.00	4.00	5.00]
%                [0.17	0.20	0.25]	[0.20	0.25	0.33]	[1.00	1.00	1.00]};
% 
% FuzzyWeights = {[0.458	0.627	0.627] [0.264	0.280	0.295] ...
%                                                     [0.094	 0.094	0.094]};

Wmatrix = cell(n,n);

for i = 1:n
    for j = 1:n
    wElements1 = FuzzyWeights{1,i};
    wElements2 = FuzzyWeights{1,j};
    a = wElements1(1); x = wElements2(1);
    b = wElements1(2); y = wElements2(2);
    c = wElements1(3); z = wElements2(3);
    
    l = a/z;
    m = b/y;
    u = c/x;
    
    Wmatrix{i,j} = [l m u];
    end
end

WminusAMatrix = zeros(n,n);

for i = 1:n
    for  j = 1:n
    FMelements = FuzzyMatrix{i,j};
    WMelements = Wmatrix{i,j};
    WminusAMatrix(i,j) = max(abs(FMelements-WMelements));
    end
end
maxOFmax = max(WminusAMatrix(:));

sigma    = max([FuzzyMatrix{:}]); 

if sigma <=9
    sigma = 9;
end

condition = (n/2)^(n/(n-2));
if sigma >= condition
    a = sigma - sigma^((2-2*n)/n);
    b = sigma^((2*n-2)/n) - sigma;
    gamma = (max(a , b))^(-1);
else
    a = sigma - sigma^((2-2*n)/n);
    b = (sigma^2)*((2/n)^(2/(n-2))-(2/n)^(n/(n-2)));
    gamma = (max(a , b))^(-1);
end

FuzzyInconsistencyIndex = gamma*maxOFmax;


end