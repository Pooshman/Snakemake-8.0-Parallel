#!/bin/bash
#SBATCH --partition=queue-1      # SLURM partition
#SBATCH --nodes=5                # Request 5 nodes
#SBATCH --ntasks=5               # Request 5 tasks (one per node)
#SBATCH --cpus-per-task=1        # Number of CPUs per task
#SBATCH --time=00:30:00          # Time limit
#SBATCH --job-name=snakemake_run
#SBATCH --output=slurm_output_%j.txt

# Run Snakemake
snakemake --executor slurm \
          --jobs 5 \
          --keep-going \
          --latency-wait 60 \
          --verbose \
          --default-resources "mem_mb=4000"
