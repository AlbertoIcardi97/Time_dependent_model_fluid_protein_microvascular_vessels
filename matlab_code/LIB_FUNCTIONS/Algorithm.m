% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
for n=1:Steps-1
    
   beta_BC_fluid  = [p_0(time(n+1)); p_L(time(n+1))];
   % beta_BC_fluid  = [p_0(time(n+1))+Qw_0(time(n+1)); p_L(time(n+1))-Qw_L(time(n+1))];
   
    % fixed-point iteration
   [p_out,Qw_out,C_out,Qc_out,iter]= Fixed_Point_Iteration(n,maxit,toll,Nelem, Hsize, Nodes , dt, radius, hyd_cond,...
       fluid_press,protein_press,fluid_flow,Qw_prev,C_prev,...
       alpha_BC_fluid,gamma_BC_fluid,beta_BC_fluid,alpha_BC_protein,gamma_BC_protein,beta_BC_protein);


    % Solution construction
    p(:,n+1)=p_out;
    Qw(:,n+1)=Qw_out;
    C(:,n+1)=C_out;
    Qc(:,n+1)=Qc_out;
    E (1,n+1) = Compute_energy(rho,radius,Hsize,Qw_out,C_out,C_ref,run_mode,sigma,a1); 
    
    if(run_mode==0 || run_mode==1 || run_mode==2)
        p_ex(:,n+1)= p_exact(s,time(n+1));
        Qw_ex(:,n+1)= Qw_exact(s,time(n+1));
        E_ex(1,n+1)= Compute_energy(rho,radius,Hsize,Qw_ex(:,n+1),C_out,C_ref,run_mode,sigma,a1);
    end
    % Change previous variables
    p_prev=p_out;
    Qw_prev=Qw_out;
    C_prev=C_out;
    Qc_prev=Qc_out;
    
    % Iteration vector
    iter_vec(n+1,1)=iter;
    

    
end