% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function [err_p_vec,err_Qw_vec,dt_vec] = Convergence_test(ref_vec)
num_test=length(ref_vec);
err_p_vec=zeros(num_test,1);
err_Qw_vec=zeros(num_test,1);
dt_vec=zeros(num_test,1);
global run_mode;

for conv_index=1:num_test
    
    run_mode=1;
    run('main.m')
    err_p_vec(conv_index,1)=err_p;
    err_Qw_vec(conv_index,1)=err_Qw;
    dt_vec(conv_index,1)=dt;
    
end

end
