% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function [Qc, C] = solve_for_protein_concentration( Nelem, Hsize, Nodes,dt,radius, Qw, C_prev,...
    alpha_BC,gamma_BC,beta_BC)
																								
% [Qc, C] = solve_for_protein_concentration(Ntubes, Elements, Internal_Nodes, Node_To_Tube_Adjac, Nint, Nelem, lengths, Hsize, ...
%                                           radius, area, sol_perm, Qw, Nb_Dir, Bnd_Dir_Nodes, Cb, Nb_Neu, Bnd_Neu_Nodes, ...
%                                           Nb_Dead_End_Protein, Bnd_Dead_End_Nodes_Protein, sigma)
global D_prot Pd sigma 
%
diffusion      = D_prot;   %%D_prot*pi*radius^2;
velocity       = Qw/(pi*radius^2);  %%Q_w
recombination  = 1/dt +  2*(1-sigma)/(sigma*radius)*Pd;  %2*pi*radius*Pd*(1 - sigma)/sigma; %% in teoria: 2*(1-sigma)/(sigma*radius)
gen_val        = C_prev/dt ;
generation     = gen_val.*ones(Nodes,1);

%----------------------------------------------------------------


% construction of tube stiffness matrix and rhs 
[Matrix_for_Fluid_System, Load_Vector_for_Fluid_System] = ...
Assemble_Tube_Matrix_and_Rhs(Nodes, Nelem, Hsize, diffusion, velocity, recombination, generation);

%----------------------------------------------------------------
% boundary conditions
% enforce boundary conditions
% x = a
Matrix_for_Fluid_System(1,:)     = gamma_BC(1)*Matrix_for_Fluid_System(1,:);
Matrix_for_Fluid_System(1,1)     = Matrix_for_Fluid_System(1,1) + alpha_BC(1);
Load_Vector_for_Fluid_System(1)       = gamma_BC(1)*Load_Vector_for_Fluid_System(1);
Load_Vector_for_Fluid_System(1)       = Load_Vector_for_Fluid_System(1) + beta_BC(1);

% x = b
Matrix_for_Fluid_System(Nodes,:)   = gamma_BC(2)*Matrix_for_Fluid_System(Nodes,:);
Matrix_for_Fluid_System(Nodes,Nodes)  = Matrix_for_Fluid_System(Nodes,Nodes) + alpha_BC(2);
Load_Vector_for_Fluid_System(Nodes)     = gamma_BC(2)*Load_Vector_for_Fluid_System(Nodes);
Load_Vector_for_Fluid_System(Nodes)     = Load_Vector_for_Fluid_System(Nodes) + beta_BC(2);

%----------------------------------------------------------------
% Solution C
C  = Matrix_for_Fluid_System \ Load_Vector_for_Fluid_System;

% compute the axial protein flux along the network system  
Qc = Flux_Recovery( Nelem, diffusion, velocity, Hsize, C);

return
