function [U, S, V]= eigSVD(A, k)
% function [U, S, V]= eigSVD(A)
% Computer economic SVD of matrix A (m>=n) using eig.
% parameter k is used for truncated eigSVD
[~, n] = size(A);
B= A'*A;
if nargin == 1
    [V, D] = eig(B);
    l = n;
else
    [V, D] = eigs(B, k);
    l = k;
end
d= sqrt(diag(D)); 
e= 1./d;
S= spdiags(e, 0, l, l);   
U= (S*V')*A';
U= U';
S = d;
end
    

