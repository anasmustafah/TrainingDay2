function test = test_addOne()
%TEST_ADDONE: Test harness for the "addOne" function

test = functiontests(localfunctions());
end %test_addOne

function testScalarDouble(T)
input = 1;
expected = 2;
actual = addOne(input);
verifyEqual(T, actual, expected)

end %testScalarDouble

function testComplexNumber(T)
input = 3 + 5i;
expected = 4 + 5i;
actual = addOne(input);
verifyEqual(T,actual,expected)

end %testComplexNumber

function testVector(T)
input = [0; 0; 0; 0;];
expected = [1; 1; 1; 1];
actual = addOne(input);
verifyEqual(T,actual,expected)

end %testVector

function testEye(T)
input = eye(2);
expected = [2 1; 1 2];
actual = addOne(input);
verifyEqual(T,actual,expected)

end %testEye





