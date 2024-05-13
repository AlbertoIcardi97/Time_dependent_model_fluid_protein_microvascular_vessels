% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
s=[0:Hsize:length]';
time=[0:dt:Time]';
%% Pressure
for n=1:Steps
    
   plot(s,p(:,n),'b','Linewidth',2);
   title(sprintf('Pressure at time %f s',time(n)));
   pause(0.1)
   hold on
   
end

%% Axial volumetric flow rate
for n=1:Steps
    
   plot(s,Qw(:,n),'r','Linewidth',2);
   title(sprintf('Axial volumetric flow rate at time %f s',time(n)));
   axis([0 length -4e-6 3e-7 ])
   pause(0.1)
   hold on
   
end

%% Concentration

for n=1:Steps
    
   plot(s,C(:,n),'r','Linewidth',2);
   title(sprintf('Protein Concentration at time %f s',time(n)));
   %axis([0 length -4e-6 3e-7 ])
   pause(0.1)
   hold on
   
end