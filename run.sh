#!/bin/sh
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=40
#SBATCH --time=05:00:00
#SBATCH --job-name=grap
#SBATCH --error=z.job.%J.err
#SBATCH --output=z.job.%J.out
#SBATCH --exclusive

hostname ; pwd ; date
module load intel/2018.0.1.163
module unload gnu8/8.3.0
source /opt/ohpc/pub/intel2018/compilers_and_libraries_2018.1.163/linux/mkl/bin/mklvars.sh intel64
echo "loading the modules required !! "
#module load intel/2019.5.281
#module load openmpi/4.0.1
export I_MPI_FALLBACK=disable
#export I_MPI_FABRICS=shm:tmi // Fabrics required for with node inter node//
#export I_MPI_DEBUG=9
module load quantum_espresso_6.4.1
#export OMP_NUM_THREADS=1
#time mpiexec.hydra -genv I_MPI_DEBUG 9 -n $SLURM_NTASKS -genv OMP_NUM_THREADS 1 pw.x -inp ofloxacin_grap.in >> ofloxacin_grap.out

#time mpiexec.hydra -genv I_MPI_DEBUG 9 -n $SLURM_NTASKS -genv OMP_NUM_THREADS 1 pw.x -inp scf.in > scf.out
#time mpiexec.hydra -genv I_MPI_DEBUG 9 -n $SLURM_NTASKS -genv OMP_NUM_THREADS 1 pw.x -inp scbbands.in > scbbands.out
time mpiexec.hydra -genv I_MPI_DEBUG 9 -n $SLURM_NTASKS -genv OMP_NUM_THREADS 1 pp.x -inp homo.in > homo.out

#mpirun -np $SLURM_NTASKS pw.x -inp grap.in >> grap.out
echo "Execution of the program"

date

