% This file defines the main physical parameters of the tube
if(run_mode==0)
    % Only main 
    Time               = 3e-9;  % []= s (second)
elseif(run_mode==1)
    % Time test error
    Time               = 3e-7;
elseif(run_mode==2)
    % Space test error 
    Time               = 3e-9;
elseif(run_mode==3)
    % No exact solution
    Time               = 3e-7; 
elseif(run_mode==4)
    % Energy
    Time               = 3e-7;
end

rho                = 0.8;            % []= g/cm^3 (partial density of fluid phase considering hematocrit 40% )
mu_fluid           = 1.1e-5;         % []= cmH2O*s
gamma              = 2;              % Steepness parameter Hagen-Poiseuille
sigma              = 0.8;            % Reflection coefficient for a tube in normal protein leakage conditions
sigma_dead_end_tube = sigma/10;       % reflection coefficient for a tube in high protein leakage conditions (dead end tube)

% median values
Lp_AC    = 1.5e-7;          % cm/(s*cmH2O)
Lp_TC    = 3.0e-7;          % cm/(s*cmH2O)
Lp_VC    = 5.0e-7;          % cm/(s*cmH2O)
%
%Lp       = (Lp_AC + Lp_TC + Lp_VC)/3;

%
Pi_ref   = 11.3;            % cmH2O

%
p_t      = 0;               % cmH2O
Pi_t     = 0;               % cmH2O

%C_ref    = 46e-3;           % g/cm^3

a1       = 380.8;           % cmH20/(g/cm^3)
a2       = 2448;            % cmH20/(g/cm^3)^2
a3       = 1.632e4;         % cmH20/(g/cm^3)^3
% determine the reference protein concentration (units: g/cm^3) (NOTE: THE VALUE OF CREF IS VERY MUCH DIFFERENT FROM THAT REPORTED IN SUMMARY.PDF!!!!!
%                                                              FEB 02, 2020)
C_ref= Conv_Pi_to_C(a1, a2, a3, Pi_ref);      

% % No protein, for exact solution         
% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
% %C_ref    = 0 ;
% % Normal with protein
% C_ref= Conv_Pi_to_C(a1, a2, a3, Pi_ref);      
%

D_prot   = 61e-8;       % cm^2/s Diffusion coefficient of human serum albumin in water
                            % Ref.: Life's Devices. The Physical World of Animals and Plants. Steven Vogel. Princeton University Press, 
														% Princeton, NJ, 1989. p.164 table 8.1. (NOTE: THE VALUE HAS BEEN ARTIFICALLY INCREASED ON FEB 1/2, 2020)
C_t      = 0;               % g/cm^3
% median values
Pd_AC    = 1.7e-7;          % cm/s
Pd_TC    = 2.9e-7;          % cm/s
Pd_VC    = 4.8e-7;          % cm/s
%
Pd       = (Pd_AC + Pd_TC + Pd_VC)/3;
