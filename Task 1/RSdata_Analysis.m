function RSdata_analysis()

    data = load("RSdata_nocontrol.mat");
    t = data.rt_estim.time(:);
    x_data = data.rt_estim.signals.values(:,1);
    y_data = data.rt_estim.signals.values(:,2);
    z_data = data.rt_estim.signals.values(:,3);
    psi_data = data.rt_estim.signals.values(:,4);
    theta_data = data.rt_estim.signals.values(:,5);
    phi_data = data.rt_estim.signals.values(:,6);
    u_data = data.rt_estim.signals.values(:,7);
    v_data = data.rt_estim.signals.values(:,8);
    w_data = data.rt_estim.signals.values(:,9);
    p_data = data.rt_estim.signals.values(:,10);
    q_data = data.rt_estim.signals.values(:,11);
    r_data = data.rt_estim.signals.values(:,12);
    
    aircraft_state_array = [x_data, y_data, z_data, ...
                            phi_data, theta_data, psi_data, ...
                            u_data, v_data, w_data, ...
                            p_data, q_data, r_data];
    
    
    
    % figure();
    % title('Positions Over Time');
    % subplot(3,1,1);
    % plot(t,x_data);
    % xlabel('Time (s)');
    % ylabel('X Position (m)');
    % 
    % subplot(3,1,2);
    % plot(t,y_data);
    % xlabel('Time (s)');
    % ylabel('Y Position (m)');
    % 
    % subplot(3,1,3);
    % plot(t,-z_data);
    % xlabel('Time (s)');
    % ylabel('Z Position (m)');
    % 
    % 
    % figure(Theme='Light');
    % hold on;
    % grid on;
    % plot3(x_data, y_data, -z_data);
    % 
    % plot3(x_data(1), y_data(1), -z_data(1), 'r.', 'MarkerSize', 40)
    % plot3(x_data(end), y_data(end), -z_data(end), 'b.', 'MarkerSize', 40)
    % 
    % xlabel('X Posistion (m)');
    % ylabel('Y Posistion (m)');
    % zlabel('Z Posistion (m)');
    % title('3D Plot of Position Over Time')
    % legend('Trajectory', 'Start', 'End', Location='best')
    % 
    % hold off
    
    
    motor_forces = [0;0;0;0];
    n = length(t);
    control_input_array = repmat(motor_forces,1,n);
    col = ["";"";"";"";"";""];
    fig = [1501;1502;1503;1504;1505;1506];
    
    PlotAircraftSim(t, aircraft_state_array, control_input_array,fig, col,"1_5","RSdata Analysis");

end