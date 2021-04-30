function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
if length(x) ~= length(y)
    error('Dimension mismatch');
end
space = x(1) - x(2);
for i = 1:length(x) - 1
    if x(i) - x(i+1) ~= space
        error('Unequally spaced');
    end
end

n = length(x) - 1
sum4 = 0;
sum2 = 0;
b = x(length(x))
a = x(1)
odd = rem(length(x),2)

if odd == 1
    for i = 2:2:n
        sum4 = sum4 + y(i)
    end
    for i = 3:2:n-1
        sum2 = sum2 + y(i)
    end
    uno = (b-a)/(3*n)
    dos = (y(1)+4*sum4+2*sum2+y(length(x)))
    I = ((b-a)/(3*n))*(y(1)+4*sum4+2*sum2+y(length(x)));
else
    warning('Using trap rule!');
    b13 = x(length(x)-1);
    if n > 1
        n = n-1;
    end
    for i = 2:2:n
        sum4 = sum4 + y(i);
    end
    for i = 3:2:n-1
        sum2 = sum2 + y(i);
    end
    trap = (b-b13)*(y(length(x)-1)+y(length(x)))/2;
    simp = ((b13-a)/(3*n))*(y(1)+4*sum4+2*sum2+y(length(x)-1));
    I = trap + simp;
end


end