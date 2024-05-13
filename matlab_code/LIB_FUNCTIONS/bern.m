% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function [bp, bn] = bern (x)
%   [bp, bm] = bern (x)
%   
%   compute the inverse of the Bernoulli function 
%    bp = B(x)  = x / (exp(x)-1)
%    bm = B(-x) = x + B(x)
%

  xlim = 1e-2;
  ax   = abs (x);

  % Compute Bernoulli function at x=0

  if (ax == 0)
    bp=1.;
    bn=1.;
    return
  end;


  % Compute Bernoulli function for asymptotic values of x

  if (ax > 80),
    if (x >0),
      bp=0.;
      bn=x;
      return
    else
      bp=-x;
      bn=0.;
      return
    end;
  end;

  % Compute Bernoulli function for intermediate values of x

  if (ax > xlim),
    bp=x/(exp(x)-1);
    bn=x+bp;
    return
  else

    
    % Compute Bernoulli function for |x| \simeq 0
		% using truncated Taylor's expansion of exp(x)
    
    ii=1;
    fp=1.;
    fn=1.;
    df=1.;
    s=1.;
    while (abs(df) > eps),
      ii=ii+1;
      s=-s;
      df=df*x/ii;
      fp=fp+df;
      fn=fn+s*df;
      bp=1./fp;
      bn=1./fn;
    end;
    return
  end
    
end
