% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
% in this script we plot the quantities of interest associated 
% with the fluid component of the mixture

%% Pressure p
s=[0:Hsize:length]';
time=[0:dt:Time]';
Number_of_plot= 5;
min_U = min(min(p));
max_U = max(max(p));

if(min_U>0)
    MINU=min_U*0.8;
else
    MINU = min_U*1.2;
end

if(max_U>0)
    MAXU=max_U*1.2;
else
    MAXU = max_U*0.8;
end 

delta_t=fix(Steps/Number_of_plot);
lgd = cell(Number_of_plot,1) ;

figure
hold on
i=1;
for n=1:delta_t:Steps
   
   plot(s,p(:,n),'o-');
   grid on
   axis([min(s) max(s) MINU MAXU]);
   lgd{i} = strcat('Time=',num2str(time(n)),'s');
   i=i+1;
   title(sprintf('Pressure [cmH2O] at %d different time instants',Number_of_plot));
   
   xlabel('$s [\textrm{cm}]$','Interpreter','latex');
   ylabel('$p_h [\textrm{cmH2O}]$','Interpreter','latex');
     
end
legend(lgd,'Location','Southeast')

%% Axial volumetric flow rate Qw
s=[0:Hsize:length]';
time=[0:dt:Time]';
Number_of_plot= 5;
min_U = min(min(Qw_plot));
max_U = max(max(Qw_plot));

if(min_U>0)
    MINU=min_U*0.8;
else
    MINU = min_U*1.2;
end

if(max_U>0)
    MAXU=max_U*1.2;
else
    MAXU = max_U*0.8;
end 

delta_t=fix(Steps/Number_of_plot);
lgd = cell(Number_of_plot,1) ;
figure;
hold on
i=1;
ss    = [];
for kk = 1:Nelem
    ss = [ss; s(kk); s(kk+1)];
end

for n=1:delta_t:Steps
   
   plot(ss,Qw_plot(:,n),'o-');
   axis([min(s) max(s) MINU MAXU]);
   grid on
   lgd{i} = strcat('Time=',num2str(time(n)),'s');
   i=i+1;
   title(sprintf('Axial volumetric flow rate [cm^3/s] at %d different time instants',Number_of_plot));
   
   xlabel('$s [\textrm{cm}]$','Interpreter','latex');
   ylabel('$Q_{w,h} [\textrm{cm}^3 \textrm{s}^{-1}]$','Interpreter','latex');
   
end
legend(lgd,'Location','Southeast')


%% Specific lateral volumetric flow rate jw
s=[0:Hsize:length]';
time=[0:dt:Time]';
Number_of_plot= 5;
min_U = min(min(jw));
max_U = max(max(jw));

if(min_U>0)
    MINU=min_U*0.8;
else
    MINU= min_U*1.2;
end

if(max_U>0)
    MAXU=max_U*1.2;
else
    MAXU = max_U*0.8;
end 

delta_t=fix(Steps/Number_of_plot);
lgd = cell(Number_of_plot,1) ;

figure
hold on
i=1;
for n=1:delta_t:Steps
   
   plot(s,jw(:,n),'o-');
   axis([min(s) max(s) MINU MAXU]);
   grid on
   lgd{i} = strcat('Time=',num2str(time(n)),'s');
   i=i+1;
   title(sprintf('Specific lateral volumetric flow rate [cm^2/s] at %d different time instants',Number_of_plot));
   
   xlabel('$s [\textrm{cm}]$','Interpreter','latex');
   ylabel('$j_{w,h} [\textrm{cm}^{2} \textrm{s}^{-1}]$','Interpreter','latex');
     
end
legend(lgd,'Location','Southeast')
