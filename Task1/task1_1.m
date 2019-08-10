%
%
function task1_1(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
    for k = 0 : 9
        indices = find(Y == k);
        vectors = zeros(28, 28, 10);
        for s = 1:10
            i = indices(s);
            vector = reshape(X(i,:), 28, 28)';
            vectors(: ,: ,s) = vector;
        end
        figure;
        montage(vectors);
    end
end
