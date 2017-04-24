function [ avgCorr, Correlation ] = EvaluateAccuracy( theta, mu, sigma, index )
% doesn't use glmnet
% theta - the weights of features
% index - the index of TestQuery

addpath('/Users/Steven/Documents/GitHub/User-Study-Data/UserStudy');

Correlation = zeros(1,size(index,2));
for i = 1:size(index,2)
    TestSet = csvread(['/Users/Steven/Documents/GitHub/Frequent-Patterns-in-Time-Series/matlab/src/adjustableWeights/datasetForLinearRegression/TestQuery',num2str(index(i)),'.csv']);
    TruthSimilarity = TestSet(:,end);
    features = TestSet(:,1:(end-1));
    %normalizedFeatures = (features - ones(size(features)) * mu) / sigma;
    normalizedFeatures = features;
    for ii = 1:size(features,1)
        for jj = 1:size(features,2)
            normalizedFeatures(ii,jj) = (features(ii,jj) - mu) / sigma;
        end
    end
    normalizedInput = [ones(size(normalizedFeatures,1),1),normalizedFeatures];
    CalculatedSimilarity = normalizedInput * theta;
    
    Correlation(i) = spearman(TruthSimilarity, CalculatedSimilarity);
end

avgCorr = mean(Correlation);

end
