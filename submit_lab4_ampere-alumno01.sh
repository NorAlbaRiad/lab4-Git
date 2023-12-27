#!/bin/bash
#SBATCH -p hpc-bio-ampere
#SBATCH --chdir=/home/alumno01/lab4
#SBATCH -J sumbit_lab4                                           # job name
#SBATCH --output=alumno01-%j.out                                 # exit name
#SBATCH --cpus-per-task=4                                        # 1 for serial, more for parallel
#SBATCH --mail-type=NONE                                         # END/START/NONE
#SBATCH --mail-user=MAIL@um.es                                   # mail destination

for file in `ls /home/alumno01/lab4/fastqc/Sample*.fastq`
do
/home/alumno01/lab4/file-cut.sh $file &
done

wait

