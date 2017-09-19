clc 
clear all;
close all;

% Initialization Values
rng('default');
rng(1);
n = 3;
z = 1;
iter = 40;

% Preallocations
NumberOfMatrices         = 3840; % = iter * n * alpha * beta
InitialWeights           = cell(NumberOfMatrices,1);
NormalizedCrispWeights   = cell(NumberOfMatrices,1);
CR                       = cell(NumberOfMatrices,1);
FuzzyInconsistencyIndex  = cell(NumberOfMatrices,1);
% IndividualFuzzyMatrices  = cell(NumberOfMatrices,1);
% IndividualFuzzyWeights   = cell(NumberOfMatrices,1);
% MaximumOfFuzzyMatrix     = cell(NumberOfMatrices,1);

while n <= 15
    for iterations = 1:iter
        
    % Generate Perfectly Consistent Crisp Matrix
    [CompMatrix Weights] = GenerateConsistentMatrix(n);
    

        % Add Inconsistency in a Comparison Matrix 
        beta = 0.0;        
        while beta <= 1.0    
        InconsistentMatrix =  AddInconsistency(n, beta, CompMatrix);
             
          % Fuzzify Matrices 
          alpha = 0.25;
          while alpha <= 1.00

          FuzzyMatrix = FuzzifyMatrix(n, alpha, InconsistentMatrix);
                 
          % Generate Weights from Fuzzy Matrices using FAHP Algorithms
          % Arithmetic Mean
%             FuzzyWeights = ArithmeticMean(n, FuzzyMatrix);
          % Geometric Mean
%             FuzzyWeights = GeometricMean(n, FuzzyMatrix);
          % Chang Fuzzy Extent Analysis
%             CrispWeights = Chang(n, FuzzyMatrix);
          % Wang Modification of Chang Extent Analysis
%             CrispWeights = Wang(n, FuzzyMatrix);
          % LLSM Proposed by Laarhoven
%             FuzzyWeights = Laarhoven(n, FuzzyMatrix);
          % LLSM proposed by Boender
%             FuzzyWeights = Boender(n, FuzzyMatrix);
          % Geometric Mean proposed by Buckley
            FuzzyWeights = Buckley(n, FuzzyMatrix);  
          % Inverse of Column Sum
%             FuzzyWeights = ICS(n, FuzzyMatrix);
          % Row Sum Method
%             FuzzyWeights = RowSum(n, FuzzyMatrix);
          
          % Defuzzify Weights using Centroid Defuzzification
          CrispWeights = zeros(1,n);
          for i = 1:n
              x = 0:0.000005:1;
              mf = trimf(x,FuzzyWeights{1,i});
              CrispWeights(1,i) = defuzz(x,mf,'centroid');
          end                                   
          NormalizedCrispWeights{z,1}    = CrispWeights/sum(CrispWeights);
          
          CR{z,1}                       = CalculateConsistency(InconsistentMatrix);
          InitialWeights{z,1}           = Weights;
          FuzzyInconsistencyIndex{z,1}  = CalculateFuzzyIndex(n, FuzzyWeights, FuzzyMatrix);
          
%           IndividualFuzzyMatrices{z,1} = FuzzyMatrix;
%           IndividualFuzzyWeights{z,1}  = FuzzyWeights;
%           MaximumOfFuzzyMatrix{z,1} = max([FuzzyMatrix{:}]);
          
          z = z + 1;                        
          alpha = alpha + 0.25;
          end
        beta = beta + 0.2;
        end
    end
    n = n + 4;
end

%% Write Experiment Parameters and Weights in Excel File 
% ExcelData = PrepareDataForExcel(InitialWeights, NormalizedCrispWeights, CR, FuzzyInconsistencyIndex);
% FinalExcelData = CleanData(ExcelData);
% xlswrite('c:\ReviewedFinalAnalysis.xls',FinalExcelData,'Laarhoven');
