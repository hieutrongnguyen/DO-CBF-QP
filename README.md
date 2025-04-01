# Receding-DO-CBF-QP

This repository provides the simulation code accompanying our paper:  
**"A Simple Disturbance-Observer-Based Safety-Critical Control for Uncertain Affine Nonlinear Systems."**



## 🚀 Getting Started

To reproduce the main simulation results, simply run:

```matlab
MAIN.m
```



## ⚙️ Simulation Options

You can optionally define the following variables before running the simulation to customize behavior:

### 1. `case_num` — Select Simulation Scenario:
- `case_num = 1`: Case 1 (no input saturation) in the paper.
- `case_num = 2`: Case 2 (no input saturation) in the paper.
- `case_num = 3`: The case where the input saturation is considered in the paper.

### 2. `run_baselines` — Toggle Baseline Controller Comparison:
- `run_baselines = 0`: Run only the proposed DO-CBF controller.
- `run_baselines = 1`: Run the DO-CBF controller alongside the Nominal CBF and L1-CBF for comparison.

### 3. `Matlab_ver` — Define MATLAB Version for Simulink Compatibility:
- `Matlab_ver = '2018a'`: Compatible with MATLAB R2018a and higher.
- `Matlab_ver = '2021a'`: Compatible with MATLAB R2021a and higher.


  
## ⚠️ Nominal DO-CBF with Input Saturation

To verify the **infeasibility of the Nominal DO-CBF controller** under input saturation (Case 3), run:

```matlab
check_early_termination_Nominal_DO_CBF.m
```
inside the folder with the same name check_early_termination_Nominal_DO_CBF

> 📌 This script is provided separately because running the Simulink model of the Nominal DO-CBF from the command line may terminate early, causing errors and preventing proper output logging.  
For the plots in our paper, we manually executed the simulation by clicking the **"Run"** button in Simulink to avoid this issue.



## ⏱ Note on Simulation Timing

When running comparisons via the command line, the reported simulation time will be **longer** than in the paper.  
This is due to MATLAB/Simulink taking significantly more time to execute models from the command line compared to manual execution through the GUI.

---

Feel free to open issues or contribute improvements!


