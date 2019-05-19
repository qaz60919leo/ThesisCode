function elmloop(hnod)

BestTest = 0;
CT = 0;
for i=1:100
    [trainTime,testTime,train,test]=ELM('ELM_train.csv', 'ELM_test.csv', 1, hnod, 'sin');
    CT = CT + trainTime;
    
    if test>BestTest
        BestTest = test;
        BestTrain = train;
        BestTrainTime = trainTime;
    end
end

CT
BestTrainTime
BestTrain
BestTest
end