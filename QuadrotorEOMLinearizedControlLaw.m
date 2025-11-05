function var_dot = QuadrotorEOMLinearizedControlLaw(t, var, g, m, I)
% closed-loop linearized quadrotor about hover using InnerLoopFeedback
% function for task 3.3

    % call on InnerLoopFeedback
    [Fc, Gc] = InnerLoopFeedback(var);

    % derivations
    deltaFc = Fc - [0;0;m*g];
    deltaGc = Gc;

    % call on task 2 QuadrotorEOM_Linearized
    var_dot = QuadrotorEOM_Linearized(t, var, g, m, I, deltaFc, deltaGc);
end
