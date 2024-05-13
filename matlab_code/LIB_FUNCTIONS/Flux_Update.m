% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function Q = Flux_Update( Nelem, diffusion, velocity, h, dt, Qw, Qw_prev, radius)
% Q = Flux_Recovery(Ntubes, Nelem, diffusion, velocity, Hsize, U)
global rho

Q      = zeros(Nelem,1);


for i = 1:Nelem
    Pe          = abs(velocity(i))*h/(2*diffusion);
    Dh          = diffusion*(1 + PhiSG(Pe));
    Q (i,1)     = Qw (i,1)   + Dh * rho * Qw_prev(i,1)/(pi*radius^2*dt) ;
end

return
