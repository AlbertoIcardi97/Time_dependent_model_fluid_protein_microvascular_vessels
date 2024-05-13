% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
ref_vec=[10;12;14];
[err_p_vec,err_Qw_vec,dt_vec] = Convergence_test(ref_vec);

%% Plot error Qw
figure(1);
subplot(2,1,1);
loglog(dt_vec,err_Qw_vec,'-o',dt_vec,1e1*dt_vec.^2,'k-',dt_vec,1e-4*dt_vec,'k-.','LineWidth',3);
ylim([1e-11,1e-8])
legend("Error","h^2","h^1")
ylabel('Error');
xlabel('dt')
title('Axial volumetric flow rate error');
% Plot Pressure
subplot(2,1,2);
loglog(dt_vec,err_p_vec,'-o',dt_vec,1e3*dt_vec.^2,'k-',dt_vec,1e-2*dt_vec,'k-.','LineWidth',3);
legend("Error","h^2","h^1")
ylim([1e-9,1e-6])
ylabel('Error');
xlabel('dt')
title('Pressure error');
