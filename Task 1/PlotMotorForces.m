function PlotMotorForces(time, motor_forces,figNum,style,nameSuffix,dispName)

figure(figNum);
set(gcf,'Name',nameSuffix+" Motor Forces",'NumberTitle','off');
sgtitle(nameSuffix+": Motor Forces (N) vs Time (s)");
subplot(4,1,1); hold on;
plot(time, motor_forces(1,:),style,DisplayName=dispName); ylabel('Motor Force 1'); legend;
subplot(4,1,2); hold on;
plot(time, motor_forces(2,:),style); ylabel('Motor Force 2',DisplayName=dispName)
subplot(4,1,3); hold on;
plot(time, motor_forces(3,:),style); ylabel('Motor Force 3',DisplayName=dispName)
subplot(4,1,4); hold on;
plot(time, motor_forces(4,:),style); ylabel('Motor Force 4',DisplayName=dispName);xlabel("Time (seconds)")
xlabel('Time (s)');
title('Motor Forces vs Time');
end