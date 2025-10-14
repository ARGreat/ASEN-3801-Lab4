%Name: ASEN-3801 Lab 4 QuadrotorEOM.m
%Date: 10/14/2025
%Authors: Alex Godbout, Christopher Westerlund, Damien Wilson, Maria Cristina Sarno
%Inputs:
%    t is time; var is the 12 x
%    1 aircraft state vector; g is the acceleration due to gravity; m is mass; I is the inertia matrix; d, km,
%    nu, and mu are the remaining quadrotor parameters; motor_forces = [f1; f2; f3; f4] is
%    the 4 x 1 vector of motor forces, and var_dot is the 12 x 1 derivative of the state vector. Include
%    attitude dynamics and kinematics using the Euler angle attitude representation
%Outputs: 

function var_dot = QuadrotorEOM(t, var, g, m, I, d, km, nu, mu, motor_forces)
% trim thrust for the rotors in steady hovering flight
% F = m*g; in main?? 
% f = F/4; in main?

ControlForces = B*motor_forces;

Z_c = -f1 - f2 - f3 - f4;
L_c = (d/sqrt(2)) * (-f1 - f2 + f3 + f4);
M_c = (d/sqrt(2)) * (f1 - f2 - f3 + f4);
N_c = km * (f1 - f2 + f3 - f4);




%Alex Begins Working


r_dot = 

% simulate this trim state for 10 secs and verify that it produces equilibrium motion
% use ode45
tspan = [0 10];
initial_conditions = var;
[t_out, var_out] = ode45(@t,var) QuadrotorEOM(t, var, g, m, I, d, km, nu, mu, motor_forces), tspan, initial_conditions);



end
