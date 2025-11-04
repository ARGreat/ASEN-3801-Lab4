%Name: ASEN-3801 Lab 4 PlotAircaftSim.m
%Date: 10/14/2025
%Authors: Alex Godbout, Christopher Westerlund, Damien Wilson, Maria Cristina Sarno
%Inputs:

%Outputs: var_dot
function var_dot = QuadrotorEOM_Linearized(t, var, g, m, I, deltaFc, deltaGc)
    var_dot = zeros([12,1]);
    var_dot(1) = var(7);
    var_dot(2) = var(8);
    var_dot(3) = var(9);

    var_dot(4) = var(10);
    var_dot(5) = var(11);
    var_dot(6) = var(12);

    var_dot(7) = g * - var(7);
    var_dot(8) = g * var(8);
    var_dot(9) = deltaFc(3) / m;

    var_dot(10) = deltaGc(1) / I(1);
    var_dot(11) = deltaGc(2) / I(2);
    var_dot(12) = deltaGc(3) / I(3);

end
