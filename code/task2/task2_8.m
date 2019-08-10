function task2_8(Xtrain, Ytrain, Xtest, Ytest, epsilon, L)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Xtrain : M-by-1 label vector (uint8) for Xtrain
%   Xtest  : N-by-D test data matrix (double)
%   Ytest  : N-by-1 label vector (uint8) for Xtest
%   epsilon : A scalar parameter for regularisation
%   L      : scalar (integer) of the number of Gaussian distributions per class

    K = max(Ytrain) + 1;
    for l = L
        l
        tic;
        [Ypreds, MMs, MCovs] = run_mgcs(Xtrain, Ytrain, Xtest, epsilon, l);
        toc;

        [CM, acc] = comp_confmat(Ytest, Ypreds, K);
        file_name1 = sprintf('task2_8_cm_%d.mat', l);
        save(file_name1, 'CM');

        Ms1 = MMs(1:l,:);
        Covs1 = MCovs(1:l,:,:);

        file_name2 = sprintf('task2_8_ g%d_m1.mat', l);
        file_name3 = sprintf('task2_8_g%d_cov1.mat', l);
        save(file_name2, 'Ms1');
        save(file_name3, 'Covs1');
        
        N = length(Xtest);
        Nerrs = length(find(Ypreds ~= Ytest))
        acc
    end
    
    
    
end
