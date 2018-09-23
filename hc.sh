#!/bin/bash
#SBATCH --mail-user=hnpan@terpmail.umd.edu
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH -t 30:05:00
#SBATCH -n 20
#SBATCH -L matlab
. ~/.profile

cd /lustre/hnpan/Honeycomb_matlab_2
module load matlab/2018a
matlab -nodisplay -nosplash -r "parpool($SLURM_NTASKS);main;exec;exit"

