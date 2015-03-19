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
A = [ones(size(xClean)), xClean, xClean.^2]; %alter than ones,xClean^0
modelCoeffs = A\b; %solve the system
pulseModel = A * modelCoeffs;
%Plot
hold on
plot(xClean, pulseModel, 'r*')
legend('Raw Data','Fitted Model')

%% Move to 2D
height = MedData.Height; %x1
waist = MedData.Waist; %x2
weight = MedData.Weight; %y
%Problem: can we estimate weight (y) using height and waist (x1 and x2)?
%We'll use a quadratic model

% Step 1: Plot the raw data (SCATTER3)
figure
scatter3(height, waist, weight,'.k')
xlabel('Height (cm)')
ylabel('Waist (cm)')
zlabel('Weight (kg)')
title('Weight, waist and height relations')
% Step 2: Clean the data
unclean = isnan(height) | isnan(waist) | isnan(weight);
%alter way to do this is unclean = any(isnan([height, weight, waist]);
weightC = weight(~unclean);
heightC = height(~unclean);
waistC = waist(~unclean);
% Step 3: Solve the system
b2 = weightC;
A2 = [weightC.^0, heightC, heightC.^2, waistC, waistC.^2, waistC.*heightC];
modelCoeffs2 = A2\b2;

weightmodel = A2 * modelCoeffs2;

% Step 4: Plot fitted model
modelFun = @(c, x1, x2) c(1) +c(2)*x1 + c(3)*x1.^2 + c(4)*x2 + c(5)*x2.^2;
% substep 1: make vector data for x1 and x2
heightVec = linspace(min(heightC), max(heightC), 150);
waistVec = linspace(min(waistC), max(waistC), 150);
%substep 2: turn this into grid
[HEIGHT, WAIST] = meshgrid(heightVec, waistVec);
%substep 3: evaluate model on the grid
ModelOnGrid = modelFun( modelCoeffs2, HEIGHT, WAIST);

hold on
surf(HEIGHT, WAIST, ModelOnGrid)
plot3(heightC, waistC, weightmodel, 'r*')
legend('Raw Data','Fitted Model')

%% Test new function
x = MedData.Age;
y = MedData.BPDiff; %Pulse pressure
modelCoeffs1 = fitQuadModel(x,y)

height = MedData.Height; %x1
waist = MedData.Waist; %x2
weight = MedData.Weight; %y
modelCoeffs2 = fitQuadModel([height,waist],weight)

