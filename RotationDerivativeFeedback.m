function [Fc, Gc] = RotationDerivativeFeedback(var, m, g)
    
    p     = var(10,:);
    q     = var(11,:);
    r     = var(12,:);
    n = length(var(1,:));
    
    Fc = repmat([0;0;-m*g],1,n);
    Gc = -.004*[p;q;r];
end