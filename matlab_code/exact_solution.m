% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
% Exact solution %
global rho mu_fluid gamma 
% Fix space coefficient
if(run_mode==0)
    space_coef=-140;
else
    space_coef= -16;
end

% Compute time coefficient
alpha= 2*mu_fluid*(gamma+2)/(pi*radius^4);
%time_coef= -(radius*space_coef^2)/(2*rho*Lp)-(pi*radius^2*alpha)/rho;
time_coef=- (radius* space_coef^2) / (2*rho*hyd_cond)- (alpha*pi*radius^2)/rho;
% Exact solution
% exp(time_coef.*t)
% p_exact = @(s_fun,t_fun)  (space_coef/(2*pi*radius*Lp)) .* ( sin(space_coef.*s_fun)-cos(space_coef.*s_fun) )*exp(time_coef.*t_fun);
p_exact = @(s_fun,t_fun)  ( sin(space_coef.*s_fun)+cos(space_coef.*s_fun) ) .*exp(time_coef.*t_fun);
%plot(s,p_exact(s,time(2)))
Qw_exact= @(s_fun,t_fun) ( (2*pi*radius*hyd_cond)/space_coef ).*(- sin(space_coef.*s_fun)+cos(space_coef.*s_fun) ) .*exp(time_coef.*t_fun);
% n=8;
% %plot(s,p(:,n),'o-',s,p_exact(s,time(n)),'*');
% plot(s,p_exact(s,time(n)));
% 
% s=[0:Hsize:length]';
% time=[0:dt:Time]';
% Number_of_plot= 5;
% delta_t=fix(Steps/Number_of_plot);
% lgd = cell(Number_of_plot,1) ;
% 
% % figure
% hold on
% i=1;
% for n=1:delta_t:Steps
%    
%    plot(s,p_exact(s,time(n)),'*');
%    grid on
%    lgd{i} = strcat('Time=',num2str(time(n)),'s');
%    i=i+1;
%    title(sprintf('Exact Pressure [cmH2O] at %d different time instants',Number_of_plot));
%    
%    xlabel('$s [\textrm{cm}]$','Interpreter','latex');
%    ylabel('$p_h [\textrm{cmH2O}]$','Interpreter','latex');
%      
% end
% legend(lgd,'Location','Southeast')
