%Main for ASEN-3801 Lab 4 Quadcopter Lab
%Date: 10/14/2025
%Authors: Alex Godbout, Christopher Westerlund, Damien Wilson, Maria Cristina Sarno
%Inputs: RSdata_nocontrol.mat
%Outputs:
clear; clc; close all;

%%------------------------%%
%%--------Paths-----------%%
%%------------------------%%

%Add File Paths (cannot access functions in other files)
addpath('./Task 1');
addpath('./Task 2');
addpath('./Task 3');

%%------------------------%%
%%--------Toggles---------%%
%%------------------------%%

%Toggles: When set to 1, the corresponding segment of code will run
saveFigures = 0;

run1_2 = 0;
run1_3 = 0;
run1_4 = 0;

run2_1and2 = 0;
run2_1and5 = 0;

run3_3 = 0;
run_rootLocus = 1;

%%------------------------%%
%%-----Run lab Tasks------%%
%%------------------------%%

LabTask1(run1_2,run1_3,run1_4);
LabTask2(run2_1and2,run2_1and5);
LabTask3(run3_3);
RootLocus(run_rootLocus);


%%------------------------%%
%%-----Save Figures-------%%
%%------------------------%%
if(saveFigures == 1)
    figHandles = findall(0, 'Type', 'figure');
    n = length(figHandles);
    for i=1:n
        saveas(figHandles(i),"./Figures/"+figHandles(i).Name,'png');
    end
end

