function motor_forces = ComputeMotorForces(Fc, Gc, d, km)
    
    %What we're doing in this code
        %Control Forces and moments = SolutionMatrix * motor_forces
        %motor_forces = inv(solutionMatrix)*Control Forces and moments

    SolutionMatrix = [
                        -1,-1,-1,-1;
                        -d/sqrt(2),-d/sqrt(2),d/sqrt(2),d\sqrt(2);
                        d/sqrt(2),-d/sqrt(2),-d/sqrt(2),d\sqrt(2);
                        km,-km,km,-km;
                        ];
    motor_forces = (SolutionMatrix)\[Fc(3);Gc];
end