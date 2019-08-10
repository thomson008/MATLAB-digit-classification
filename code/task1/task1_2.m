%
%
function M = task1_2(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
% Output:
%  M : (K+1)-by-D mean vector matrix (double)
%      Note that M(K+1,:) is the mean vector of X.

    M = zeros(11, 784);
    vectors = zeros(28, 28, 11);
    
    
    for k = 0 : 9
        % Get all the vectors from class k
        class_matrix = X(Y == k, :);
         % Compute their mean
        class_mean = myMean(class_matrix);
        M(k+1, :) = class_mean;
    end

    % Compute the mean of the entire data set
    M(11, :) = myMean(X);

    for m = 1 : 11
        vectors(:, :, m) = reshape(M(m, :), 28, 28)';
    end

    figure;
    montage(vectors);
end
