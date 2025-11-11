function RootLocus(run_rootLocus)
    
    if(~run_rootLocus)
        return;
    end
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
    
    %{
    -.0052 --- -1*10^-4
    0.0001 ---- 0.00065;
    %}
    steps = 10000;
    k3 = linspace(-.0052,-1e-4,steps);
    EiganValuesLat = zeros([3,steps]);
    EiganValuesLon = zeros([3,steps]);
    for i=1:steps
        A_long = [  0,-g,0;
                    0,0,1;
                    -k3(i)/I_x,-k2_pitch/I_x,-k1_pitch/I_x]; 
        A_lat = [
                    0,g,0;
                    0,0,1;
                    k3(i)/I_y,-k2_roll/I_y,-k1_roll/I_y];
        EiganValuesLat(:,i) = eig(A_lat);
        EiganValuesLon(:,i) = eig(A_long);
    end
    
    figure(2147483646); hold on; grid on;
    set(gcf,'Name',"Root Locus Plot Longitudinal",'NumberTitle','off');
    scatter(real(EiganValuesLon(1,:)),imag(EiganValuesLon(1,:)))
    scatter(real(EiganValuesLon(2,:)),imag(EiganValuesLon(2,:)))
    scatter(real(EiganValuesLon(3,:)),imag(EiganValuesLon(3,:)))
    title("Longitudinal Root Locus Plot")
    xlabel("Real S Plane");
    ylabel("Imaginary S Plane");
    legend("Eig 1", "Eig 2", "Eig 3");


    figure(2147483645); hold on; grid on;
    set(gcf,'Name',"Root Locus Plot Latitudinal",'NumberTitle','off');
    scatter(real(EiganValuesLat(1,:)),imag(EiganValuesLat(1,:)))
    scatter(real(EiganValuesLat(2,:)),imag(EiganValuesLat(2,:)))
    scatter(real(EiganValuesLat(3,:)),imag(EiganValuesLat(3,:)))
    title("Latitudinal Root Locus Plot")
    xlabel("Real S Plane");
    ylabel("Imaginary S Plane");
    legend("Eig 1", "Eig 2", "Eig 3");
    %plot(EiganValuesLon(2,:))
    %plot(EiganValuesLon(3,:))
    %plot(EiganValuesLat);
    
end