%
%
function task2_1(Xtrain, Ytrain, Xtest, Ytest, Ks)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain
    
    K = max(Ytrain) + 1;
    for k = Ks

        k
        tic;
        Ypreds = run_knn_classifier(Xtrain, Ytrain, Xtest, k);
        toc;
        [cm, acc] = comp_confmat(Ytest, Ypreds, K);
        file_name = sprintf('task2_1_cm%d.mat', k);
        save(file_name, 'cm');
        N = length(Ytest)
        sums = sum(cm);
        total = sum(sums);
        Nerrs = total - sum(diag(cm))
        acc
    end
end
