function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivoting
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix

if nargin ~= 1, error('one input required. No more, no less'), end
[n,m] = size(A);
if n ~= m, error('square matrix required.'),end

P = zeros(n,n);
for i = 1:n
    P(i,i) = 1;
end
L = P;
U = A;
POG = P;

for j = 1:n-1
    %Pivoting
    col = abs(U(:,j));
    max = col(j);
    for i = 0:n-2
        if col(n-i) > max
            max = col(n-i);
            r2s = n-i;
        end
    end
    if max ~= col(j)
        Uold = U;
        U(r2s,:) = Uold(1,:);
        U(1,:) = Uold(r2s,:);
        P(r2s,:) = POG(1,:);
        P(1,:) = POG(r2s,:);
    end
    % Making zeros
    for i = j:n-1
        L(i+1,j) = U(i+1,j)/U(j,j);
        URN = U(i+1,:);
        U(i+1,:) = URN - U(j,:)*L(i+1,j);
    end
end
end
