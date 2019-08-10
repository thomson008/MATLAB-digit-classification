%
%
function [Centers10, Centers9, Centers8, Centers7, Centers6, Centers5, Centers4, Centers3, Centers2, Centers1, SSEs] = task1_8(Xtrain, maxIter)
%  This runs and experiment for number of clusters from 1 to 10. For every
%  number of clusters K, the experiment is repeated 10 times, every time
%  with different set of K initial cluster centres. For every experiment,
%  the final cluster centres are computed and storen in 'CentersK'
%  variable. Final SSEs for each experiment are also saved.
    
    Centers10 = zeros(10, 784, 10);
    Centers9 = zeros(9, 784, 10);
    Centers8 = zeros(8, 784, 10);
    Centers7 = zeros(7, 784, 10);
    Centers6 = zeros(6, 784, 10);
    Centers5 = zeros(5, 784, 10);
    Centers4 = zeros(4, 784, 10);
    Centers3 = zeros(3, 784, 10);
    Centers2 = zeros(2, 784, 10);
    Centers1 = zeros(1, 784, 10);
    
    SSEs = zeros(10, 10);
    
    % 10 clusters
    fprintf("Running the experiment for 10 clusters... ");
    for i = 1 : 10
        initialCentres = Xtrain(10 * i : 10 * i + 9, :);
        [C, ~, SSE] = my_kMeansClustering(Xtrain, 10, initialCentres, maxIter);
        Centers10(:, :, i) = C;
        SSEs(10, i) = SSE(maxIter + 1);
    end
    fprintf("Completed.\n");
    
    % 9 clusters
    fprintf("Running the experiment for 9 clusters... ");
    for i = 1 : 10
        initialCentres = Xtrain(9 * i : 9 * i + 8, :);
        [C, ~, SSE] = my_kMeansClustering(Xtrain, 9, initialCentres, maxIter);
        Centers9(:, :, i) = C;
        SSEs(9, i) = SSE(maxIter + 1);
    end
    fprintf("Completed.\n");
   
    % 8 clusters
    fprintf("Running the experiment for 8 clusters... ");
    for i = 1 : 10
        initialCentres = Xtrain(8 * i : 8 * i + 7, :);
        [C, ~, SSE] = my_kMeansClustering(Xtrain, 8, initialCentres, maxIter);
        Centers8(:, :, i) = C;
        SSEs(8, i) = SSE(maxIter + 1);
    end
    fprintf("Completed.\n");
    
    % 7 clusters
    fprintf("Running the experiment for 7 clusters... ");
    for i = 1 : 10
        initialCentres = Xtrain(7 * i : 7 * i + 6, :);
        [C, ~, SSE] = my_kMeansClustering(Xtrain, 7, initialCentres, maxIter);
        Centers7(:, :, i) = C;
        SSEs(7, i) = SSE(maxIter + 1);
    end
    fprintf("Completed.\n");
    
    % 6 clusters
    fprintf("Running the experiment for 6 clusters... ");
    for i = 1 : 10
        initialCentres = Xtrain(6 * i : 6 * i + 5, :);
        [C, ~, SSE] = my_kMeansClustering(Xtrain, 6, initialCentres, maxIter);
        Centers6(:, :, i) = C;
        SSEs(6, i) = SSE(maxIter + 1);
    end
    fprintf("Completed.\n");
    
    % 5 clusters
    fprintf("Running the experiment for 5 clusters... ");
    for i = 1 : 10
        initialCentres = Xtrain(5 * i : 5 * i + 4, :);
        [C, ~, SSE] = my_kMeansClustering(Xtrain, 5, initialCentres, maxIter);
        Centers5(:, :, i) = C;
        SSEs(5, i) = SSE(maxIter + 1);
    end
    fprintf("Completed.\n");
    
    % 4 clusters
    fprintf("Running the experiment for 4 clusters... ");
    for i = 1 : 10
        initialCentres = Xtrain(4 * i : 4 * i + 3, :);
        [C, ~, SSE] = my_kMeansClustering(Xtrain, 4, initialCentres, maxIter);
        Centers4(:, :, i) = C;
        SSEs(4, i) = SSE(maxIter + 1);
    end
    fprintf("Completed.\n");
    
    % 3 clusters
    fprintf("Running the experiment for 3 clusters... ");
    for i = 1 : 10
        initialCentres = Xtrain(3 * i : 3 * i + 2, :);
        [C, ~, SSE] = my_kMeansClustering(Xtrain, 3, initialCentres, maxIter);
        Centers3(:, :, i) = C;
        SSEs(3, i) = SSE(maxIter + 1);
    end
    fprintf("Completed.\n");
    
    % 2 clusters
    fprintf("Running the experiment for 2 clusters... ");
    for i = 1 : 10
        initialCentres = Xtrain(2 * i : 2 * i + 1, :);
        [C, ~, SSE] = my_kMeansClustering(Xtrain, 2, initialCentres, maxIter);
        Centers2(:, :, i) = C;
        SSEs(2, i) = SSE(maxIter + 1);
    end
    fprintf("Completed.\n");
    
    % 1 cluster
    fprintf("Running the experiment for 1 cluster... ");
    for i = 1 : 10
        initialCentres = Xtrain(i, :);
        [C, ~, SSE] = my_kMeansClustering(Xtrain, 1, initialCentres, maxIter);
        Centers1(:, :, i) = C;
        SSEs(1, i) = SSE(maxIter + 1);
    end
    fprintf("Completed.\n");
    
    % Save all the variables to .mat files
    for i = 1 : 10
        file_name = sprintf('task1_8_centers%d.mat', i);
        var_name = sprintf('Centers%d', i);
        save(file_name, var_name);
    end
    
    save('task1_8_sses.mat', 'SSEs');
end
