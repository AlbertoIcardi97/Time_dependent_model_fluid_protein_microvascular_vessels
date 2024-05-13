% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function M = Mass_Matrix(N, h);
% M = Mass_Matrix(N, h)
M(1,1) = 2*h/6;
M(1,2) = h/6;
for kk = 2:N-1
    M(kk,kk-1) = h/6;
		M(kk,kk)   = 4*h/6;
		M(kk,kk+1) = h/6;
end
M(N,N-1) = h/6;
M(N,N)   = 2*h/6;
%
return
