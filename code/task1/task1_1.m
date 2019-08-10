%
%
function task1_1(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)

    % Go through all classes
    for k = 0 : 9
        % Get all the entries that belong to the given class
        indices = find(Y == k);
        vectors = zeros(28, 28, 10);
        
        % Store first ten of them in a 3D matrix
        for s = 1:10
            i = indices(s);
            vector = reshape(X(i,:), 28, 28)';
            vectors(: ,: ,s) = vector;
        end
        
        % Montage the matrix
        figure;
        montage(vectors);
    end
end
