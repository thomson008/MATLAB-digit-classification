function [Ypreds] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector (uint8) for Xtrain
%   Xtest  : N-by-D test data matrix (double)
%   Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain
% Output:
%   Ypreds : N-by-L matrix (uint8) of predicted labels for Xtest

    N = size(Xtest, 1);
    L = length(Ks);
    Ypreds = zeros(N, L);
    
    % Compute and sort pairwise distances between training data and test
    % data
    distances = square_dist(Xtrain, Xtest);
    [~, idx] = sort(distances, 1, 'ascend');
    
    % For every number of k-nearest neighbours, find the k closest entries
    % from Xtrain and assign a label to each test point
    for j = 1 : L
        knn = Ks(j);
        idx = idx(1 : knn, :);
        Ypreds(:, j) = mode(Ytrain(idx), 1);
        if knn == 1
            Ypreds(:, j) = Ytrain(idx);
        end
    end
end
