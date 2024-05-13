% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
%%%%--------- BOUNDARY CONDITION ---------%%%%
global rho mu_fluid gamma 

if(run_mode==3)
    % Normal BC
    p_0    = @(t) 2+0.*t;
    p_L    = @(t) 6+0.*t;
elseif(run_mode==4)
    p_0    = @(t)  0.*t;
    p_L    = @(t)  0.*t;
else
    % Exact boundary conditions
    p_0=   @(t) p_exact(0,t);
    p_L=   @(t) p_exact(length,t);
    Qw_0=  @(t) Qw_exact(0,t);
    Qw_L=  @(t) Qw_exact(length,t); 
end

% Depend on t 
alpha_BC_fluid = [1; 1]; % Neumann sx: alpha_BC_fluid = [0; 1];
gamma_BC_fluid = [0; 0]; % Neumann sx: gamma_BC_fluid = [1; 0];
beta_BC_fluid  = [p_0(time(1)); p_L(time(1)) ];

if(run_mode==3)
    C_0    = C_ref; 
    C_L    = C_ref;
else
    % Others cases: exact sol--> no protein ; energy--> no BC
    C_0    =  0; 
    C_L    =  0;
end

alpha_BC_protein = [1; 1];
gamma_BC_protein = [0; 0];
beta_BC_protein  = [C_0; C_L];

%%%%--------- INITIAL CONDITIONS ---------%%%%

% Initial condition fluid
K =  rho/(pi*radius^2*dt) + ( 2* mu_fluid * (gamma+2) )/ (pi*radius^4);
diffusion_fluid = 1/K;
velocity_fluid  = zeros(Nelem,1);

if(run_mode == 3 ||run_mode == 4)
    % Linear initial pressure 
    p_0_IC    = 1;
    p_L_IC    = 3;
    p0=p_0_IC + ((p_L_IC-p_0_IC)/length)*s;
    Qw0=Flux_Recovery(Nelem, diffusion_fluid, velocity_fluid, Hsize, p0);
else
    % Exact solution
    p0 =  p_exact(s,time(1));
    Qw0_nodes = Qw_exact(s,time(1)); 
    Qw0=(Qw0_nodes(1:end-1)+Qw0_nodes(2:end))./2;
end

% Initial condition protein
diffusion_protein      = D_prot*pi*radius^2;
velocity_protein       = Qw0;

if(run_mode == 4)
    % Energy: linear initial concentration
    C_0_IC= 0.0250;
    C_L_IC= 0.2;
    C0 = C_0_IC + ((C_L_IC-C_0_IC)/length)*s;
elseif(run_mode == 3)
    % Constant initial protein concentration
    C0  =  C_ref.*ones(Nodes,1); 
    
else
    % Exact sol--> no proteins
    C0   =  zeros(Nodes,1);
end 

% Flux recovery
Qc0  = Flux_Recovery(Nelem, diffusion_protein, velocity_protein, Hsize, C0);

% Energy
E0   = Compute_energy(rho,radius,Hsize,Qw0,C0,C_ref,run_mode,sigma,a1); 
