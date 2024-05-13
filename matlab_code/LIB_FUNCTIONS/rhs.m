% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function b = rhs(g,h)
% b = rhs(g,h) -----> g is a vector (2x1) over the element K
M = Local_Mass_Matrix(h);
b = M*g;
%
return
