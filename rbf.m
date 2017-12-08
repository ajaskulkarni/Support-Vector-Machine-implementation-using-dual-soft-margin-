function [dist] = rbf(x,y)
    d1 = pdist2(x,y);
    d2 = d1.^2;
    dist = exp(-0.05.*d2);
end