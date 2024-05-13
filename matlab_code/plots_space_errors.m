% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
% Plot error Qw
Error_p_inf_vec=errors_table.Error_p_inf;
Error_Qw_inf_vec=errors_table.Error_Qw_inf;
Error_p_L2_vec=errors_table.Error_p_L2;
Error_Qw_L2_vec=errors_table.Error_Qw_L2;

%% L_inf_space_error
figure(1);
setfonts
subplot(1,2,1);
setfonts
loglog(mesh_vec,Error_p_inf_vec,'r-o',mesh_vec,5e1*mesh_vec.^2,'k-.');
grid on
axis square

%ylim([1e-11,1e-8])
legend("$\textrm{Err}_{\,L_{\infty}}(p)$","$\Delta s^2 $",'Interpreter','latex','Location','Northwest','Fontsize',25)
ylabel('$\textrm{Err}_{\,L_{\infty}}(p)$','Interpreter','latex');
xlabel('$\Delta s [m]$','Interpreter','latex')
title('Pressure');
%Plot Pressure
subplot(1,2,2);
loglog(mesh_vec,Error_Qw_inf_vec,'r-o',mesh_vec,1e-10*mesh_vec.^2,'k-.','LineWidth',3);
legend("$\textrm{Err}_{\,L_{\infty}}(q_f)$","$\Delta s^2 $",'Interpreter','latex','Location','Northwest','Fontsize',25)

%ylim([1e-9,1e-6])
grid on
axis square
ylabel('$\textrm{Err}_{\,L_{\infty}}(q_f)$','Interpreter','latex');
xlabel('$\Delta s [m]$','Interpreter','latex')
title('Axial volumetric flow rate');

sgtitle('L^{\infty}- space error','Fontsize',25,'Linewidth',5,'FontName','Arial')

%% L2_space_error
figure(2);
setfonts
subplot(1,2,1);
setfonts
loglog(mesh_vec,Error_p_L2_vec,'r-o',mesh_vec,10e1*mesh_vec.^2,'k-.');
grid on
axis square
%ylim([1e-11,1e-8])
legend("$\textrm{Err}_{\,L_{2}}(p)$","$\Delta s^2 $",'Interpreter','latex','Location','Northwest','Fontsize',25)
ylabel('$\textrm{Err}_{\,L_{2}}(p)$','Interpreter','latex');
xlabel('$\Delta s [s]$','Interpreter','latex')
title('Pressure');
%Plot Pressure
subplot(1,2,2);
loglog(mesh_vec,Error_Qw_L2_vec,'r-o',mesh_vec,1e-10*mesh_vec.^2,'k-.','LineWidth',3);
legend("$\textrm{Err}_{\,L_{2}}(q_f)$","$\Delta s^2 $",'Interpreter','latex','Location','Northwest','Fontsize',25)

%ylim([1e-9,1e-6])
grid on
axis square
ylabel('$\textrm{Err}_{\,L_{2}}(q_f)$','Interpreter','latex');
xlabel('$\Delta s [m]$','Interpreter','latex')
title('Axial volumetric flow rate');

sgtitle('L^{2}- space error','Fontsize',25,'Linewidth',5,'FontName','Arial')
