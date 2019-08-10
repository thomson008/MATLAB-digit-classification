function [CM, acc] = comp_confmat(Ytrues, Ypreds, K)
% Input:
%   Ytrues : N-by-1 ground truth label vector
%   Ypreds : N-by-1 predicted label vector
% Output:
%   CM : K-by-K confusion matrix, where CM(i,j) is the number of samples whose target is the ith class that was classified as j
%   acc : accuracy (i.e. correct classification rate)
    N = length(Ytrues);
    CM = zeros(K, K);

    for i = 1 : K
        for j = 1 : K
            % Find the number of entries where point of class i was classified as class j
            indices = find(Ytrues == i-1 & Ypreds == j-1);
            CM(i,j) = length(indices);
        end
    end

    correct = sum(diag(CM));
    acc = correct/N;

end
