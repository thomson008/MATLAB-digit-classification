function [Ypreds, Ms, Covs] = run_gaussian_classifiers(Xtrain, Ytrain, Xtest, epsilon)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector for Xtrain (uint8)
%   Xtest  : N-by-D test data matrix (double)
%   epsilon : A scalar variable (double) for covariance regularisation
% Output:
%  Ypreds : N-by-1 matrix (uint8) of predicted labels for Xtest
%  Ms     : K-by-D matrix (double) of mean vectors
%  Covs   : K-by-D-by-D 3D array (double) of covariance matrices

%YourCode - Bayes classification with multivariate Gaussian distributions.
    K = max(Ytrain) + 1;
    [M, D] = size(Xtrain);
    Ms = zeros(K, D);
    Covs = zeros(K, D, D);
    N = length(Xtest);
    test_prob = zeros(N, K);
    
    
    for i = 1 : K
        indices = find(Ytrain == i-1);
        class_vectors = Xtrain(indices, :);
        
        % Get the parameters for Gaussian distribution for each class
        m = myMean(class_vectors);
        Ms(i, :) = m;
        cov_mat = myCov(class_vectors);
        I = eye(D);
        cov_mat = cov_mat + epsilon * I;
        Covs(i, :, :) = cov_mat;
        
        % Compute the log likelihood for each test point being classified
        % as class K
        prior = log(length(indices) / M);
        lik_i = gaussianMV(m, cov_mat, Xtest);
        test_prob(:, i) = lik_i + prior;
    end
    
    % Assign each test point to the class with greatest probability
    [~, Ypreds] = max(test_prob, [], 2);
    Ypreds = Ypreds - 1;
    
end
