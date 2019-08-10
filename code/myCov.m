function cov_mat = myCov(X)
    N = length(X);
    columns_mean = myMean(X);
    X_shift = bsxfun(@minus, X, columns_mean);
    cov_mat = 1/(N) * (X_shift' * X_shift);
end

