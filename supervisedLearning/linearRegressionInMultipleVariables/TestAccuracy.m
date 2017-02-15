function [ avgCorr, Correlation ] = TestAccuracy( theta, index )
% theta - the weights of features
% index - the index of TestQuery

addpath('/Users/Steven/Documents/GitHub/User-Study-Data/UserStud');

Correlation = zeros(1,size(index,2));
for i = 1:size(index,2)
    TestSet = csvread(['/Users/Steven/Documents/GitHub/Frequent-Patterns-in-Time-Series/matlab/src/adjustableWeights/datasetForLinearRegression/TestQuery',num2str(index(i)),'.csv']);
    TruthSimilarity = TestSet(:,end);
    features = TestSet(:,1:(end-1));
    CalculatedSimilarity = features * theta;
    
    Correlation(i) = spearman(TruthSimilarity, CalculatedSimilarity);
end

avgCorr = mean(Correlation);

end
