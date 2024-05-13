% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function y = Conv_Pi_to_C(a1, a2, a3, press);
% y = Conv_Pi_to_C(a1, a2, a3, press)
coeffs = [a3, a2, a1, -press];
% the output concentration is measured in g/cm^3
y      = roots(coeffs);
% select the only real solution of the third-order equation
for i = 1:3
    K(i) = isreal(y(i));
end
%
index = find(K == 1);
y     = y(index);
%
return
