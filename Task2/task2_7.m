%
%
function [CM, acc] = task2_7(Xtrain, Ytrain, Xtest, Ytest, epsilon, ratio)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  ratio  : scalar (double) - ratio of training data to use.
% Output:
%  CM     : K-by-K matrix (integer) of confusion matrix
%  acc    : scalar (double) of correct classification rate
    K = max(Ytrain) + 1;
    [M, ~] = size(Xtrain);
    Xtrain = Xtrain(1:uint8(ratio * M), :);
    Ytrain = Ytrain(1:uint8(ratio * M), :);

    [Ypreds, ~, ~] = run_gaussian_classifiers(Xtrain, Ytrain, Xtest, epsilon);
    [CM, acc] = comp_confmat(Ytest, Ypreds, K);
end
