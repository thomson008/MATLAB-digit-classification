function my_mean = myMean(X)
    [M, ~] = size(X);
    column_sum = sum(X, 1);
    my_mean = column_sum / M;   
end

