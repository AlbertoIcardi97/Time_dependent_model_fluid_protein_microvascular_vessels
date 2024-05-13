% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
clear all

%%% This code can be executed in 5 different modes: %%%
% run_mode = 0 --> Computation of numerical solution when exact solution is available (case with no proteins)
% run_mode = 1 --> Computation of time test errors  
% run_mode = 2 --> Computation of space test errors
% run_mode = 3 --> Computation of numerical solution without a-priori exact solution (case with proteins)
% run_mode = 4 --> Computation of numerical solution with homogenous BC and linear IC 
                   % for proving convergence of fixed-point method since energy decreases

run_mode = 0;

% Refinment vector
if(run_mode==1)
    ref_vec=[10 20 40 80 160 320 ];
elseif(run_mode==2)
   ref_vec=[10 20 40 80 160 320]; 
end

if(run_mode == 0)
    run('main.m')
    plots_num_vs_exact_sol;
elseif(run_mode == 1)
    [errors_table,rates,mesh_vec] = Compute_errors_rates(ref_vec,run_mode);
    plots_time_errors;
elseif(run_mode == 2)
    [errors_table,rates,mesh_vec] = Compute_errors_rates(ref_vec,run_mode);
    plots_space_errors;
elseif(run_mode == 3)
    run('main.m')
    plots_fluid_num;
elseif(run_mode == 4)
    run('main.m')
    plots_fluid_num;    
end
