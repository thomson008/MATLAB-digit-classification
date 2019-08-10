function sq_dist = square_dist(U, V)
sq_dist = bsxfun(@plus, dot(U,U,2), dot(V,V,2)') - 2 * (U * V');
end