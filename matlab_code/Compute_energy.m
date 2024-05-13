% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function Energy = Compute_energy(rho,radius,Hsize,Qw,C,C_ref,run_mode,sigma,a1)
% Compute energy with trapezoidial quadrature rule
const_prot= sigma*a1*pi*radius^2;
 if(run_mode<=3)
     % exact solution case
     Energy=0.5*rho/(pi*radius^2)*trap_quad(Hsize,Qw.^2);
 else
     % also proteins
     protein_en=const_prot.*C(2:end-1).*(log(C(2:end-1)./C_ref)-1);
     Energy=0.5*rho/(pi*radius^2)*trap_quad(Hsize,Qw.^2)+trap_quad(Hsize,protein_en);
 end
end
