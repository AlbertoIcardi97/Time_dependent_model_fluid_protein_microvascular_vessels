% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function [errors_table,rates,mesh_vec] = Compute_errors_rates(ref_vec,run_mode)

num_test=length(ref_vec);
Error_p_inf_vec=zeros(1,num_test);
Error_Qw_inf_vec=zeros(1,num_test);
Error_p_L2_vec=zeros(1,num_test);
Error_Qw_L2_vec=zeros(1,num_test);

mesh_vec=zeros(1,num_test);


for conv_index= 1:num_test
    
    run('main.m');
    
    errors;
    
    Error_p_inf_vec(1,conv_index)=Error_p_inf;
    Error_Qw_inf_vec(1,conv_index)=Error_Qw_inf;
    Error_p_L2_vec(1,conv_index)=Error_p_L2;
    Error_Qw_L2_vec(1,conv_index)=Error_Qw_L2;
    
    if(run_mode==1)
        mesh_vec(1,conv_index)=dt;
    elseif(run_mode==2)
        mesh_vec(1,conv_index)=Hsize;
    end
 
end

    if(run_mode==1)
        errors_table=struct('dt',mesh_vec,...
                   'Error_p_inf', Error_p_inf_vec,...
                   'Error_Qw_inf', Error_Qw_inf_vec,...
                   'Error_p_L2', Error_p_L2_vec,...
                   'Error_Qw_L2',Error_Qw_L2_vec);
    elseif(run_mode==2)
        errors_table=struct('h',mesh_vec,...
                   'Error_p_inf', Error_p_inf_vec,...
                   'Error_Qw_inf', Error_Qw_inf_vec,...
                   'Error_p_L2', Error_p_L2_vec,...
                   'Error_Qw_L2',Error_Qw_L2_vec);
    end

    % Convergence order
    % TABLE
    rate_inf_p=log10(Error_p_inf_vec(2:num_test)./Error_p_inf_vec(1:num_test-1))./log10(mesh_vec(2:num_test)./mesh_vec(1:num_test-1));
    rate_inf_Qw=log10(Error_Qw_inf_vec(2:num_test)./Error_Qw_inf_vec(1:num_test-1))./log10(mesh_vec(2:num_test)./mesh_vec(1:num_test-1));
    rate_L2_p=log10(Error_p_L2_vec(2:num_test)./Error_p_L2_vec(1:num_test-1))./log10(mesh_vec(2:num_test)./mesh_vec(1:num_test-1));
    rate_L2_Qw=log10(Error_Qw_L2_vec(2:num_test)./Error_Qw_L2_vec(1:num_test-1))./log10(mesh_vec(2:num_test)./mesh_vec(1:num_test-1));
    
    
    rates=struct('rate_inf_p',rate_inf_p,...
             'rate_inf_Qw',rate_inf_Qw,...
             'rate_L2_p',rate_L2_p,...
             'rate_L2_Qw',rate_L2_Qw);
end
