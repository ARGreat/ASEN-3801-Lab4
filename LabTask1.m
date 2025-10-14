%Main for ASEN-3801 Lab 4 LabTask1
%Date: 10/14/2025
%Authors: Alex Godbout, Christopher Westerlund, Damien Wilson, Maria Cristina Sarno
%Purpose: Give a concise location to place all Lab1 Content
%Inputs: RSdata_nocontrol.mat
%Outputs:


function LabTask1

%% Basic Variables

g = 9.81; %m/s^2
m = 0.068; %kg
d = 0.06; %m
km = 0.0024; %N*m/N
I_x = 5.8*10^(-5); %kgm^2
I_y = 7.2*10^(-5); %kgm^2
I_z = 1*10^4; %kgm^2
I = [I_x;I_y;I_z];
nu = 1*10^(-3); %N/(m/s)^2
mu = 2*10^(-6); %N*m/(rad/s)^2

phi = atan((nu * 5^2) / (m * g))
Zc = (m * g) / cos(phi)


%% 1.2 Run QuadrotorEOM for Aircraft in Steady Hover without Aero Forces

var_0 = [0;0;-2;0;0;0;0;0;0;0;0;0]; %State Vector for Quadrotor in Steady Hover;
motor_forces = m*g*[0.25;0.25;0.25;0.25];
[time,aircraft_state_array] = ode45(@(t,aircraft_state_array) QuadrotorEOM(t, aircraft_state_array, g, m, I, d, km, nu, mu, motor_forces), [0,10],var_0);

%Set 

PlotAircraftSim(time,aircraft_state_array);

%% 1.3 Run Quadrotor EOM with Aero Forces


%% Repeat 1.2 but now QuadrotorEOM should have Aero Foces
var_0 = [0;0;-2;0;0;0;0;0;0;0;0;0]; %State Vector for Quadrotor in Steady Hover;
motor_forces = m*g*[0.25;0.25;0.25;0.25];
[t,var] = ode45(@(t,var) QuadrotorEOM(t, var, g, m, I, d, km, nu, mu, motor_forces), [0,10],var_0)

%% 1.4 Run Quadrotor EOM while traveling 5m/s East;
var_0 = [0;0;-2;0;0;0;0;0;0;0;0;0]; %State Vector for Quadrotor in Steady Hover;
motor_forces = m*g*[0.25;0.25;0.25;0.25];
[t,var] = ode45(@(t,var) QuadrotorEOM(t, var, g, m, I, d, km, nu, mu, motor_forces), [0,10],var_0)

end