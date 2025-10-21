%Main for ASEN-3801 Lab 4 LabTask2
%Date: 10/14/2025
%Authors: Alex Godbout, Christopher Westerlund, Damien Wilson, Maria Cristina Sarno
%Purpose:
%Inputs:
%Outputs:

function LabTask2

%% Basic Variables

g = 9.81; %m/s^2
m = 0.068; %kg
d = 0.06; %m
km = 0.0024; %N*m/N
I_x = 5.8*10^(-5); %kgm^2
I_y = 7.2*10^(-5); %kgm^2
I_z = 1*10^(-4); %kgm^2
I = [I_x;I_y;I_z];
nu = 1*10^(-3); %N/(m/s)^2
mu = 2*10^(-6); %N*m/(rad/s)^2

%% 2.1 Initial Condition Deviations %%
%a
degDist = 5*pi/180;
rotDist = 0.1*pi/180;
var_0 = [0;0;-2;degDist;0;0;0;0;0;0;0;0]; %State Vector for Quadrotor in Steady Hover;
motor_forces = m*g*[0.25;0.25;0.25;0.25];
[time,aircraft_state_array] = ode45(@(t,aircraft_state_array) QuadrotorEOM(t, aircraft_state_array, g, m, I, d, km, nu, mu, motor_forces), [0,10],var_0);

%Plotting
n = length(time);
control_input_array = repmat(motor_forces,1,n); %Needs to be Stretched to length n for plotting
fig = [2111;2112;-2113;-2114;-2115;-2116];
col = ["";"";"";"";"";""];
PlotAircraftSim(time, aircraft_state_array, control_input_array,fig, col);

%b

var_0 = [0;0;-2;0;degDist;0;0;0;0;0;0;0]; %State Vector for Quadrotor in Steady Hover;
motor_forces = m*g*[0.25;0.25;0.25;0.25];
[time,aircraft_state_array] = ode45(@(t,aircraft_state_array) QuadrotorEOM(t, aircraft_state_array, g, m, I, d, km, nu, mu, motor_forces), [0,10],var_0);

%Plotting
n = length(time);
control_input_array = repmat(motor_forces,1,n); %Needs to be Stretched to length n for plotting
fig = [2121;2122;-2123;-2124;-2125;-2126];
col = ["";"";"";"";"";""];
PlotAircraftSim(time, aircraft_state_array, control_input_array,fig, col);


%c

var_0 = [0;0;-2;0;0;degDist;0;0;0;0;0;0]; %State Vector for Quadrotor in Steady Hover;
motor_forces = m*g*[0.25;0.25;0.25;0.25];
[time,aircraft_state_array] = ode45(@(t,aircraft_state_array) QuadrotorEOM(t, aircraft_state_array, g, m, I, d, km, nu, mu, motor_forces), [0,10],var_0);

%Plotting
n = length(time);
control_input_array = repmat(motor_forces,1,n); %Needs to be Stretched to length n for plotting
fig = [2131;2132;-2133;-2134;-2135;-2136];
col = ["";"";"";"";"";""];
PlotAircraftSim(time, aircraft_state_array, control_input_array,fig, col);


%d

var_0 = [0;0;-2;0;0;0;0;0;0;rotDist;0;0]; %State Vector for Quadrotor in Steady Hover;
motor_forces = m*g*[0.25;0.25;0.25;0.25];
[time,aircraft_state_array] = ode45(@(t,aircraft_state_array) QuadrotorEOM(t, aircraft_state_array, g, m, I, d, km, nu, mu, motor_forces), [0,10],var_0);

%Plotting
n = length(time);
control_input_array = repmat(motor_forces,1,n); %Needs to be Stretched to length n for plotting
fig = [2141;2142;-2143;-2144;-2145;-2146];
col = ["";"";"";"";"";""];
PlotAircraftSim(time, aircraft_state_array, control_input_array,fig, col);


%e

var_0 = [0;0;-2;0;0;0;0;0;0;0;rotDist;0]; %State Vector for Quadrotor in Steady Hover;
motor_forces = m*g*[0.25;0.25;0.25;0.25];
[time,aircraft_state_array] = ode45(@(t,aircraft_state_array) QuadrotorEOM(t, aircraft_state_array, g, m, I, d, km, nu, mu, motor_forces), [0,10],var_0);

%Plotting
n = length(time);
control_input_array = repmat(motor_forces,1,n); %Needs to be Stretched to length n for plotting
fig = [2151;2152;-2153;-2154;-2155;-2156];
col = ["";"";"";"";"";""];
PlotAircraftSim(time, aircraft_state_array, control_input_array,fig, col);


%f

var_0 = [0;0;-2;0;0;0;0;0;0;0;0;rotDist]; %State Vector for Quadrotor in Steady Hover;
motor_forces = m*g*[0.25;0.25;0.25;0.25];
[time,aircraft_state_array] = ode45(@(t,aircraft_state_array) QuadrotorEOM(t, aircraft_state_array, g, m, I, d, km, nu, mu, motor_forces), [0,10],var_0);

%Plotting
n = length(time);
control_input_array = repmat(motor_forces,1,n); %Needs to be Stretched to length n for plotting
fig = [2161;2162;-2163;-2164;-2165;-2166];
col = ["";"";"";"";"";""];
PlotAircraftSim(time, aircraft_state_array, control_input_array,fig, col);


end
