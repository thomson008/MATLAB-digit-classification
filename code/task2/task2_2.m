%
%
function Dmap = task2_2(Xtrain, Ytrain, k, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  X   : M-by-D data matrix (double)
%  k   : scalar (integer) - the number of nearest neighbours
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec    : 1-by-D vector (double) to specity the position of the plane
%  nbins     : scalar (integer) - the number of bins for each PCA axis
% Output:
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.

    load(MAT_evecs, 'EVecs');
    load(MAT_evals, 'EVals');

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
    
    % Use eigenvalues for standard deviations
    std_x = sqrt(EVals(1));
    std_y = sqrt(EVals(2));
    
    % Find means in x and y dimensions
    mean_vec = myMean(Xtrain);
    mean_vec = (mean_vec - posVec) * EVecs(:, 1:2);
    m_x = mean_vec(1);
    m_y = mean_vec(2);
    
    % Compute the plotting range
    X_MAX = m_x + 5*std_x;
    X_MIN = m_x - 5*std_x;
    Y_MAX = m_y + 5*std_y;
    Y_MIN = m_y - 5*std_y;

    % Create a grid of points of size nbins*nbins
    Xplot = linspace(X_MIN, X_MAX, nbins);
    Yplot = linspace(Y_MIN, Y_MAX, nbins);
    [Xv, Yv] = meshgrid(Xplot, Yplot);
    gridX = [Xv(:), Yv(:)];
    
    % Convert the grid points to 784 dimensions
    zero_matrix = zeros(length(gridX), length(EVecs));
    zero_matrix(:, 1:2) = gridX;
    gridPC = (zero_matrix / EVecs) + posVec;

    % Run K-nn classifier on the grid
    Dmap = run_knn_classifier(Xtrain, Ytrain, gridPC, k);  
    Dmap = reshape(Dmap, nbins, nbins);
    
    % Plot the decision boundaries
    figure;
    [~,h] = contourf(Xplot, Yplot, reshape(Dmap, length(Xplot), length(Yplot)));
    set(h,'LineColor','none');
    colormap(cmap);

end
