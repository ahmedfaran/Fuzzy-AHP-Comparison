function [ExcelData] = PrepareDataForExcel(InitialWeights, NormalizedCrispWeights, CR, FuzzyInconsistencyIndex)

ExcelData = zeros();

n = 3;   
k = 1;
EC = 1;
 
while n <=15
for iterations = 1:40
        beta = 0.00;
        while beta <= 1.00;
                alpha = 0.25;
                while alpha <= 1.00;
                    
                    if CR{EC} <= 0.1
                    DataIW = InitialWeights{EC};
                    DataFW = NormalizedCrispWeights{EC};
                    ConsRat = CR{EC}; 
                    FIIndex = FuzzyInconsistencyIndex{EC}; 
                    
                    ExcelData(k,1) = n;
                    ExcelData(k,2) = alpha;
                    ExcelData(k,3) = beta;
                    ExcelData(k,4) = ConsRat;
                    
                    if ConsRat >= 0 && ConsRat <= 0.03
                    ExcelData(k,5) = 1;
                    end
                    if ConsRat > 0.03 && ConsRat <= 0.06
                    ExcelData(k,5) = 2;
                    end
                    if ConsRat > 0.06 && ConsRat <= 0.1
                    ExcelData(k,5) = 3;
                    end
                    
                    for j = 1:n
                    ExcelData(k,6) = DataIW(j); 
                    ExcelData(k,7) = DataFW(j);
                    ExcelData(k,8) = abs(DataIW(j)-DataFW(j));
                    
                    k = k + 1;
                    end
                    ExcelData(k-n,9) = mean(ExcelData(k-n:k-1,8));
                    end
                    
                    ExcelData(k,10) = FIIndex;
                    if FIIndex >= 0 && FIIndex <= 0.03
                    ExcelData(k,11) = 1;
                    end
                    if FIIndex > 0.03 && FIIndex <= 0.06
                    ExcelData(k,11) = 2;
                    end
                    if FIIndex > 0.06 && FIIndex <= 0.1
                    ExcelData(k,11) = 3;
                    end
                    if FIIndex > 0.1
                    ExcelData(k,11) = 4;
                    end
                    
                    alpha = alpha + 0.25;
                    EC = EC + 1;
                end
                
                beta = beta + 0.20;
        end
end

k = k + 1;
n = n + 4;

end

end