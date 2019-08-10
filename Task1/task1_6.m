%
%
function task1_6(MAT_ClusterCentres)
% Input:
%  MAT_ClusterCentres : file name of the MAT file that contains cluster centres C.
%       
% 
    load(MAT_ClusterCentres, 'C');
    [I J] = size(C);

    vectors = zeros(28, 28, I);

    for i = 1 : I 
        vectors(:, :, i) = reshape(C(i, :), 28, 28)';
    end
    montage(vectors);
end
