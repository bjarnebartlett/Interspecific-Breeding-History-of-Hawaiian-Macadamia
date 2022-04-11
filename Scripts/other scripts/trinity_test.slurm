#!/bin/bash
#SBATCH --job-name=TrinityTest # Name for your job
#SBATCH --account=macnut_genome
#SBATCH --tasks-per-node=1 # Number of tasks when using MPI. Default is 1
#SBATCH --cpus-per-task=16 # Number of cores requested, Default is 1 (total cores requested = tasks x cores)
#SBATCH --nodes=1 # Number of nodes to spread cores across - default is 1 - if you are not using MPI this should likelybe 1
#SBATCH --mem=120G # max amount of memory per node you require in MB (default) G (gigabyte)
##SBATCH --core-spec=0 ## Uncomment to allow jobs to request all cores on a node
#SBATCH -t 43000 # Runtime in minutes. Default is 10 minutes. The Maximum runtime currently is 72 hours, 4320 minutes -requests over that time will not run
#SBATCH -p macnut_genome # Partition to submit to the standard compute node partition(community.q) or the large memory nodepartition(lm.q)
#SBATCH -e /home/bjarne/trinity_test-%A_%a.err # Standard err goes to this file
#SBATCH --mail-user bjarne@hawaii.edu # this is the email you wish tobe notified at
#SBATCH --mail-type ALL # this specifies what events you should get an email about ALL will alert you of jobbeginning,completion, failure etc
rm -r /home/bjarne/trinity_test/
mkdir /home/bjarne/trinity_test/
module load bio/Trinity/2.10.0-intel-2018.5.274
#echo $(dirname `which Trinity`)/trinity-plugins/BIN/seqtk-trinity seq -A -R 2 /home/bjarne/kantar_lab/clean/SRR10424518_2_mod.fastq > /home/bjarne/kantar_lab/clean/right.fa
Trinity --seqType fq --CPU 8 --max_memory 75G --samples_file /home/bjarne/samples.test.txt --output /home/bjarne/trinity_test
