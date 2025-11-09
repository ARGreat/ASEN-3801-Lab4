function [Fc, Gc] = VelocityReferenceFeedback(t, var)
    phi = var(4);    % rad
    theta = var(5);    % rad
    u_E = var(7);
    v_E = var(8);
    p = var(10);   % [rad/s]
    q = var(11);   % [rad/s]
    r = var(12);
    
    K_lon = [1,2,.001];
    K_lat = [1,2,-.001];
    
    
    if(t <2)
        u_Er = 0.5;
        v_Er = 0.5;
    else
        u_Er = 0;
        v_Er = 0;
    end
    
    Lc = -K_lon(1)*p -K_lon(2)*phi + K_lon(3)*(v_Er-v_E);
    Mc = -K_lat(1)*q -K_lat(2)*theta + K_lat(3)*(u_Er-u_E);
    
    Fc = [0;0;m*g];
    Gc = [Lc,Mc,-0.004*r];

end
