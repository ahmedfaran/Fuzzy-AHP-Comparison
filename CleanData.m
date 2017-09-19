function [FinalExcelData] = CleanData(ExcelData)

% M(:,1)==b return true for all rows with first element equal to b
condition = ExcelData(:,5) == 0;

% Remove rows
ExcelData(condition,:)=[];

condition = ExcelData(:,1) == 3 & ExcelData(:,5) == 1 ;
A_3_1 = ExcelData(condition,:);
A_3_1 = A_3_1(1:52,:);

condition = ExcelData(:,1) == 3 & ExcelData(:,5) == 2 ;
A_3_2 = ExcelData(condition,:);
A_3_2 = A_3_2(1:52,:);

condition = ExcelData(:,1) == 3 & ExcelData(:,5) == 3 ;
A_3_3 = ExcelData(condition,:);
A_3_3 = A_3_3(1:52,:);

condition = ExcelData(:,1) == 7 & ExcelData(:,5) == 1 ;
A_7_1 = ExcelData(condition,:);
A_7_1 = A_7_1(1:52,:);

condition = ExcelData(:,1) == 7 & ExcelData(:,5) == 2 ;
A_7_2 = ExcelData(condition,:);
A_7_2 = A_7_2(1:52,:);

condition = ExcelData(:,1) == 7 & ExcelData(:,5) == 3 ;
A_7_3 = ExcelData(condition,:);
A_7_3 = A_7_3(1:52,:);

condition = ExcelData(:,1) == 11 & ExcelData(:,5) == 1 ;
A_11_1 = ExcelData(condition,:);
A_11_1 = A_11_1(1:52,:);

condition = ExcelData(:,1) == 11 & ExcelData(:,5) == 2 ;
A_11_2 = ExcelData(condition,:);
A_11_2 = A_11_2(1:52,:);

condition = ExcelData(:,1) == 11 & ExcelData(:,5) == 3 ;
A_11_3 = ExcelData(condition,:);
A_11_3 = A_11_3(1:52,:);

condition = ExcelData(:,1) == 15 & ExcelData(:,5) == 1 ;
A_15_1 = ExcelData(condition,:);
A_15_1 = A_15_1(1:52,:);

condition = ExcelData(:,1) == 15 & ExcelData(:,5) == 2 ;
A_15_2 = ExcelData(condition,:);
A_15_2 = A_15_2(1:52,:);

condition = ExcelData(:,1) == 15 & ExcelData(:,5) == 3 ;
A_15_3 = ExcelData(condition,:);
A_15_3 = A_15_3(1:52,:);

FinalExcelData = vertcat(A_3_1,  A_3_2,  A_3_3, ...
                      A_7_1,  A_7_2,  A_7_3, ...
                      A_11_1, A_11_2, A_11_3,...
                      A_15_1, A_15_2, A_15_3);
                  
end