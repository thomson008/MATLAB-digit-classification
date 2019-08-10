%
%
function [Corrs] = task2_4(Xtrain, Ytrain)
% Input:
%  Xtrain : M-by-D data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for X
% Output:
%  Corrs  : (K+1)-by-1 vector (double) of correlation $r_{12}$ 
%           for each class k = 1,...,K, and the last element holds the
%           correlation for the whole data, i.e. Xtrain.

    K = max(Ytrain) + 1;
    Corrs = zeros(K + 1, 1);

    [EVecs, EVals] = comp_pca(Xtrain);
    PC_X = Xtrain * EVecs(:, 1:2);

    for i = 1 : K
        indices = find(Ytrain == i - 1);
        class_vectors = PC_X(indices, :);
        vectors_zscore = zscore(class_vectors, 0, 1);
        product = prod(vectors_zscore, 2);
        sum_of_products = sum(product);
        r12 = sum_of_products / (length(indices) - 1);
        Corrs(i) = r12;
    end

    X_zscore = zscore(PC_X, 0, 1);
    product = prod(X_zscore, 2);
    sum_of_products = sum(product);
    r12 = sum_of_products / length(Xtrain);
    Corrs(K+1) = r12;

end
