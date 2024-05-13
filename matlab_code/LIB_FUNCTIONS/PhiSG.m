% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function y = PhiSG(x)
% y = PhiSG(x)
[bp, bn] = bern(2*x);
y        = x - 1 + bp;
%
return
