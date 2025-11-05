%Main for ASEN-3801 Lab 4 LabTask3
%Date: 10/14/2025
%Authors: Alex Godbout, Christopher Westerlund, Damien Wilson, Maria Cristina Sarno
%Purpose: 
%Inputs: 
%Outputs:

 clc; clear all; close all;
 
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
I_mat = diag([I_x I_y I_z]);


%% 3.1

lambda1 = -(1/0.5);      % tau = 0.5 s
lambda2 = -(1/0.05);     % 10x faster tau = 0.05 s

% ks
k1_over_I  = -(lambda1 + lambda2);  
k2_over_I =  (lambda1 * lambda2);  

% gains 
k1_roll = k1_over_I * I_x;     % N*m/(rad/s)
k2_roll    = k2_over_I * I_x;    

k1_pitch = k1_over_I * I_y;   
k2_pitch   = k2_over_I * I_y;  

% angular rate feedback control from 2.3
k_r = 0.004

% A matrices 
Aroll  = [0 1; -k2_roll/I_x   -k1_roll/I_x];
Apitch = [0 1; -k2_pitch/I_y -k1_pitch/I_y];

%eigenvalues
eig_roll  = eig(Aroll)   
eig_pitch = eig(Apitch)  


%% 3.2 function innerloopfeedback

%% 3.3 

tspan = [0 10];

var0  = zeros(12,1); 

% initial conditions
    x_roll  = var0;  x_roll(4)  = deg2rad(5);    % +5 deg roll
    x_pitch = var0;  x_pitch(5) = deg2rad(5);    % +5 deg pitch
    x_pdot  = var0;  x_pdot(10) = 0.1;           % +0.1 rad/s roll rate
    x_qdot  = var0;  x_qdot(11) = 0.1;           % +0.1 rad/s pitch rate

    % initial conditions in struct
    cases = {
      struct('name','(a) +5° roll'         ,'x0', x_roll  ,'col',"b-")
      struct('name','(b) +5° pitch'        ,'x0', x_pitch ,'col',"r-")
      struct('name','(c) +0.1 rad/s roll rate','x0', x_pdot ,'col',"g-")
      struct('name','(d) +0.1 rad/s pitch rate','x0', x_qdot,'col',"m-")
    };

    %ode
    for k = 1:numel(cases)
        C = cases{k};
        fprintf('\nSimulating %s...\n', C.name);

        odefun = @(t,x) QuadrotorEOMLinearizedControlLaw(t, x, g, m, I_mat);
        [time, Y] = ode45(odefun, tspan, C.x0);
        Y = Y.';  n = numel(time);

        Fc = zeros(3,n);  Gc = zeros(3,n);
        for i = 1:n
            [Fc(:,i), Gc(:,i)] = InnerLoopFeedback(Y(:,i));
        end

      %plot
        figure(k); clf;
        subplot(4,1,1)
        plot(time, Y(4,:)*180/pi, 'b', time, Y(5,:)*180/pi, 'r', 'LineWidth',1.2);
        ylabel('\phi, \theta [deg]'); legend('\phi','\theta');
        title(['Attitude Angles – ' C.name]);

        subplot(4,1,2)
        plot(time, Y(10,:), 'b', time, Y(11,:), 'r', 'LineWidth',1.2);
        ylabel('p, q [rad/s]'); legend('p','q');
        title('Angular Rates');

        subplot(4,1,3)
        plot(time, Y(7,:), 'b', time, Y(8,:), 'r', 'LineWidth',1.2);
        ylabel('u, v [m/s]'); legend('u','v');
        title('Body Velocities');

        subplot(4,1,4)
        plot(time, Y(1,:), 'b', time, Y(2,:), 'r', 'LineWidth',1.2);
        xlabel('Time [s]'); ylabel('x_E, y_E [m]'); legend('x_E','y_E');
        title('Inertial Positions');

        % Control Forces and Moments
        figure(k+10); clf;
        subplot(4,1,1)
        plot(time, Fc(3,:), 'k', 'LineWidth',1.2);
        ylabel('Z_c [N]'); title(['Control Forces/Moments – ' C.name]);

        subplot(4,1,2)
        plot(time, Gc(1,:), 'b', 'LineWidth',1.2);
        ylabel('L_c [N·m]');

        subplot(4,1,3)
        plot(time, Gc(2,:), 'r', 'LineWidth',1.2);
        ylabel('M_c [N·m]');

        subplot(4,1,4)
        plot(time, Gc(3,:), 'g', 'LineWidth',1.2);
        xlabel('Time [s]'); ylabel('N_c [N·m]');
    end
