clear; clc; close all;

function [Fc, Gc] = RotationDerivativeFeedback(var, m, g)
    Fc = [0, 0, -m * g]; % N

    p = var(10); % rad/s
    q = var(11); % rad/s
    r = var(12); % rad/s

    mu = 2e-6; % N*m/(rad/s)^2

    vec = [p,q,r];
    Gc = -mu * norm(vec) * vec;


end

