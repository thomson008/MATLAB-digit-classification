function my_mean = myMean(X)

    [I, J] = size(X);
    my_mean = zeros (1, J);

    for i = 1 : J
        my_mean(i) = sum(X(:, i), 1) / I; 
    end
end

