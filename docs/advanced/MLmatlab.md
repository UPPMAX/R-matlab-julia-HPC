# ML with MATLAB 

Here is an example for running a ML script in Matlab using a Neural Network model. The 
dataset is present in the ``exercises/matlab/wine.csv`` file. To display the graphics
for the performance of the training process an interactive session for instance with
Open onDemand is recommended.

```matlab
% Data for Wines can be obtained from: https://archive.ics.uci.edu/dataset/109/wine

% Read the csv file
data = readtable("wine.csv",'PreserveVariableNames',true);
% Features to be considered as input data
X = [data.Alcohol, data.MalicAcid, data.Ash, data.Acl, data.Mg, data.Phenols, ...
     data.NonflavanoidPhenols, data.Proanth, data.ColorInt, data.Hue, data.OD, data.Proline];
% Feature to be predicted
Y = data.Flavanoids;

% Split data: 80% for training, 10% for validation, 10% for testing
idx = randperm(height(data));
trainIdx = idx(1:round(0.8*end));
valIdx = idx(round(0.8*end)+1:round(0.9*end));
testIdx = idx(round(0.9*end)+1:end);

XTrain = X(trainIdx,:);
YTrain = Y(trainIdx);
XValidation = X(valIdx,:);
YValidation = Y(valIdx);
XTest = X(testIdx,:);
YTest = Y(testIdx);

% Define a GPU-capable regression network
layers = [
    featureInputLayer(12)             % 12 features
    fullyConnectedLayer(20)           % 3 hidden layers with 30 nodes each
    reluLayer
    fullyConnectedLayer(20)
    reluLayer
    fullyConnectedLayer(20)
    reluLayer
    fullyConnectedLayer(1)            % Final layer is for regression
    regressionLayer
];

% Options for training and displaying the progress of the training process
options = trainingOptions('adam', ...
    'ValidationData',{XValidation,YValidation}, ...
    'MaxEpochs',600, ...
    'MiniBatchSize',32, ...
    'Plots','training-progress', ...
    'ExecutionEnvironment','gpu');   %Use GPU automatically

net = trainNetwork(XTrain, YTrain, layers, options);

% Predicting values based on the trained model
YPred = predict(net, XTest);

% Plot the predicted values vs. the true values
figure
plot(YTest, YPred, 'bo')
hold on
plot([min(YTest), max(YTest)], [min(YTest), max(YTest)], 'r--') % perfect line
xlabel('True Value')
ylabel('Predicted Value')
title('Predicted vs. True Values')
grid on

% Obtain the mean square error between predicted and true values
mseTest = mean((YTest - YPred).^2)

% If you want to perform a Classification analysis, an example for the Wine
% data set can be found here: 
% https://se.mathworks.com/help/deeplearning/ug/wine-classification.html
```

One can monitor the training process in Matlab:

![Matlab performance](../img/matla-ml-perf.png)


!!! note "Links to MATLAB courses"
 
    - <a href="https://matlabacademy.mathworks.com/details/machine-learning-techniques-in-matlab/lpmlmlt" target="_blank">https://matlabacademy.mathworks.com/details/machine-learning-techniques-in-matlab/lpmlmlt</a>
    - <a href="https://matlabacademy.mathworks.com/en/details/machine-learning-with-matlab/mlml" target="_blank">https://matlabacademy.mathworks.com/en/details/machine-learning-with-matlab/mlml</a>

