# Receding-DO-CBF-QP

This repository provides the code for the simulation of our paper "A Simple Disturbance-Observer based Safety-Critical Control for Uncer-
tain Affine Nonlinear Systems".

To run the main results, run MAIN.m file. 

You may define some optional variables to define your simulation choice:
1. case_num defines the case of simulation:
case_num = 1: Case 1 (no input saturation) in the paper.
case_num = 2: Case 2 (no input saturation) in the paper.
case_num = 3: the case where the input saturation is considered in the paper.

2. run_baselines define whether the baseline controllers are run or not.
run_baselines = 0: Only simulate the control system with the proposed DO CBF controller.
run_baselines = 1: Simulate the proposed DO CBF controller together with the nominal CBF, L1 CBF for comparison.

3. Matlab_ver define the Matlab version which is appropriate for you to open and run Simulink models.
case_num = '2018a': compatible for Matlab 2018a or higher verisons.
case_num = '2021a': compatible for Matlab 2021a or higher verisons.
