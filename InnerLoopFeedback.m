function [Fc, Gc] = InnerLoopFeedback(var)
% ASEN 3801 - Lab 4 - Task 3.2

    % constants
    g   = 9.81;          % m/s^2
    m   = 0.068;         % kg
    I_x = 5.8e-5;        % kg*m^2 
    I_y = 7.2e-5;        % kg*m^2

    % Dominant-pole choices from Task 3.1: lambda1 = -2, lambda2 = -20
    k1_over_I = 22;     
    k2_over_I = 40;     

    % Roll
    k1_roll = k1_over_I * I_x;    % N·m/(rad/s)
    k2_roll = k2_over_I * I_x;    % N·m/rad

    % Pitch 
    k1_pitch = k1_over_I * I_y;   % N·m/(rad/s)
    k2_pitch = k2_over_I * I_y;   % N·m/rad

    % angular rate feedback control from 2.3
    k_r = 0.004; % N·m/(rad/s)

    % from state vector var
    phi = var(4);    % rad
    theta = var(5);    % rad
    p = var(10);   % [rad/s]
    q = var(11);   % [rad/s]
    r = var(12);   % [rad/s]

    % control force (only in z)
    Fc = [0; 0; m*g];

    % control moments (body)
    Lc = -k2_roll  * phi    - k1_roll  * p;   % roll moment
    Mc = -k2_pitch * theta  - k1_pitch * q; % pitch moment
    Nc = -k_r * r;       % yaw rate damper

    Gc = [Lc; Mc; Nc];
end
