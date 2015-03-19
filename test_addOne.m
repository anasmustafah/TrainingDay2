function test = test_addOne()
% TEST_ADDONE: Test harness for the "addOne" function
% addOne to any single input

test = functiontests(localfunctions());
end %test_addOne

%Verify function's application
function testScalarDouble(T)
input = 1;
expected = 2;
actual = addOne(input);
verifyEqual(T, actual, expected,'AbsTol', 1e-6)

end %testScalarDouble

function testComplexNumber(T)
input = 3 + 5i;
expected = 4 + 5i;
actual = addOne(input);
verifyEqual(T,actual,expected,'AbsTol', 1e-6)

end %testComplexNumber

function testVector(T)
input = zeros(4,1);
expected = ones(size(input));
actual = addOne(input);
verifyEqual(T,actual,expected,'AbsTol', 1e-6)

end %testVector

function testEye(T)
input = eye(2);
expected = [2 1; 1 2];
actual = addOne(input);
verifyEqual(T,actual,expected,'AbsTol', 1e-6)

end %testEye

function testChar(T)
input = 'Mike';
expected = double('Njlf');
actual = addOne(input); %if not using double, use: char(addOne(input));
verifyEqual(T,actual,expected,'AbsTol', 1e-6)

end %testChar

%Verify the error responses

function testNargin(T)
%test with zero input.
codeToEvaluate = @() addOne();
verifyError(T, codeToEvaluate, 'MATLAB:narginchk:notEnoughInputs')

%test with too many inputs.
codeToEvaluate = @() addOne(1,1)
verifyError(T, codeToEvaluate, 'MATLAB:TooManyInputs')

end

function testEmpty(T)
codeToEvaluate = @() addOne(double.empty())
%Note: [] is the same as double.empty
verifyError(T, codeToEvaluate, 'MATLAB:expectedNonempty')

end %testEmpty

function testNonDoubleNonChar(T)
codeToEvaluate = @() addOne(single(1))
verifyError(T, codeToEvaluate, 'MATLAB:invalidType')

end %testNonDoubleNonChar

function testNaNInf(T)
%test for NaN
input = NaN;
expected = NaN;
actual = addOne(input)
verifyEqual(T, actual, expected)

%test for Inf
input = [Inf, -Inf];
expected = [Inf, -Inf];
actual = addOne(input)
verifyEqual(T, actual, expected)

end %testNonDoubleNonChar


% 
