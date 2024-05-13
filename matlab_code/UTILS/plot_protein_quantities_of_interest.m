% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
% in this script we plot the quantities of interest associated 
% with the protein component of the mixture
%% Protein concentration C
s=[0:Hsize:length]';
time=[0:dt:Time]';
Number_of_plot= 5;
min_U = min(min(C));
max_U = max(max(C));

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
   
   plot(s,C(:,n),'o-');
   grid on
   axis([min(s) max(s) MINU MAXU]);
   lgd{i} = strcat('Time=',num2str(time(n)),'s');
   i=i+1;
   title(sprintf('Protein concentration [g/cm^3] at %d different time instants',Number_of_plot));
   xlabel('$s [\textrm{cm}]$','Interpreter','latex');
   ylabel('$C_h [\textrm{g} \textrm{cm}^{-3}]$','Interpreter','latex');
     
end
legend(lgd,'Location','Southeast')

%% Axial mass flow rate Qc
s=[0:Hsize:length]';
time=[0:dt:Time]';
Number_of_plot= 5;
min_U = min(min(Qc_plot));
max_U = max(max(Qc_plot));

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
   
   plot(ss,Qc_plot(:,n),'o-');
   grid on
   axis([min(s) max(s) MINU MAXU]);
   lgd{i} = strcat('Time=',num2str(time(n)),'s');
   i=i+1;
   title(sprintf('Axial mass flow rate [g/s] at %d different time instants',Number_of_plot));
   
   xlabel('$s [\textrm{cm}]$','Interpreter','latex');
   ylabel('$Q_{c,h} [\textrm{g} \textrm{s}^{-1}]$','Interpreter','latex');
   
end
legend(lgd,'Location','Southeast')


%% Specific lateral mass flow rate jc
s=[0:Hsize:length]';
time=[0:dt:Time]';
Number_of_plot= 5;
min_U = min(min(jc));
max_U = max(max(jc));

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
   
   plot(s,jc(:,n),'o-');
   grid on
   axis([min(s) max(s) MINU MAXU]);
   lgd{i} = strcat('Time=',num2str(time(n)),'s');
   i=i+1;
   title(sprintf('Specific lateral mass volumetric flow rate [g/(cm*s)] at %d different time instants',Number_of_plot));
   
   xlabel('$s [\textrm{cm}]$','Interpreter','latex');
   ylabel('$j_{c,h} [\textrm{g} \textrm{cm}^{-1} \textrm{s}^{-1}]$','Interpreter','latex');
     
end
legend(lgd,'Location','Southeast')
