% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function M = Local_Mass_Matrix(h);
% M = Local_Mass_Matrix(h)
global ilump
%
if (ilump == 0)
   M = h/6*[2, 1; 1, 2];
else
   M = h/2*eye(2);
end
%
return
