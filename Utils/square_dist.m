function sq_dist = square_dist(U, v)
sq_dist = sum(bsxfun(@minus, U, v).^2, 2)';
end