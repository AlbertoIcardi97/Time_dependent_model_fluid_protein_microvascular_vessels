% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function [Stiffness_Matrix, Load_Vector] = Assemble_Tube_Matrix_and_Rhs(N, Nelem, h, D, v, r, g)
% [Stiffness_matrix, load_vector] = Assemble_Tube_Matrix_and_Rhs(N, Nelem, h, D, v, r, g)
%
Stiffness_Matrix = sparse(N,N);
Load_Vector      = sparse(N,1);
% connectivity matrix
T   = zeros(Nelem,2);
for ie = 1:Nelem
    T(ie,1) = ie;
	T(ie,2) = ie+1;
end
% 
for ie = 1: Nelem
% compute local matrices and rhs
    v_ie      = v(ie);
  
    % effective diffusion coefficient (including SG stabilization)
    D_h       = Diffusion_h(D, v_ie, h);
    Kd        = Adiff(D_h, h);
	Ka        = Aadv(v_ie, h); 
	Kr        = Areac(r, h);
	Stiff_Loc = Kd + Ka + Kr;
	g_ie      = g(T(ie,:));
	Load_Loc  = rhs(g_ie, h);
% assemble global stiffness matrix
    I  = T(ie,1);
	J  = T(ie,2);
	Stiffness_Matrix(I,I) = Stiffness_Matrix(I,I) + Stiff_Loc(1,1);
	Stiffness_Matrix(I,J) = Stiffness_Matrix(I,J) + Stiff_Loc(1,2);
	Stiffness_Matrix(J,I) = Stiffness_Matrix(J,I) + Stiff_Loc(2,1);
	Stiffness_Matrix(J,J) = Stiffness_Matrix(J,J) + Stiff_Loc(2,2);
% assemble global load vector
    Load_Vector(I)        = Load_Vector(I) + Load_Loc(1);
    Load_Vector(J)        = Load_Vector(J) + Load_Loc(2);
end
%
% Impose boundary conditions
return
