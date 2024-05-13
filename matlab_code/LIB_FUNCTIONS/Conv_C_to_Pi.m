% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function y = Conv_C_to_Pi(C);
% y = Conv_C_to_Pi(C)
global a1 %a2 a3
%
y = a1*C;
% y = a1*C + a2*C.^2 + a3*C.^3;
%
return
