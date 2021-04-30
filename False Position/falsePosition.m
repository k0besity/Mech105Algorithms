function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
% falsePosition finds the root of a function using false position method
% func, xl, and xu are required. The other inputs are optional.
% es is the stopping criterion.
% maxit is the maximum number of iterations. maxit = 200 by default.
if nargin < 3
    error('not enough inputs');
end

test = func(xl,varargin{:}) * func(xu,varargin{:});
if test>0
    error('no sign change')
end
if nargin<4||isempty(es), es = 0.0001;end
if nargin<5||isempty(maxit), maxit = 200;end
iter = 0; xr = xl; ea = 100;

while(1)
    xrold = xr;
    xr = (-func(xu) * (xu - xl))/(func(xu) - func(xl)) + xu;
    iter = iter + 1;
    if xr ~= 0
        ea = abs((xr - xrold)/xr) * 100;
    end
    test = func(xl,varargin{:}) * func(xr,varargin{:});
  if test < 0
    xu = xr;
  elseif test > 0
    xl = xr;
  else
    ea = 0;
  end
  if ea <= es || iter >= maxit,break,end
end
root = xr; fx = func(xr, varargin{:});


end
