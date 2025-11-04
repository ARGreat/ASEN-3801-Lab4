function [Fc, Gc] = RotationDerivativeFeedback(var, m, g)
    
    p     = var(10);
    q     = var(11);
    r     = var(12);

    Fc = [0;0;-m*g];
    Gc = -.004*[p;q;r];
end