%
%
function task1_5(X, Ks)
% Input:
%  X  : M-by-D data matrix (double)
%  Ks : 1-by-L vector (integer) of the numbers of nearest neighbours
for k = Ks
    centres = X(1 : k, :);
    k
    tic;
    [C, idx, SSE] = my_kMeansClustering(X, k, centres, 100);
    toc;
    
    cname = sprintf('task1_5_c_%d.mat', k);
    idxname = sprintf('task1_5_idx_%d.mat',k);
    ssename = sprintf('task1_5_sse_%d.mat',k);
    
    save(cname, 'C');
    save(idxname, 'idx');
    save(ssename, 'SSE');

end

end
