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
% [x, y, z, φ, θ, ψ, u, v, w, p, q, r] [𝑍𝑍𝑐𝑐, 𝐿𝐿 𝑐𝑐, 𝑀𝑀𝑐𝑐, 𝑁𝑁𝑐𝑐]𝑇𝑇

% Intertial Position
if(fig(1) >=1)
    figure(fig(1));hold on;
    sgtitle("Inertial Positon (m) vs Time (s)")
    
    subplot(3,1,1);hold on;
    plot(time, aircraft_state_array(:,1), col(1)); ylabel('x (m)'); hold off;
    
    subplot(3,1,2);hold on;
    plot(time, aircraft_state_array(:,2), col(1)); hold on; ylabel('y (m)')
    
    subplot(3,1,3);hold on;
    plot(time, aircraft_state_array(:,3), col(1)); hold on; ylabel('z (m)'); xlabel('Time (s)');
    hold off
end
%Euler Angles
if(fig(2) >=1)
    figure(fig(2)); hold on;
    sgtitle("Euler Angles (rad) vs Time (s)")
    
    subplot(3,1,1);
    plot(time, aircraft_state_array(:,4), col(2)); hold on; ylabel('φ (rad)')
    
    subplot(3,1,2);
    plot(time, aircraft_state_array(:,5), col(2)); hold on; ylabel('θ (rad)')
    
    subplot(3,1,3);
    plot(time, aircraft_state_array(:,6), col(2)); hold on; ylabel('ψ (rad)'); xlabel('Time (s)');
    hold off
end
%Inertial Velocity
if(fig(3) >=1)
    figure(fig(3));
    sgtitle("Inertial Velocity (m/s) vs Time (s)")
    
    subplot(3,1,1);
    plot(time, aircraft_state_array(:,7), col(3)); hold on; ylabel('u (m/s)')
    
    subplot(3,1,2);
    plot(time, aircraft_state_array(:,8), col(3)); hold on; ylabel('v (m/s)')
    
    subplot(3,1,3);
    plot(time, aircraft_state_array(:,9), col(3)); hold on; ylabel('w (m/s)'); xlabel('Time (s)');
    hold off
end
%Angular Velocity
if(fig(4) >=1)
    figure(fig(4));
    sgtitle("Angular Velocity (rad/s) vs Time (s)");
    
    subplot(3,1,1);
    plot(time, aircraft_state_array(:,10), col(4)); hold on; ylabel('p (rad/s)')
    
    subplot(3,1,2);
    plot(time, aircraft_state_array(:,11), col(4)); hold on; ylabel('q (rad/s)')
    
    subplot(3,1,3);
    plot(time, aircraft_state_array(:,12), col(4)); hold on; ylabel('r (rad/s)'); xlabel('Time (s)');
    hold off
end

%Control Variables
if(fig(5) >=1)
    figure(fig(5));
    sgtitle("Control Variables (N) vs Time (s)");
    
    subplot(4,1,1);
    plot(time, control_input_array(1,:), col(5)); hold on; ylabel('Z_c (N)')
    
    subplot(4,1,2); 
    plot(time, control_input_array(2,:), col(5)); hold on; ylabel('L_c (N)')
    
    subplot(4,1,3); 
    plot(time, control_input_array(3,:), col(5)); hold on; ylabel('M_c (N)')
    
    subplot(4,1,4);
    plot(time, control_input_array(4,:), col(5)); hold on; ylabel('N_c (N)'); xlabel('Time (s)');
    hold off;
end
%3-d Path
if(fig(6) >=1)
    figure(fig(6));
    view(3);
    
    plot3(aircraft_state_array(:,1),aircraft_state_array(:,2),aircraft_state_array(:,3), col(6)); hold on;
    plot3(aircraft_state_array(1,1),aircraft_state_array(1,2),aircraft_state_array(1,3),'go', 'MarkerFaceColor', 'g'); hold on;
    plot3(aircraft_state_array(end,1),aircraft_state_array(end,2),aircraft_state_array(end,3),'ro', 'MarkerFaceColor', 'r'); hold on;
    title("3D Path");
end
end

