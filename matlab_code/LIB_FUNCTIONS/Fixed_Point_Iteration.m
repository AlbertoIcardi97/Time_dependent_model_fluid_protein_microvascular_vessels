% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function [p_out,Qw_out,C_out,Qc_out,iter]= Fixed_Point_Iteration(n,maxit,toll,Nelem, Hsize, Nodes , dt, radius, hyd_cond,...
       fluid_press,protein_press,fluid_flow, Qw_prev,C_prev,...
       alpha_BC_fluid,gamma_BC_fluid,beta_BC_fluid,alpha_BC_protein,gamma_BC_protein,beta_B_protein)

iter = 0;
err  = toll + 1;
% fixed-point iteration between fluid pressure and protein concentration
while ((err > toll) & (iter < maxit))
      % solve for the new fluid pressure (with the previous protein pressure as input datum)
      [Qw_out, p_out] = solve_for_fluid_pressure( Nelem, Hsize, Nodes , dt, radius, hyd_cond, protein_press, Qw_prev,...
       alpha_BC_fluid,gamma_BC_fluid,beta_BC_fluid); 
   
      
	  % solve for the new protein concentration (with the fluid pressure already computed as input datum)
      [Qc_out, C_out] =  solve_for_protein_concentration( Nelem, Hsize, Nodes,dt,radius, Qw_out, C_prev,...
       alpha_BC_protein,gamma_BC_protein,beta_B_protein);
   
	  % conversion from C ----> Pi(C)
      Pi_out  = Conv_C_to_Pi(C_out);

	  % relative errors
      err_fl  = norm(p_out - fluid_press, 'inf')/norm(p_out, 'inf');
      
      err_qw  = norm(Qw_out- fluid_flow, 'inf')/norm(Qw_out, 'inf');
			
      err_pr  = norm(Pi_out - protein_press, 'inf')/norm(Pi_out, 'inf');
 
      %
      iter    = iter + 1;
      err     = max([err_fl, err_qw]);
      
      if(iter == 1)
            fprintf('         Fixed-Point Iteration number %3d is starting .... \n\n',n+1)
      end
			
	 
	  % print convergence history
      fprintf('  Iteration %3d ', iter);
      fprintf('  Maximum relative error =  %5e\n', err)
			% solution update for the next iteration
      fluid_press   = p_out;
      protein_press = Pi_out;
      fluid_flow    = Qw_out;
		
    
end

return 
