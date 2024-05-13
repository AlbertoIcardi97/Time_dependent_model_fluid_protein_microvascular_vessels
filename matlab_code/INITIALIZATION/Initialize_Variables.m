% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
% system variables over the network
Network_Stiffness_Matrix = zeros(Nodes,Nodes);
Network_Load_Vector      = zeros(Nodes,1);

% Inizialization of the dependent variables
p   =  zeros(Nodes,Steps);  % Hydrostatic pressure in the vessel
Qw  =  zeros(Nelem,Steps);  % Axial volumetric flow rate in the vessel
C   =  zeros(Nodes,Steps);  % Protein concentration in the vessel 
Qc  =  zeros(Nelem,Steps);  % Axial mass flow rate in the vessel
p_ex =  zeros(Nodes,Steps);
Qw_ex =zeros(Nodes,Steps);
E     =zeros(1,Steps);
E_ex  = zeros(1,Steps); 
% Initial conditions
p(:,1) = p0;
Qw(:,1)= Qw0;
C(:,1) = C0;
Qc(:,1)= Qc0;
E(1,1)= E0;

if(run_mode==0 || run_mode==1 || run_mode==2)
    p_ex(:,1)=p_exact(s,time(1));
    Qw_ex(:,1)=Qw_exact(s,time(1));
    E_ex(1,1)=Compute_energy(rho,radius,Hsize,Qw_ex(:,1),C0,C_ref,run_mode,sigma,a1);
end

% Inizialization variables previous step
p_prev  = p0;
Qw_prev = Qw0;
C_prev  = C0;
Qc_prev = Qc0;

% Initial guests fixed point
average_fluid_press      = mean(beta_BC_fluid );
fluid_press              = average_fluid_press*ones(Nodes,1);
%fluid_press              = p0;
average_prot_conc        = mean(beta_BC_protein);
protein_press            = Conv_C_to_Pi(average_prot_conc)*ones(Nodes,1);
fluid_flow               = Qw0;

% Iteration vector
iter_vec= zeros(Steps,1);
