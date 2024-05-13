% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function A = Areac(r,h)
% A = Areac(r,h) -----> r is a constant value over the element K
M = Local_Mass_Matrix(h);
A = r*M;
%
return
