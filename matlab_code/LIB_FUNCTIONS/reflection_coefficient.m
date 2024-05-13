% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function sigma_vec = reflection_coefficient(Ntubes, Nb_Dead_End_Protein, Bnd_Dead_End_Nodes_Protein)
%
global sigma sigma_dead_end_tube
%
sigma_vec = sigma*ones(Ntubes, 1);
% find, if any, the dead-end tubes in the network and modify the local value of the reflection coeffcient 
if (Nb_Dead_End_Protein > 0)
   for inode_bnd = 1:Nb_Dead_End_Protein
       % find the row
       index             = Bnd_Dead_End_Nodes_Protein(inode_bnd, 2);
	     i_Tube            = abs(index);
			 sigma_vec(i_Tube) = sigma_dead_end_tube;
   end
end
%
return
