%
%
function task1_4(EVecs)
% Input:
%  Evecs : the same format as in comp_pca.m
%
    vectors = zeros(28, 28, 10);
    for i = 1 : 10
        vector = EVecs(:, i);
        vector_r = reshape(vector * 255.0, 28, 28)';
        vectors(:, :, i) = vector_r;
    end
    figure;
    montage(vectors);
end
