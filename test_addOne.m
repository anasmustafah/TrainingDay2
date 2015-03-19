function test = test_addOne()
%TEST_ADDONE: Test harness for the "addOne" function

test = functiontests(localfunctions());
end %test_addOne

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





