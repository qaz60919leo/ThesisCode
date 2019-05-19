clear;
data = csvread('DDSM_Features.csv');
trainData = data;
trainDataSize = size(data,1);
testData = [];
count = 1;

for num = trainDataSize:-1:1
    point = rand(1);
    if point > 0.8
        num
        testData(count,:) = trainData(num,:);
        trainData(num,:) = [];
        count = count + 1;
    end
end

trainData(:,1) = [];
testData(:,1) = [];
csvwrite('ELM_train.csv',trainData);
csvwrite('ELM_test.csv',testData);