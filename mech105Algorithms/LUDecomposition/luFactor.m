function [L, U, P] = luFactor(A)
% Function takes an input of matrix A and, using lu decomposition, ouputs L, a lower triangular 
%matrix containing coefficients used to create the upper triangular matrix, U.
% Function also ouputs the permientation matrix P witch is a diagonal matrix 
%doctered in relation to the pivoting done during the factoring process.

% Checking inputs
[m, n] = size(A); 
if m ~= n
    error('[A] must be a square matrix.')
end
% Creating L, U, and P matricies
L = eye(n);
U=A;
P = eye(n);
%LU Decomposition + Pivoting
for i = 1:m-1
    %Finding pivot indexes
    pivot = max(abs(U(i:m,i)))
    for j = i:m
        if(abs(U(j, i))==pivot)
            index = j
            break;
        end
    end
    %Pivoting L, U, and P matricies
    L([i, index], 1:i-1) = L([index,i],1:i-1)
    U([i, index],i:m)=U([index, i], i:m)
    P([i, index],:)=P([index, i], :)
    %Decomposition
    for k = i+1:m
        L(k, i) = U(k, i)/U(i, i)
        U(k, i:m) = U(k, i:m) - L(k, i)*U(i, i:m)
    end    
end