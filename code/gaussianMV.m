function y = gaussianMV(mu, covar, X)
    [n, d] = size(X);
    invcov = inv(covar);
    mu = reshape(mu, 1, d);
    X = X - ones(n, 1) * mu;
    fact = sum(((X * invcov) .* X), 2);
    y = (-d/2) * log(2*pi) - 0.5 *  logdet(covar) - 0.5 * fact;
end