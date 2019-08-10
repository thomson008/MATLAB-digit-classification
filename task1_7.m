%
%
function Dmap = task1_7(MAT_ClusterCentres, MAT_M, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  MAT_ClusterCentres: MAT filename of cluster centre matrix
%  MAT_M     : MAT filename of mean vectors of (K+1)-by-D, where K is
%              the number of classes (which is 10 for the MNIST data)
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec    : 1-by-D vector (double) to specify the position of the plane
%  nbins     : scalar (integer) to specify the number of bins for each PCA axis
% Output
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.

    cmap = [0.80369089,  0.61814689,  0.46674357;
    0.81411766,  0.58274512,  0.54901962;
    0.58339103,  0.62000771,  0.79337179;
    0.83529413,  0.5584314 ,  0.77098041;
    0.77493273,  0.69831605,  0.54108421;
    0.72078433,  0.84784315,  0.30039217;
    0.96988851,  0.85064207,  0.19683199;
    0.93882353,  0.80156864,  0.4219608 ;
    0.83652442,  0.74771243,  0.61853136;
    0.7019608 ,  0.7019608 ,  0.7019608];

    load(MAT_evecs, 'EVecs');
    load(MAT_evals, 'EVals');
    load(MAT_ClusterCentres, 'C');
    load(MAT_M, 'M');

    % Find means in x and y dimensions
    mean_vector = M(11, :);
    mean_PCA = (mean_vector - posVec) * EVecs(:, 1:2);
    m_x = mean_PCA(1);
    m_y = mean_PCA(2);

    % Use eigenvalues for standard deviations
    std_x = sqrt(EVals(1));
    std_y = sqrt(EVals(2));

    % Compute the plotting range
    X_MAX = m_x + 5*std_x;
    X_MIN = m_x - 5*std_x;
    Y_MAX = m_y + 5*std_y;
    Y_MIN = m_y - 5*std_y;

    % Create a grid of points of size nbins*nbins
    Xplot = linspace(X_MIN, X_MAX, nbins)';
    Yplot = linspace(Y_MIN, Y_MAX, nbins)';
    [Xv, Yv] = meshgrid(Xplot, Yplot);
    gridX = [Xv(:), Yv(:)];
    
    % Convert the grid points to 784 dimensions
    zero_matrix = zeros(length(gridX), length(EVecs));
    zero_matrix(:, 1:2) = gridX;
    gridPC = (zero_matrix / EVecs) + posVec;
    
    % Compute distances of each point in the grid from all the cluster
    % centres
    dists = square_dist(gridPC, C);
    [~, idx] = min(dists,[], 2);
    Dmap = reshape(idx, nbins, nbins);

    figure;
    [K, ~] = size(C);
    if K == 1
        Dmap(1, 1) = Dmap(1,1) + 0.01;
    end
    
    % Plot the clusters
    [~ ,h] = contourf(Xplot, Yplot, Dmap);
    set(h,'LineColor','none');
    colormap(cmap); hold on;
    
    if K == 1
        Dmap(1, 1) = 1;
    end
    
end
