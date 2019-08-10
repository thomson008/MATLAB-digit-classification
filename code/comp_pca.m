function [EVecs, EVals] = comp_pca(X)
% Input: 
%   X:  N x D matrix (double)
% Output: 
%   EVecs: D-by-D matrix (double) contains all eigenvectors as columns
%       NB: follow the Task 1.3 specifications on eigenvectors.
%   EVals:
%       Eigenvalues in descending order, D x 1 vector (double)
%   (Note that the i-th columns of Evecs should corresponds to the i-th element in EVals)
    
    % Compute covariance matrix
    cov_mat = myCov(X);
    
    % Get principal components and eigenvalues
    [PC, V] = eig(cov_mat);
    V = diag(V);
    
    % Sort eigenvectors in decreasing order
    [~, ridx] = sort(V, 1, 'descend');
    EVals = V(ridx);
    EVecs = PC(:, ridx);

    % Flip the eigenvectors that have a negative number in first element
    for i = 1 : length(EVals)
        if EVecs(1, i) < 0
            EVecs(:, i) = EVecs(:, i) .* (-1);
        end
    end
end

