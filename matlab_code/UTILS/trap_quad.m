% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function integral = trap_quad(h, y)
% integral = trap_quad(h, y)
integral = h*(sum(y(2:end-1))) + h/2*(y(1) + y(end));
%
return
