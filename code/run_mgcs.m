function [Ypreds, MMs, MCovs] = run_mgcs(Xtrain, Ytrain, Xtest, epsilon, L)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector for Xtrain (uint8)
%   Xtest  : N-by-D test data matrix (double)
%   epsilon : A scalar parameter for regularisation (double)
%   L      : scalar (integer) of the number of Gaussian distributions per class
% Output:
%  Ypreds : N-by-1 matrix of predicted labels for Xtest (integer)
%  MMs     : (L*K)-by-D matrix of mean vectors (double)
%  MCovs   : (L*K)-by-D-by-D 3D array of covariance matrices (double)
     K = max(Ytrain) + 1;
    [M, D] = size(Xtrain);
    MMs = zeros(L*K, D);
    MCovs = zeros(L*K, D, D);
    N = length(Xtest);
    test_prob = zeros(N, K, L);

    for i = 1 : K
        indices = find(Ytrain == i-1);
        class_vectors = Xtrain(indices, :);
        initialCentres = class_vectors(1 : L, :);
        prior = log(length(indices) / M);
        
        % Apply k-means clustering to divide each class into L clusters
        [~, idx, ~] = my_kMeansClustering(class_vectors, L, initialCentres);
        
        for j = 1 : L
            cluster_vectors = class_vectors(idx == j, :);
            
            % Get the parameters for Gaussian distribution for each cluster
            % in class K
            m_c = myMean(cluster_vectors);
            MMs((i-1)*L + j, :) = m_c;
            
            cov_mat = myCov(cluster_vectors);
            I = eye(D);
            cov_mat = cov_mat + epsilon*I;
            MCovs((i-1)*L + j, :, :) = cov_mat;
            
            % Compute the log likelihood for each test point being classified
            % as class K for different clusters
            lik_ij = gaussianMV(m_c, cov_mat, Xtest);
            test_prob(:, i, j) = lik_ij + prior;
        end
    end
    
    % Assign each test point to the class with greatest probability
    class_probs = max(test_prob, [], 3);
    [~, Ypreds] = max(class_probs, [], 2);
    Ypreds = Ypreds - 1;
             
end
