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

    distances = bsxfun(@plus, dot(Xtrain,Xtrain,2), dot(Xtest,Xtest,2)') - 2 * (Xtrain * Xtest');
    [~, idx] = sort(distances, 1, 'ascend');

    for j = 1 : L
        knn = Ks(j);
        idx = idx(1 : knn, :);
        Ypreds(:, j) = mode(Ytrain(idx), 1);
        if knn == 1
            Ypreds(:, j) = Ytrain(idx);
        end
    end
end
