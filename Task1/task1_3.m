%
%
function [EVecs, EVals, CumVar, MinDims] = task1_3(X)
% Input:
%  X : M-by-D data matrix (double)
% Output:
%  EVecs, Evals: same as in comp_pca.m
%  CumVar  : D-by-1 vector (double) of cumulative variance
%  MinDims : 4-by-1 vector (integer) of the minimum number of PCA dimensions
%            to cover 70%, 80%, 90%, and 95% of the total variance.

    [EVecs, EVals] = comp_pca(X);
    CumVar = cumsum(EVals);
    figure;
    grid on;
    hold on;
    xlabel('No. of dimensions');
    ylabel('Cumulative variance');
    title('Plot of cumulative variances');
    plot(CumVar);
    PerCumVar = (CumVar / sum(EVals)) * 100;

    MinDims = zeros(4, 1);

    for i = 1 : length(EVals)
        if PerCumVar(i) >= 95 && MinDims(4) == 0
            MinDims(4) = i;
        elseif PerCumVar(i) >= 90 && MinDims(3) == 0
            MinDims(3) = i;
        elseif PerCumVar(i) >= 80 && MinDims(2) == 0
            MinDims(2) = i;
        elseif PerCumVar(i) >= 70 && MinDims(1) == 0
            MinDims(1) = i;
        end 
    end
end
