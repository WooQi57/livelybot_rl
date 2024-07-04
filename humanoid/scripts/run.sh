#!/bin/bash
#
#SBATCH --job-name="000-00-lively"
#SBATCH --partition=iris-hi
#SBATCH --account=iris
#SBATCH --output=/iris/u/wuqi23/livelybot_rl_baseline/output/000-00-%j.out
#SBATCH --cpus-per-task=2
#SBATCH --gres=gpu:1 
#SBATCH --time=48:00:00 # Max job length is 3 day
#SBATCH --nodes=1 # Only use one node (machine)
#SBATCH --mem=32G
#SBATCH --exclude=iris-hp-z8,iris1,iris2,iris3,iris4,iris-hgx-1

###SBATCH --mem-per-cpu=2G

# only use the following if you want email notification
#SBATCH --mail-user=wuqi23@cs.stanford.edu
#SBATCH --mail-type=ALL

# list out some useful information (optional)
echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
echo "SLURMTMPDIR="$SLURMTMPDIR
echo "working directory = "$SLURM_SUBMIT_DIR
nvidia-smi

# sample process
srun bash -c '/iris/u/wuqi23/anaconda3/envs/doggy/bin/python /iris/u/wuqi23/doggybot/test.py'
echo "
--------------------------------------------
task description:
    first trial
--------------------------------------------
--------------------------------------------
--------------------------------------------" 

srun bash -c '/iris/u/wuqi23/anaconda3/envs/paibot/bin/python train.py  --task=pai_ppo --run_name v1 --headless --num_envs 4096
'

# done
echo "Done"