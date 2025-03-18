# livelybot_rl_control

This repository provides a reinforcement learning environment used to train HighTorque’s Legged Robot using NVIDIA’s Isaac Gym. Livelybot_rl_control also integrates a sim-to-sim framework from Isaac Gym to Mujoco that allows users to verify the trained policies in different physical simulations to ensure the robustness and generalization of the policies.

## Installation
The repo is already installed in the server.

1. Generate a new Python virtual environment with Python 3.8 using `conda create -n myenv python=3.8`.
2. For the best performance, we recommend using NVIDIA driver version 525 `sudo apt install nvidia-driver-525`. The minimal driver version supported is 515. If you're unable to install version 525, ensure that your system has at least version 515 to maintain basic functionality.
3. Install PyTorch 1.13 with Cuda-11.7:
   - `conda install pytorch==1.13.1 torchvision==0.14.1 torchaudio==0.13.1 pytorch-cuda=11.7 -c pytorch -c nvidia`
4. Install numpy-1.23 with `conda install numpy=1.23`.
5. Install Isaac Gym:
   - Download and install Isaac Gym Preview 4 from https://developer.nvidia.com/isaac-gym.
   - `cd isaacgym/python && pip install -e .`
   - Run an example with `cd examples && python 1080_balls_of_solitude.py`.
   - Consult `isaacgym/docs/index.html` for troubleshooting.
6. Install livelybot_rl_control:
   - Clone this repository.
   - `cd livelybot_rl_control && pip install -e .`
7. Install the following for web viewing
   - `pip install imageio[ffmpeg] Flask `


## Usage Guide

#### Examples
We only need the first two steps. The conda environment 'pibot' is automatically activated in any bash terminal.

```bash
# Launching PPO Policy Training for run '000' Across 4096 Environments
# This command initiates the PPO algorithm-based training for the humanoid task.
screen -Rd train # Run in a separate screen session in background
python scripts/train.py --task=pai_ppo --run_name 000-note-on-experiment --headless --num_envs 4096
# press 'Ctrl+a then d' to detach the screen session

# Evaluating the Trained PPO Policy
# This command loads the '000' policy for performance assessment in its environment. 
# The script automatically detects the run whose name contains 'load_run'
# Additionally, it automatically exports a JIT model, suitable for deployment purposes.
# Click on the pop up window in VSCode to view the rendered simulation.
python scripts/play.py --task=pai_ppo --load_run 000 --web
```

#### Results
The results of the play.py are in figs/

## Acknowledgment

The implementation of livelybot_rl_control relies on resources from [legged_gym](https://github.com/leggedrobotics/legged_gym)  and [humanoid-gym](https://github.com/roboterax/humanoid-gym) projects.

