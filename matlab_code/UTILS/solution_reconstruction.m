% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
% In this script we compute the quantities of interest

Qw_plot     = zeros(2*Nelem, Steps); % Qw spiecewise linear for plot
Qw_average  = zeros(1, Steps);     % Average axial volumetric flow rate  
Qw_total    = zeros(1,Steps);        % Total axial volumetric flow rate
jw          = zeros(Nodes, Steps);   % Specific lateral volumetric flow rate
Jw          = zeros(1,Steps);        % Total Lateral volumetric flow rate

Qc_plot     = zeros(2*Nelem, Steps); % Qc spiecewise linear for plot
Qc_average  = zeros(1, Steps);       % Average axial mass flow rate 
Qc_total    = zeros(1,Steps);        % Total axial mass flow rate 
jc          = zeros(Nodes, Steps);   % Specific lateral mass flow rate
Jc          = zeros(1,Steps);        % Total Lateral mass flow rate



for curr_time = 1:Steps
		
    for kk = 1: Nelem
        
        Qw_plot(2*kk-1,curr_time) = Qw(kk,curr_time);
		Qw_plot(2*kk,curr_time)   = Qw(kk,curr_time);
        Qc_plot(2*kk-1,curr_time) = Qc(kk,curr_time);
		Qc_plot(2*kk,curr_time)   = Qc(kk,curr_time);
        
    end
		
        % Computation of average volumetric flow rate
        Qw_average(:,curr_time) = (Hsize/length)*sum(Qw(:,curr_time));
        
        % Computation of average volumetric flow rate
        Qc_average(:,curr_time) = (Hsize/length)*sum(Qc(:,curr_time));
        
        
        % Computation of Total volumetric flow rate 
        Qw_total(1,curr_time)=trap_quad(Hsize, Qw(:,curr_time));
        
        % Computation of Total mass flow rate 
        Qc_total(1,curr_time)=trap_quad(Hsize, Qc(:,curr_time));
        
        
        %  Specific lateral volumetric flow rate
        jw(:,curr_time)  = 2*pi*radius*hyd_cond*((p(:,curr_time) - p_t) - sigma*( Conv_C_to_Pi(C(:,curr_time)) - Pi_t));
        
        % Computation Total Lateral volumetric flow rate
        Jw(1,curr_time)  = trap_quad(Hsize,  jw(:,curr_time));
        
        % Computation Specific lateral mass flow rate
        jc(:,curr_time)  = 2*pi*radius*sol_perm*(1 - sigma)/sigma*(C(:,curr_time) - C_t);
		
        % Computation Total Lateral mass flow rate
		Jc(1,curr_time)   = trap_quad(Hsize, jc(:,curr_time));
        
        
end
%
