% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
% Plot error Qw
Error_p_inf_vec=errors_table.Error_p_inf;
Error_Qw_inf_vec=errors_table.Error_Qw_inf;
Error_p_L2_vec=errors_table.Error_p_L2;
Error_Qw_L2_vec=errors_table.Error_Qw_L2;

%% L_inf_time_error
figure(1);
setfonts
subplot(1,2,1);
setfonts
loglog(mesh_vec,Error_p_inf_vec,'r-o',mesh_vec,1e4*mesh_vec,'k-.');
grid on
axis square
%ylim([1e-11,1e-8])
legend("$\textrm{Err}_{\,L_{\infty}}(p)$","$\Delta t^1 $",'Interpreter','latex','Location','Northwest','Fontsize',25)
ylabel('$\textrm{Err}_{\,L_{\infty}}(p)$','Interpreter','latex');
xlabel('$\Delta t [s]$','Interpreter','latex')
title('Pressure');
%Plot Pressure
subplot(1,2,2);
loglog(mesh_vec,Error_Qw_inf_vec,'r-o',mesh_vec,0.5e-5*mesh_vec,'k-.','LineWidth',3);
legend("$\textrm{Err}_{\,L_{\infty}}(q_f)$","$\Delta t^1 $",'Interpreter','latex','Location','Northwest','Fontsize',25)

%ylim([1e-9,1e-6])
grid on
axis square
ylabel('$\textrm{Err}_{\,L_{\infty}}(q_f)$','Interpreter','latex');
xlabel('$\Delta t [s]$','Interpreter','latex')
title('Axial volumetric flow rate');

sgtitle('L^{\infty}- time error','Fontsize',25,'Linewidth',5,'FontName','Arial')

%% L2_time_error
figure(2);
setfonts
subplot(1,2,1);
setfonts
loglog(mesh_vec,Error_p_L2_vec,'r-o',mesh_vec,1e5*mesh_vec,'k-.');
grid on
axis square
%ylim([1e-11,1e-8])
legend("$\textrm{Err}_{\,L_{2}}(p)$","$\Delta t^1 $",'Interpreter','latex','Location','Northwest','Fontsize',25)
ylabel('$\textrm{Err}_{\,L_{2}}(p)$','Interpreter','latex');
xlabel('$\Delta t [s]$','Interpreter','latex')
title('Pressure');
%Plot Pressure
subplot(1,2,2);
loglog(mesh_vec,Error_Qw_L2_vec,'r-o',mesh_vec,1e-4*mesh_vec,'k-.','LineWidth',3);
legend("$\textrm{Err}_{\,L_{2}}(q_f)$","$\Delta t^1 $",'Interpreter','latex','Location','Northwest','Fontsize',25)

%ylim([1e-9,1e-6])
grid on
axis square
ylabel('$\textrm{Err}_{\,L_{2}}(q_f)$','Interpreter','latex');
xlabel('$\Delta t [s]$','Interpreter','latex')
title('Axial volumetric flow rate');

sgtitle('L^{2}- time error','Fontsize',25,'Linewidth',5,'FontName','Arial')
