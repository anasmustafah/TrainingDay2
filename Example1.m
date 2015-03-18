%% Interactive prototyping
load s02_MedData

%% Basic data exploration
figure
x = MedData.Age;
y = MedData.BPDiff; %Pulse pressure
scatter(x, y, 'kx')
xlabel('Age(year)')
ylabel('Pulse pressure (mmHg)')
title('Pulse pressure vs age')

%% Task: aim to fit model to this data set
%Preprocess to deal with missing value
missingVals = isnan(x) | isnan(y);
xClean = x(~missingVals);
yClean = y(~missingVals);
%Formulate the model and write it in MATLAB code
%We can write this as pulse pressure = [1, Age, Age^2]*{c0 ; c1; c2]
b = yClean;
A = [ones(size(xClean)), xClean, xClean.^2]; %alternatively than ones, xClean^0
modelCoeffs = A\b; %solve the system
pulseModel = A * modelCoeffs;
%Plot
hold on
plot(xClean, pulseModel, 'r*')
legend('Raw Data','Fitted Model')