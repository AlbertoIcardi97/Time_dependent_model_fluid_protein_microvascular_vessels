% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function A = Adiff(D, h)
% A = Adiff(D, h) -----> D is a constant value over the element K
A = D/h*[1, -1; -1, 1];
%
return
