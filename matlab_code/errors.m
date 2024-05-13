% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
% Script compute errors inf, L2

% Inf norm
Error_p_inf=max(max(abs(p-p_ex)));
Qw_ex_err=(Qw_ex(1:end-1,:)+Qw_ex(2:end,:))./2;
Error_Qw_inf=max(max(abs(Qw-Qw_ex_err)));

% L2 norm as max on time of L2 errors in space
L2_errors_p=zeros(Steps,1);
L2_errors_Qw=zeros(Steps,1);
for k=1:Steps
    L2_errors_p(k,1)=norm(p(:,k)-p_ex(:,k),2);
    L2_errors_Qw(k,1)=norm(Qw(:,k)-Qw_ex_err(:,k),2);
end

Error_p_L2=max( L2_errors_p);
Error_Qw_L2=max(L2_errors_Qw);
