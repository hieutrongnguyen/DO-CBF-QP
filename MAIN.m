%% ============= Simulation setting ============= %%
% case_num = 1: Case 1 (no input saturation)
% case_num = 2: Case 2 (no input saturation)
% case_num = 3: input saturation is considered

case_num = 3;

% run_baselines = 0: Run only the control system with the proposed method
% run_baselines = 1: Run DO CBF with other baselines

run_baselines = 0;

% Choose the appropriate Matlab version for simulation
% Matlab_ver = '2021a' or Matlab_ver = '2018a'

Matlab_ver = '2018a';

%% Simulation parameters
Ts = 0.001;
Tsim = 20;

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

%% L1 parameters
G = 1;
P = 1;
Gamma = 10000;
GTP = G'*P*Gamma;

alpha_max = 20; epsilon_alpha = 0.1;
beta_max = 20; epsilon_beta = 0.1;

%% Initial conditions
x10 = 0; 
x20 = 20; % Intial velocity of the vehicle
D0 = 100; % Intial distance between the vehicle and the vehicle ahead

%% Simulation
if strcmp(Matlab_ver, '2018a')
    addpath('2018a');
elseif strcmp(Matlab_ver, '2021a')
    addpath('2021a');
else
    fprintf('Please fill the correct syntax for Matlab version\n');
end

if run_baselines == 0
    open('Receding_DO_CBF_ACC.slx');
    out_DO = sim('Receding_DO_CBF_ACC.slx', 'SaveOutput', 'on');

    %=========== Plot results ===========%
    plot_results_DO_CBF_only()
else
    %=========== Nominal CBF ===========%
    open('Nominal_CBF_ACC.slx');
    out_nominal = sim('Nominal_CBF_ACC.slx', 'SaveOutput', 'on');

    %=========== L1 CBF ===========%
    open('L1_CBF_ACC.slx');
    out_L1 = sim('L1_CBF_ACC.slx', 'SaveOutput', 'on');
  
    %=========== DO CBF ===========%
    open('Receding_DO_CBF_ACC.slx');
    out_DO = sim('Receding_DO_CBF_ACC.slx', 'SaveOutput', 'on');
    
    %=========== Plot results for comparison ===========%
    plot_results()
end
