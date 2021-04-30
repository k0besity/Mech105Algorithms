function [base2] = binaryConverter(base10)
%binary A simple function to convert a base10 number to binary
%   Inputs:
%       base10 - A number in base10
%   Outputs:
%       base2 - The base10 number converted to binary
n = 100;
b10 = base10;
if b10 == 0
    base2 = zeros(1);
else
    while b10 - 2^n < 0
        n = n-1;
    end
    
    j = n+1;
    base2 = ones(1,j);
    
    while n > -1
        if b10 - 2^n < 0
            base2(j-n) = 0;
        else
            b10 = b10 - 2^n;
        end
        n = n-1;
    end
end

end
