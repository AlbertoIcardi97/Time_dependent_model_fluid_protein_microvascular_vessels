s=[0:Hsize:length]';
time=[0:dt:Time]';
Number_of_plot= 3;
delta_t=fix(Steps/Number_of_plot);
lgd = cell(Number_of_plot*2,1) ;
colors=['r','b','k'];
% Pressure p
figure(1)
setfonts   
hold on
i=1;
col_index=1;
for n=2:delta_t:Steps
   
   subplot(1,3,col_index)
   plot(s,p(:,n), 'r*');
   hold on
   grid on
   title(strcat('Time=',num2str(time(n)),'s'));
   legend('Numerical solution','Location','Southeast','Fontsize', 15)
   %lgd{i} = 'Exact solution';  %strcat('Exact solution Time=',num2str(time(n)),'s');
   %lgd{i+1}= 'Numerical solution' % strcat('Numerical solution Time=',num2str(time(n)),'s');
   i=i+2;
   col_index=col_index+1;
   sgtitle('Pressure [cmH2O]','Fontsize',25,'Linewidth',5,'FontName','Arial');
   
   xlabel('$s [\textrm{cm}]$','Interpreter','latex');
   ylabel('$p [\textrm{cmH2O}]$','Interpreter','latex');
     
end
%legend(lgd,'Location','Northeast')

%% Axial volumetric flow rate Qw
ss    = [];
for kk = 1:Nelem
    ss = [ss; s(kk); s(kk+1)];
end

figure(2)
hold on
i=1;
col_index=1;
for n=2:delta_t:Steps
   
   subplot(1,3,col_index)
   plot(ss,Qw_plot(:,n),'r*'); %'Marker','*','color', colors(col_index) );
   hold on
   grid on
   title(strcat('Time=',num2str(time(n)),'s'));
   legend('Numerical solution','Location','South','Fontsize', 12)
   %lgd{i} = strcat('Exact solution Time=',num2str(time(n)),'s');
   %lgd{i+1}= strcat('Numerical solution Time=',num2str(time(n)),'s');
   i=i+2;
   col_index=col_index+1;
   sgtitle('Axial volumetric flow rate [cm^3/s]','Fontsize',25,'Linewidth',5,'FontName','Arial');
   %title(sprintf('Axial volumetric flow rate [cm^3/s] at %d different time instants',Number_of_plot));
   
   xlabel('$s [\textrm{cm}]$','Interpreter','latex');
   ylabel('$Q_{w} [\textrm{cm}^3 \textrm{s}^{-1}]$','Interpreter','latex');
     
end

%legend(lgd,'Location','Northeast')

% % Iteration
% figure(3)
% max_it=max(iter_vec);
% num_step=(1:Steps)';
% plot(num_step,iter_vec,'r.','Markersize',7);
% ylim([0,max_it+5]);
% title('number iteration for each temporal step');
% xlabel('temporal step number');
% ylabel('iteration');


% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
%% 3D plots pressure
figure(4)
[TT,SS]=meshgrid(time,s);
surf(SS,TT,p);
title('Numerical solution');
%zlim([-0.5,1.2]);
xlabel('$s [\textrm{cm}]$','Interpreter','latex');
ylabel('$t [\textrm{s}]$','Interpreter','latex');
zlabel('$p_{h} [\textrm{cmH2O}]$','Interpreter','latex');
title('Pressure [cmH2O]','Fontsize',25,'Linewidth',5,'FontName','Arial');


%% 3D plots Axial volumetric flow rate Qw
figure(5)
ss    = [];
for kk = 1:Nelem
    ss = [ss; s(kk); s(kk+1)];
end
[TT_plot,SS_plot]=meshgrid(time,ss);
surf(SS_plot,TT_plot,Qw_plot);
title('  Numerical solution');
xlabel('$s [\textrm{cm}]$','Interpreter','latex');
ylabel('$t [\textrm{s}]$','Interpreter','latex');
zlabel('$Q_{w,h} [\textrm{cm}^3 \textrm{s}^{-1}]$','Interpreter','latex');
title('Axial volumetric flow rate [cm^3/s]','Fontsize',25,'Linewidth',5,'FontName','Arial');

%% Energy
figure(6)
plot(time,E','r*')
title('Numerical Energy [g cm^2 s^{-2}]','Fontsize',25,'Linewidth',5,'FontName','Arial');
xlabel('$t [\textrm{s}]$','Interpreter','latex');
ylabel('$E [\textrm{g} \textrm{cm}^2 \textrm{s}^{-2}]$','Interpreter','latex');
