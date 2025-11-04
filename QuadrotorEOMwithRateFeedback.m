function var_dot = QuadrotorEOMwithRateFeedback(t, var, g, m, I, nu, mu, d, km)
    %Expand Moment of Inertia vecotr
    x_E   = var(1);
    y_E   = var(2);
    z_E   = var(3);
    phi   = var(4);
    theta = var(5);
    psi   = var(6);
    u_E   = var(7);
    v_E   = var(8);
    w_E   = var(9);
    p     = var(10);
    q     = var(11);
    r     = var(12);
    I_x = I(1);
    I_y = I(2);
    I_z = I(3);
    
    %Caculate Control Forces
    [Fc, Gc] = RotationDerivativeFeedback(var, m, g);
    motor_forces = ComputeMotorForces(Fc, Gc, d, km);

    f1 = motor_forces(1);
    f2 = motor_forces(2);
    f3 = motor_forces(3);
    f4 = motor_forces(4);

    %Calculate Control Forces
    Z_c = -f1 - f2 - f3 - f4;
    L_c = (d/sqrt(2)) * (-f1 - f2 + f3 + f4);
    M_c = (d/sqrt(2)) * (f1 - f2 - f3 + f4);
    N_c = km * (f1 - f2 + f3 - f4);
    
    %Calulate Drag Forces and moment
    V_a = sqrt(u_E^2+v_E^2+w_E^2);
    X=-nu*V_a*u_E;
    Y=-nu*V_a*v_E;
    Z=-nu*V_a*w_E;

    L = -mu*sqrt(p^2+q^2+r^2)*p;
    M = -mu*sqrt(p^2+q^2+r^2)*q;
    N = -mu*sqrt(p^2+q^2+r^2)*r;
    
    %Rotation Matrix for our Position Derivatives
    R_x =[1 0 0;
         0 cos(phi) sin(phi);
         0 -sin(phi) cos(phi)];
    R_y =[cos(theta) 0 -sin(theta);
          0 1 0;
          sin(theta) 0 cos(theta)];
    R_z =[cos(psi) sin(psi) 0;
          -sin(psi) cos(psi) 0;
          0 0 1];
    EB = R_x*R_y*R_z;

    %rotation matrix from intertial to body;
    
    Pos_dot = EB'*[u_E;v_E;w_E];
    x_E_dot = Pos_dot(1);
    y_E_dot = Pos_dot(2);
    z_E_dot = Pos_dot(3);

    phi_dot = p + q*sin(phi)*tan(theta)+r*cos(phi)*tan(theta);
    theta_dot = q*cos(phi) - r*sin(phi);
    psi_dot = q*sin(phi)*sec(theta) + r*cos(phi)*sec(theta);
    
    u_E_dot = (r*v_E-q*w_E) + g*(-sin(theta)) + X/m;
    v_E_dot = (p*w_E-r*u_E) + g*(cos(theta)*sin(phi)) + Y/m;
    w_E_dot = (q*u_E-p*v_E) + g*(cos(theta)*cos(phi)) + (Z+Z_c)/m;
    
    p_dot = (I_y-I_z)/I_x*q*r + (L+L_c)/I_z;
    q_dot = (I_z-I_x)/I_y*p*r + (M+M_c)/I_y;
    r_dot = (I_x-I_y)/I_z*p*q + (N+N_c)/I_z;
    
    var_dot =  [x_E_dot;y_E_dot;z_E_dot;
                phi_dot;theta_dot;psi_dot;
                u_E_dot;v_E_dot;w_E_dot;
                p_dot;q_dot;r_dot];

end