% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function Q = Flux_Recovery( Nelem, diffusion, velocity, Hsize, U)
% Q = Flux_Recovery( Nelem, diffusion, velocity, Hsize, U)

Q     = zeros(Nelem,1);

for ie = 1:Nelem
    Pe      = abs(velocity(ie))*Hsize/(2*diffusion);
    Dh      = diffusion*(1 + PhiSG(Pe));
    Q (ie,1)= velocity(ie)*(U(ie) + U(ie+1))/2 - Dh*(U(ie+1)-U(ie))/Hsize;
end

		
return
