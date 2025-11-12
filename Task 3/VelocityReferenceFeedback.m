function [Fc, Gc] = VelocityReferenceFeedback(t, var,m,g,dispType)
    phi = var(4);    % rad
    theta = var(5);    % rad
    u_E = var(7);
    v_E = var(8);
    p = var(10);   % [rad/s]
    q = var(11);   % [rad/s]
    r = var(12,:);
    
    K_lon = [1.58e-3,2.88e-3,1.142e-4];
    K_lat = [1.28e-3,2.32e-3,-1.11e-4];
    
    u_Er = zeros(1,length(t));
    v_Er = zeros(1,length(t));
    
    if(dispType == 'u')
        u_Er(t<2) = 0.5;
    elseif(dispType == 'v')
        v_Er(t<2) = 0.5;
    end

    Lc = -K_lon(1)*p -K_lon(2)*phi + K_lon(3)*(v_Er-v_E);
    Mc = -K_lat(1)*q -K_lat(2)*theta + K_lat(3)*(u_Er-u_E);
    
    Fc = [0;0;m*g];
    Fc = repmat(Fc,1,length(t));
    Gc = [Lc;Mc;-0.004*r];

end
