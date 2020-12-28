function [U, S, V] = frPCA(A, k, q, mode)
% this is the fast randomized PCA for sparse data
% q is the number of pass over A, q should larger than 1 and q times pass eqauls to (q-2)/2 times power iteration
% mode = 1 is use the frPCA and mode = 2 is the frPCAt
s = 5;
[m, n] = size(A);
if mode == 1
    if rem(q,2) == 0
        Q = randn(n, k+s);
        Q = A*Q;
        if q == 2
            [Q, ~, ~] = eigSVD(Q);
        else
            [Q, ~] = lu(Q);
        end
    else
        Q = randn(m, k+s);
    end
    upper = floor((q-1)/2);
    for i = 1:upper
        if i == upper
            [Q, ~, ~] = eigSVD(A*(A'*Q));
        else
            [Q, ~] = lu(A*(A'*Q));
        end
    end
    [V,S,U] = eigSVD(A'*Q);
    ind = s+1:k+s;
    U = Q*U(:, ind);
    V = V(:, ind);
    S = S(ind);
elseif mode == 2
    if rem(q,2) == 0
        Q = randn(m, k+s);
        Q = A'*Q;
        if q == 2
            [Q, ~, ~] = eigSVD(Q);
        else
            [Q, ~] = lu(Q);
        end
    else
        Q = randn(n, k+s);
    end
    upper = floor((q-1)/2);
    for i = 1:upper
        if i == upper
            [Q, ~, ~] = eigSVD(A'*(A*Q));
        else
            [Q, ~] = lu(A'*(A*Q));
        end
    end
    [U,S,V] = eigSVD(A*Q);
    ind = s+1:k+s;
    U = U(:, ind);
    V = Q*V(:, ind);
    S = S(ind);
end
end
