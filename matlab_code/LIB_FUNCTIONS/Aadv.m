% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function A = Aadv(v, h)
% A = Addv(v, h) -----> v is a constant value over the element K
A = -v/2*[-1, -1; 1, 1];
%
return
