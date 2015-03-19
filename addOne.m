function xplusone = addOne(x)

narginchk(1,1) %only 1 input
validateattributes(x,{'double','char'},{'nonempty'})
%Note: only if NaN and Inf is not allowed
% if any(isnan(x))
%     error('addOne:NaNinput','NaN is not allowed')
% end
% if any(isinf(x))
%     error('addOne:Infinput','Inf or -Inf  is not allowed')
% end

xplusone = x +1;

end %addOne