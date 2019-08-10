%
%
function [C, idx, SSE] = my_kMeansClustering(X, k, initialCentres, maxIter)
% Input
%   X : N-by-D matrix (double) of input sample data
%   k : scalar (integer) - the number of clusters
%   initialCentres : k-by-D matrix (double) of initial cluster centres
%   maxIter  : scalar (integer) - the maximum number of iterations
% Output
%   C   : k-by-D matrix (double) of cluster centres
%   idx : N-by-1 vector (integer) of cluster index table
%   SSE : (L+1)-by-1 vector (double) of sum-squared-errors
  
  if nargin < 4
    maxIter = 500;
  end
  
  C = initialCentres;
  SSE = zeros(maxIter + 1, 1);
  [N, ~] = size(X);
  D = zeros(k, N);
  
  for i = 1 : maxIter

      D = bsxfun(@plus, dot(X,X,2), dot(C,C,2)') - 2 * (X * C');
     
      [dst, idx] = min(D, [], 2);
      SSE(i) = sum(dst) / N;
      
      prev_C = C;
      for c = 1 : k 
          if (sum(idx == c) ~= 0)
             C(c, :) = myMean(X(idx == c, :));
          end
      end
      
      if prev_C == C
          break;
      end
      
  end
  
  D = bsxfun(@plus, dot(X,X,2), dot(C,C,2)') - 2 * (X * C');
  
  [dst, ~] = min(D, [], 2);
  SSE(maxIter + 1) = sum(dst) / N;
  
end
