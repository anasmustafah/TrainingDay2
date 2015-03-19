function [percent_odd, backward_elements] = analyzerEx()

% Generate a 100-by-100 matrix where A(i,j) = i + j;
% A = NaN(nchoosek(100,1));
% for ii = 1:100
%     for jj = 1:100
%         A(ii,jj) = ii + jj;
%     end
% end

ii = 1:100;
jj = 1:100;
% MESHGRID
[II,JJ] = meshgrid(ii,jj);
A = II + JJ;
% Matrix multiplication
A = ones(100,1)*ii+jj'*ones(1,100);
% REPMAT
A = repmat(1:100, 100, 1) + repmat((1:100).',1,100);
% CUMSUM
A = cumsum(ones(100)) + cumsum(ones(100),2);

% Calculate the percentage of elements that are odd
num_pos = sum(rem(A(:), 2) == 1);
num_elements = numel(A);
percent_odd = 100*num_pos/num_elements;

% Create an array of elements in backwards order
backward_elements = (sort(A(:),'descend'));

