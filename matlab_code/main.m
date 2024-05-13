% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
%%% NOTE: run this file using run_main.m %%%

close all
clearvars -except run_mode num_test conv_index ref_vec...
    Error_p_inf_vec Error_Qw_inf_vec Error_p_L2_vec Error_Qw_L2_vec mesh_vec
%
addpath ./UTILS
addpath ./PHYSICAL_DATA
addpath ./NETWORK_DATA
addpath ./NETWORK_TOLERANCES
addpath ./NETWORK_INPUT_DATA
addpath ./MATRIX_ASSEMBLY
addpath ./LIB_FUNCTIONS
addpath ./INIZIALIZATION
% 

global ilump 
global rho mu_fluid gamma p_t sigma Pi_t D_prot C_t Pd
global a1 a2 a3


clc;
%----------------------------------------------------------------
% define the physiological data of the tube
physical_data;
%----------------------------------------------------------------
% read input data and construct the data structure of the network
input_and_data_structure;
%----------------------------------------------------------------
% exact solution construction
exact_solution;
%----------------------------------------------------------------
% boundary and initial condition
boundary_and_initial_condition;
%----------------------------------------------------------------
% read the tolerances for the numerical algorithm
tolerances;
%----------------------------------------------------------------
% initialize network system variables
Initialize_Variables;
%----------------------------------------------------------------
% Algorithm
Algorithm;
%----------------------------------------------------------------
% reconstruction of the quantities of interest
solution_reconstruction;
%----------------------------------------------------------------
% plot of the variables associated with the fluid component of the mixture
%plot_fluid_quantities_of_interest;
%----------------------------------------------------------------
%plot of the variables associated with the protein component of the mixture
% plot_protein_quantities_of_interest;
%----------------------------------------------------------------

return