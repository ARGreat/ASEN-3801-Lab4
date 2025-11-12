function vardot = EOM2mDisp(t, var, g, m, I,d,km,nu,mu,dispType)
    [Fc, Gc] = VelocityReferenceFeedback(t, var,m,g,dispType);
    
    motor_forces = ComputeMotorForces(-Fc, Gc, m, nu);
    vardot = QuadrotorEOM(t, var, g, m, I, d, km, nu, mu, motor_forces);   
end