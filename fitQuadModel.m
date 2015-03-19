function [modelCoeffs] = fitQuadModel(X, y)
%FITQUADMODEL Generic quadratic function fitting.
%Fitting input value(s) X to fit to y by quadratic fitting.
%X can be a matrix for 2 or more input types.
% See also Example1.m, surf, meshgrid, linspace, scatter, scatter3.

validateattributes(X,{'double'},{'2d','real','nonempty'})
if size(X,2) >= 3
    error(fitQuadModel:TooManyCols','X must have 1 or 2 columns.')
end %if sizeX
if any(~isinf(X(:)))
    error('fitQuadModel:InfValues_X','X contains Inf or -Inf')
end %if isinf
validateattributes(y,{'double'},{'2d','real','nonempty','column','numel',size(X,1)})
if any(~isinf(y))
    error('fitQuadModel:InfValues_y','y contains Inf or -Inf')
end %if isinf

%Clean data.
[XClean, yClean] = removeNans(X,y);

%Fitting the model.
modelCoeffs = fitModel(XClean, yClean);

%Visualise the results.
% visResults(X, y, XClean, modelCoeffs)


end %fitQuadModel

function [XClean, yClean] = removeNans(X,y);

missingVals = any(isnan([X, y]), 2);
XClean = X(~missingVals, :);
yClean = y(~missingVals);

end %removeNans

function modelCoeffs = fitModel(XClean, yClean);

nVars = size(XClean,2); %either 1 or 2
switch nVars
    case 1
        A = [ones(size(yClean)), XClean, XClean.^2];
    case 2
        x1 = XClean(:,1); x2 = XClean(:,2);
        A = [yClean.^0, x1, x1.^2, x2, x2.^2, x1.*x2];
    otherwise
        error('fitQuadModel:WrongNumberOfVars', ...
            'X must have 1 or 2 columns')
end %switch/case
modelCoeffs = A\yClean; %solve the system

end %fitModel

function visResults(X, y, XClean, modelCoeffs)
        
    end %visResults
