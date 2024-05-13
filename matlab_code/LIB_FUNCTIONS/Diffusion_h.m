% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function y = Diffusion_h(D, v, h)
% y = Diffusion_h(D, v, h)
Pe = abs(v)*h/(2*D);
y  = D*(1 + PhiSG(Pe));

%
return
