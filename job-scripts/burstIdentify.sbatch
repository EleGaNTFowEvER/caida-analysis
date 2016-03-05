#!/bin/bash

#SBATCH -J Burst_Indentificatino 
#SBATCH -n 1
#SBATCH -t 00:30:00
#SBATCH -p serial
#SBATCH --mem 4000




python findBurst.py packets_minute1.txt output.txt
