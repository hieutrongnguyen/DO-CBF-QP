%% Simulation setting
% Choose the appropriate Matlab version for simulation
% Matlab_ver = '2021a' or Matlab_ver = '2018a'

Matlab_ver = '2018a';

case_num = 3;

%% Physical parameters
g = 9.81; 
m = 1650; 
f0 = 0.1; 
f1 = 5;
f2 = 0.25;
vd = 24;
v0 = 13.89;

ca = 0.3;
cd = 0.3;

if case_num == 2
    k = 5; k_fric = 0.1;
else
    k = 1; k_fric = 1;
end

%% CBF parameters
if case_num == 1 || case_num == 2
    epsilon = 10; gamma = 5; psc = 1e3;
    omega0 = 0; p_omega = 0;
else
    epsilon = 5;
    gamma = 0.5;
    psc = 1;
    omega0 = 1; p_omega = 1e+8;
end

%% Simulation
if strcmp(Matlab_ver, '2018a')
    addpath('2018a');
elseif strcmp(Matlab_ver, '2021a')
    addpath('2021a');
else
    fprintf('Please fill the correct syntax for Matlab version\n');
end

open('Nominal_Receding_DO_CBF_ACC.slx');
out_nominal_DO = sim('Nominal_Receding_DO_CBF_ACC.slx', 'SaveOutput', 'on');
