function var_dot = QuadrotorEOMControlLaw(t, var, g, m, I,d,km,nu,mu)
% closed-loop quadrotor about hover using InnerLoopFeedback
% function for task 3.4

    % call on InnerLoopFeedback
    [Fc, Gc] = InnerLoopFeedback(var);
    motor_forces = ComputeMotorForces(-Fc,Gc,d,km);

    % call on task 2 QuadrotorEOM_Linearized
    var_dot = QuadrotorEOM(t, var, g, m, I, d, km, nu, mu, motor_forces);  
end