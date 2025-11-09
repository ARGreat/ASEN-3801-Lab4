%Main for ASEN-3801 Lab 4 LabTask2
%Date: 10/14/2025
%Authors: Alex Godbout, Christopher Westerlund, Damien Wilson, Maria Cristina Sarno
%Purpose:
%Inputs:
%Outputs:

function LabTask2(run2_1and2,run2_1and5)

%Basic Variables
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

%Disturbance Array
degDist = deg2rad(5);
rotDist = 0.1;
initialCons = zeros([12,6]);
initialCons(:,1) = [0;0;-2;degDist;0;0;0;0;0;0;0;0];
initialCons(:,2) = [0;0;-2;0;degDist;0;0;0;0;0;0;0];
initialCons(:,3) = [0;0;-2;0;0;degDist;0;0;0;0;0;0];
initialCons(:,4) = [0;0;-2;0;0;0;0;0;0;rotDist;0;0];
initialCons(:,5) = [0;0;-2;0;0;0;0;0;0;0;rotDist;0];
initialCons(:,6) = [0;0;-2;0;0;0;0;0;0;0;0;rotDist];

%Figure Labels (These appear in the Figure Tab)
FigureLabels1 = ["2.1a","2.1b","2.1c","2.1d","2.1e","2.1f"];
FigureLabels5 = ["2.5a","2.5b","2.5c","2.5d","2.5e","2.5f"];

%% 2.1 Initial Condition Deviations %%
    if(run2_1and2||run2_1and5)
    for(i=1:6)
        var_0 = initialCons(:,i);
        motor_forces = m*g*[0.25;0.25;0.25;0.25];
        [time,aircraft_state_array] = ode45(@(t,aircraft_state_array) QuadrotorEOM(t, aircraft_state_array, g, m, I, d, km, nu, mu, motor_forces), [0,10],var_0);    
        %Plotting
        n = length(time);
        control_input_array = repmat(motor_forces,1,n); %Needs to be Stretched to length n for plotting
        if(run2_1and2==1)
            dispName = 'Non-Linearlized';
            fig = [2101;2102;2103;2104;2105;2106] + i*10;
            col = ["";"";"";"";"";""];
            PlotAircraftSim(time, aircraft_state_array, control_input_array,fig, col,FigureLabels1(i),dispName);
        end
        if(run2_1and5)
            if(i>3)
                dispName = 'Non-Linearlized';
                fig = [2501;2502;2503;2504;2505;2506] + i*10;
                col = ["";"";"";"";"";""];
                PlotAircraftSim(time, aircraft_state_array, control_input_array,fig, col,FigureLabels5(i),dispName);
            end
        end
    end
    end
%% 2.2 Linear EOM Deviations %%
    if(run2_1and2)
        for(i=1:6)
            var_0 = initialCons(:,i);
            motor_forces = m*g*[0.25;0.25;0.25;0.25];
        
            %No Controls
            deltaFc = [0;0;0];
            deltaGc = [0;0;0];
        
            %Run Simulation
            [time,aircraft_state_array] = ode45(@(t,aircraft_state_array) QuadrotorEOM_Linearized(t, aircraft_state_array, g, m, I, deltaFc, deltaGc), [0,10],var_0);   
        
            %Plotting
                n = length(time);
                control_input_array = repmat(motor_forces,1,n); %Needs to be Stretched to length n for plotting
                fig = [2101;2102;2103;2104;2105;2106] + i*10;
                col = ["";"";"";"";"";""];
                dispName = ['Linearized'];
                PlotAircraftSim(time, aircraft_state_array, control_input_array,fig, col,FigureLabels1(i),dispName);
         end
    end
%% 2.5 Non-Linear EOM with Control %%
    if(run2_1and5)
        for(i=4:6)
            var_0 = initialCons(:,i); %State Vector for Quadrotor in Steady Hover;
            [time,aircraft_state_array] = ode45(@(t,aircraft_state_array) QuadrotorEOMwithRateFeedback(t, aircraft_state_array, g, m, I, nu, mu, d, km), [0,10],var_0);
            
            %Plotting
            [Zc,Gc] = RotationDerivativeFeedback(aircraft_state_array',m,g);
            control_input_array = [Zc(3,:);Gc];
            fig = [2501;2502;2503;2504;2505;2506]+i*10;
            col = ["";"";"";"";"";""];
            dispName = ['Non-Linearized with Control'];
            PlotAircraftSim(time, aircraft_state_array, control_input_array,fig, col,FigureLabels5(i),dispName);
        end
    end
end