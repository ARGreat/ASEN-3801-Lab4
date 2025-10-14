%Name: ASEN-3801 Lab 4 PlotAircaftSim.m
%Date: 10/14/2025
%Authors: Alex Godbout, Christopher Westerlund, Damien Wilson, Maria Cristina Sarno
%Inputs:
%    length 𝑛 vector which holds the time corresponding to the 𝑛𝑛th set of variables, the 12 x 𝑛 array of
%    aircraft states, the 4 by 𝑛𝑛 array of control inputs [𝑍c, 𝐿𝑐, Mc, Nc]T, the 6 x 1 vector of figure numbers to
%    plot over, and the string col which indicates the plotting option used for every plot,
%    eg. col = 'b-'.
%Outputs:
%    The function should plot 6 figures. There should be four figures each with three subplots for the
%    inertial position, Euler angles, inertial velocity in body frame, and angular velocity, respectively.
%    There should be one figure with four subplots for each control input variable. Finally, there should be
%    one figure that shows the three-dimensional path of the aircraft, with positive height upward in the
%    figure. This figure should indicate the start (green) and finish (red) of the path with different colored
%    markers.

function PlotAircraftSim(time, aircraft_state_array, control_input_array,fig, col)

%% Simulate Flight

%Do we need to run ode45 in here or is that done in a seperate function


%% Plot Data

% Intertial Position
figure(fig(1));
title("Inertial Positon (TBA) vs Time (s)")
subplot(3,1,1);hold on;

subplot(3,1,2);hold on;

subplot(3,1,3);hold on;


%Euler Angles
figure(fig(2));
title("Euler Aangles (deg) vs Time (s)")
subplot(3,1,1);hold on;

subplot(3,1,2);hold on;

subplot(3,1,3);hold on;



%Inertial Velocity
figure(fig(3));
title("Inertial Velocity (TBA) vs Time (s)")
subplot(3,1,1);hold on;

subplot(3,1,2);hold on;

subplot(3,1,3);hold on;



%Angular Velocity
figure(fig(4));
title("Angular Velocity (deg/s) vs Time (s)");
subplot(3,1,1);hold on;

subplot(3,1,2);hold on;

subplot(3,1,3);hold on;



%Control Variables
title("Control Variables (N) vs Time (s)");
figure(fig(5));

subplot(2,2,1); hold on;

subplot(2,2,2); hold on;

subplot(2,2,3); hold on;

subplot(2,2,4); hold on;

%3-d Path
title("3D Path");
figure(fig(6)); hold on;
end

