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
    [M, ~] = size(Xtrain);
    K = max(Ytrain) + 1;
    Corrs = zeros(K + 1, 1);

    [EVecs, ~] = comp_pca(Xtrain);
    PC_X = Xtrain * EVecs(:, 1:2);
    
    % Compute pcc for each class
    for i = 1:K
        cov_mat = myCov(PC_X(Ytrain == i - 1, :));
        VarX = cov_mat(1, 1);
        VarY = cov_mat(2, 2);
        CovXY = cov_mat(1, 2);
        r12 = CovXY / sqrt(VarX*VarY);
        Corrs(i) = r12;
    end

    % Compute pcc for whole data set
    cov_mat = myCov(PC_X);
    VarX = cov_mat(1, 1);
    VarY = cov_mat(2, 2);
    CovXY = cov_mat(1, 2);
    r12 = CovXY / sqrt(VarX*VarY);
    Corrs(K + 1) = r12;

end
