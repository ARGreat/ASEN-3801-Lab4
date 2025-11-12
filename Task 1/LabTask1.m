%Main for ASEN-3801 Lab 4 LabTask1
%Date: 10/14/2025
%Authors: Alex Godbout, Christopher Westerlund, Damien Wilson, Maria Cristina Sarno
%Purpose: Give a concise location to place all Lab1 Content
%Inputs: RSdata_nocontrol.mat
%Outputs:
function LabTask1(run1_2,run1_3,run1_4)

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

%% 1.2 Run QuadrotorEOM for Aircraft in Steady Hover without Aero Forces

if(run1_2 ==1)
    var_0 = [0;0;-2;0;0;0;0;0;0;0;0;0]; %State Vector for Quadrotor in Steady Hover;
    motor_forces = m*g*[0.25;0.25;0.25;0.25];
    [time,aircraft_state_array] = ode45(@(t,aircraft_state_array) QuadrotorEOM(t, aircraft_state_array, g, m, I, d, km, nu, mu, motor_forces), [0,10],var_0);
    
    %Set up for Plotting
    n = length(time);
    control_input_array = repmat([m*g;0;0;0],1,n); %Needs to be Stretched to length n for plotting
    fig = [11;12;13;14;15;16];
    col = ["";"";"";"";"";""];
    PlotAircraftSim(time, aircraft_state_array, control_input_array,fig, col,"1.2","Quadrotor EOM no Aero Forces");
end
%% 1.3 Run Quadrotor EOM with Aero Forces
if(run1_3 == 1)
    %Repeat 1.2 but now QuadrotorEOM should have Aero Foces
    var_0 = [0;0;-2;0;0;0;0;0;0;0;0;0]; %State Vector for Quadrotor in Steady Hover;
    motor_forces = m*g*[0.25;0.25;0.25;0.25];
    [time,aircraft_state_array] = ode45(@(t,aircraft_state_array) QuadrotorEOM(t, aircraft_state_array, g, m, I, d, km, nu, mu, motor_forces), [0,10],var_0);
    
    %Set up For Plotting
    n = length(time);
    control_input_array = repmat([m*g;0;0;0],1,n); %Needs to be Stretched to length n for plotting
    fig = [21;22;23;24;25;26];
    col = ["";"";"";"";"";""];
    PlotAircraftSim(time, aircraft_state_array, control_input_array,fig, col,"1.3","Quadrotor EOM with Aero Forces")
end
%% 1.4 Run Quadrotor EOM while traveling 5m/s East;
if(run1_4 == 1)
    %Calculating Trim Cons for 1.4
    phi = atan((nu * 5^2) / (m * g));
    fc = (m * g) / cos(phi) / 4;
    
    %Not yawed
        var_0 = [0;0;-2;phi;0;0;0;5*cos(phi);-sin(phi)*5;0;0;0]; %State Vector for Quadrotor in Steady Hover;
        motor_forces = [fc;fc;fc;fc];
        [time,aircraft_state_array] = ode45(@(t,aircraft_state_array) QuadrotorEOM(t, aircraft_state_array, g, m, I, d, km, nu, mu, motor_forces), [0,10],var_0);
    
        % up For Plotting
        n = length(time);
        control_input_array = repmat([fc*4;0;0;0],1,n); %Needs to be Stretched to length n for plotting
        fig = [31;32;33;34;35;36];
        col = ["";"";"";"";"";""];
        PlotAircraftSim(time, aircraft_state_array, control_input_array,fig, col,"1.4 (No Yaw)","Quadrotor EOM 5m/s East")

    %yawed      [x,y, z,φ,  θ,   ψ,         u,v,          w,p,q,r]
        var_0 = [0;0;-2;0;-phi;pi/2;5*cos(phi);0;-5*sin(phi);0;0;0]; %State Vector for Quadrotor in Steady Hover;
        motor_forces = [fc;fc;fc;fc];
        [time,aircraft_state_array] = ode45(@(t,aircraft_state_array) QuadrotorEOM(t, aircraft_state_array, g, m, I, d, km, nu, mu, motor_forces), [0,10],var_0);
    
        % up For Plotting
        n = length(time);
        control_input_array = repmat([fc*4;0;0;0],1,n); %Needs to be Stretched to length n for plotting
        fig = [41;42;43;44;45;46];
        col = ["";"";"";"";"";""];
        PlotAircraftSim(time, aircraft_state_array, control_input_array,fig, col,"1.4 (Yaw)","Quadrotor EOM 5m/s East")
end

%% 1.5 Plot PARROT Data
RSdata_Analysis();



end