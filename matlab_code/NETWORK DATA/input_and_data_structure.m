% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% read the data %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% read the total number of tubes and which tube is considered%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% row 1: Ntubes          (# of tubes in the network) 
% row 2: Tube_number     (Tube considered in this code)

Network_Data    = importdata('Number_of_tubes_and_choice_tube.txt');
Ntubes          = Network_Data(1);
Tube_number     = Network_Data(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% read the data for the model coefficients of each tube %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% # of rows    = Ntubes
% # of columns = 4
% column 1: classification            (AC, TC, VC)
% column 2: length of the tube        (L)
% column 3: radius of the tube        (R)

% Old version with all the digital units
%Tube_Data      = importdata('tube_data_mesentery.txt');

% New truncated version
Tube_Data      = importdata('tube_data_mesentery_Truncated.txt');



% scan the data matrix by columns

% Each tube of the network has its own set of data; 
   hyd_cond_vec       = zeros(Ntubes,1);
   sol_perm_vec       = zeros(Ntubes,1);
   for i = 1:Ntubes
       if (Tube_Data(i,1) == 1)
		      hyd_cond_vec(i) = Lp_AC;
              sol_perm_vec(i) = Pd_AC;
       elseif (Tube_Data(i,1) == 2)
		      hyd_cond_vec(i) = Lp_TC;
              sol_perm_vec(i) = Pd_TC;
       else
		      hyd_cond_vec(i) = Lp_VC;
              sol_perm_vec(i) = Pd_VC;
       end	
   end

   radius_vec           = Tube_Data(:,2)*1e-4;          % from \mu m (micrometro)----> cm
   length_vec           = Tube_Data(:,3)*1e-4;          % from \mu m ----> cm
   
   
% Data for the tube considered
radius    = radius_vec(Tube_number);
length    = length_vec(Tube_number);
hyd_cond  = hyd_cond_vec(Tube_number);
sol_perm  = sol_perm_vec(Tube_number);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% read the data for the FE discretization of each tube  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FEM_Data       = importdata('FE_data_mesentery.txt');
% # of elements in each tube (ASSUMPTION: uniform meshes with the SAME number of elements)
if(run_mode==2)
    Nelem          = ref_vec(conv_index);
else
    Nelem          = FEM_Data(1);
end
% # of space nodes
Nodes          = Nelem+1;
% # of temporal elements
if(run_mode==1)
    Ntemp          = ref_vec(conv_index);
else
    Ntemp          = FEM_Data(2);
end
% # of time steps 
Steps          = Ntemp+1;
% lumping of reaction matrix
ilump          = FEM_Data(3);
% cross-section of the tube
area           = pi*radius^2;
% mesh size of the tube
Hsize          = length/Nelem;
% time step
dt             = Time/Ntemp;
% space mesh
s=[0:Hsize:length]';

% time mesh 
time=[0:dt:Time]';
