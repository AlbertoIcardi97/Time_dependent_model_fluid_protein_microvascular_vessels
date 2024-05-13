% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
% in this script we save the quantity of interest for 
% visualization purposes

%----------------------------------------------------------------
% Saving procedure
%----------------------------------------------------------------

names = {'\HydrostaticPressure', '\J_ft', '\J_pt',...
            '\jft', '\jpt', '\OncoticPressure',...
            '\Q_ftAve','\Q_ptAve'};
DropBoxFolder = 'C:\Users\nico-\Dropbox\Microvascular Networks\CODESFORPLOTTINGN\NewPredictedPressuresandFluxes';
variable = {'p','Jw', 'Jc','jw','jc','Pi','Qw_ave_tube','Qc_ave_tube'};
nametosave = {'p','Jft', 'Jpt','jft','jpt','Pi','Qftave','Qptave'};
% Detect the simulation case you are simulation

if flags(1) == 1
    sim_case = 'Heterogeneous'
elseif flags(1) == 2
    sim_case =  'Class';
elseif flags(1) == 3
    sim_case =  'Homogeneous'
end

for i = 1:length(names)
    desiredFolder = fullfile(DropBoxFolder,  names{i});
    filename = strcat(nametosave{i}, '_',sim_case);
    file = fullfile(desiredFolder, filename);
    save(file, variable{i})
end
