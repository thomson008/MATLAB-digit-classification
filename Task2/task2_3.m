%
%
function task2_3(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector for X (unit8)

    K = max(Y) + 1;
    [EVecs, ~] = comp_pca(X);

    PC_X = X * EVecs(:, 1:2);

    figure;
    for i = 1 : K
        indices = find(Y == (i-1));
        class_vectors = PC_X(indices, :);
        mu = myMean(class_vectors);
        sigma = myCov(class_vectors);

        [EVcs, EVls] = eig(sigma);
        t = linspace(0, 2 * pi, 72);
        z = (EVcs * sqrt(EVls)) * [cos(t(:))'; sin(t(:))'];
        plot(z(1, :) + mu(1), z(2, :) + mu(2));
        hold on;
        axis equal;
    end
end



