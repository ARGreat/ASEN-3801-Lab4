clear; clc; close all;

function motor_forces = ComputeMotorForces(Fc, Gc, d, km)
    matrix = [-1, -1, -1, -1; 
        -d/sqrt(2), -d/sqrt(2), d/sqrt(2), d/sqrt(2);
        d/sqrt(2), -d/sqrt(2), -d/sqrt(2), d/sqrt(2);
        km, -km, km, -km];

    vec = [Fc(3); Gc(1); Gc(2); Gc(3)];

    motor_forces = matrix^-1 * vec;



end