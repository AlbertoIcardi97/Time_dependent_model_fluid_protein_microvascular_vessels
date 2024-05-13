% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function [Qw, p] = solve_for_fluid_pressure( Nelem, Hsize, Nodes , dt, radius, hyd_cond, protein_press, Qw_prev,...
alpha_BC,gamma_BC,beta_BC)

% [Qw, p] = solve_for_fluid_pressure(Ntubes, Elements, Internal_Nodes, Node_To_Tube_Adjac, Nint, Nelem, lengths, Hsize, ...
%                                    radius, area, hyd_cond, protein_press, Nb_Dir, Bnd_Dir_Nodes, pb, Nb_Neu, Bnd_Neu_Nodes, sigma)

global rho mu_fluid gamma sigma

% K coefficient
K=  rho/(pi*radius^2*dt) + ( 2* mu_fluid * (gamma+2) )/ (pi*radius^4);

diffusion        = 1/K;
velocity         = zeros(Nelem,1); 
recombination    = 2*pi*radius*hyd_cond;
generation       = zeros(Nodes, 1);
generation(:,1)  = 2*pi*radius*hyd_cond* sigma * protein_press ;



%----------------------------------------------------------------
% construction of tube stiffness matrix and rhs 
[Matrix_for_Fluid_System, Load_Vector_for_Fluid_System] = ...
Assemble_Tube_Matrix_and_Rhs(Nodes, Nelem, Hsize, diffusion, velocity, recombination, generation);

%----------------------------------------------------------------
% Adding term -  (rho/(pi R^2 dt K))  d/ds Qw_prev 

% Changing the load vector 
for i=2:Nodes-1
    Load_Vector_for_Fluid_System(i,1)= Load_Vector_for_Fluid_System(i,1) + ...
        (rho/(K*pi*radius^2*dt)) * ( Qw_prev(i-1,1) - Qw_prev(i,1) );
end

% First Node
Load_Vector_for_Fluid_System(1,1)= Load_Vector_for_Fluid_System(1,1) + ...
        (rho/(K*pi*radius^2*dt)) * (- Qw_prev(i,1)) ;
    
% Last Node
Load_Vector_for_Fluid_System(Nodes,1)= Load_Vector_for_Fluid_System(i,1) + ...
        (rho/(K*pi*radius^2*dt)) * ( Qw_prev(Nodes-1,1) );    
%     
%----------------------------------------------------------------
% BOUNDARY CONDITIONS

% Dubbio
% beta_BC(1)=beta_BC(1)- gamma_BC(1)*rho/(K*pi*radius^2*dt)* Qw_prev(1);
% beta_BC(2)=beta_BC(2)- gamma_BC(2)*rho/(K*pi*radius^2*dt)* Qw_prev(end);
% BC:
% dJ/dx + sigma*u     = f                            in \Omega = (a, b)
% J                   = v*u - D*du/dx               in \Omega 
% gamma*J \cdot n     = alpha*u - beta               on \partial \Omega={a, b}

% Il nostro J= -1/K*dp/ds 

% enforce boundary conditions
% x = a
Matrix_for_Fluid_System(1,:)     = gamma_BC(1)*Matrix_for_Fluid_System(1,:);
Matrix_for_Fluid_System(1,1)     = Matrix_for_Fluid_System(1,1) + alpha_BC(1);
Load_Vector_for_Fluid_System(1)  = gamma_BC(1)*Load_Vector_for_Fluid_System(1);
Load_Vector_for_Fluid_System(1)  = Load_Vector_for_Fluid_System(1) + beta_BC(1);

% x = b
Matrix_for_Fluid_System(Nodes,:)    = gamma_BC(2)*Matrix_for_Fluid_System(Nodes,:);
Matrix_for_Fluid_System(Nodes,Nodes)   = Matrix_for_Fluid_System(Nodes,Nodes) + alpha_BC(2);
Load_Vector_for_Fluid_System(Nodes) = gamma_BC(2)*Load_Vector_for_Fluid_System(Nodes);
Load_Vector_for_Fluid_System(Nodes) = Load_Vector_for_Fluid_System(Nodes) + beta_BC(2);

        
%----------------------------------------------------------------
% Solution p
p  = Matrix_for_Fluid_System \ Load_Vector_for_Fluid_System;

% % Bc EDP
% ndof = length(Load_Vector_for_Fluid_System);
% u_g = sparse(ndof,1);
% boundary_points=[1;Nodes];
% u_g(boundary_points)=[beta_BC(1);beta_BC(2)];
% A_0=Matrix_for_Fluid_System;
% b_0=Load_Vector_for_Fluid_System-Matrix_for_Fluid_System*u_g;
% 
% for k = 1:length(boundary_points)
%     A_0(boundary_points(k),:) = 0;
%     A_0(:,boundary_points(k)) = 0;
%     A_0(boundary_points(k),boundary_points(k)) = 1;
%     b_0(boundary_points(k)) = 0;
% end
% 
% Load_Vector_for_Fluid_System=b_0;
% Matrix_for_Fluid_System=A_0;
% p  = Matrix_for_Fluid_System \ Load_Vector_for_Fluid_System;
% p=p+u_g;


% Compute the Axial volumetric flow rate
Qw_rec = Flux_Recovery (Nelem, diffusion, velocity, Hsize, p);

% Flux update 
Qw = Flux_Update( Nelem, diffusion, velocity, Hsize, dt, Qw_rec, Qw_prev, radius);

return
