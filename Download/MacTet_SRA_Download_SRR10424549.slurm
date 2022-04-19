#!/bin/bash
#SBATCH --job-name=MacnutDownloadSRR10424549 # Name for your job
#SBATCH --account=macnut_genome
#SBATCH --tasks-per-node=1 # Number of tasks when using MPI. Default is 1
#SBATCH --cpus-per-task=4 # Number of cores requested, Default is 1 (total cores requested = tasks x cores)
#SBATCH --nodes=1 # Number of nodes to spread cores across - default is 1 - if you are not using MPI this should likelybe 1
#SBATCH --mem=30G # max amount of memory per node you require in MB (default) G (gigabyte)
##SBATCH --core-spec=0 ## Uncomment to allow jobs to request all cores on a node
#SBATCH -t 20000 # Runtime in minutes. Default is 10 minutes. The Maximum runtime currently is 72 hours, 4320 minutes -requests over that time will not run
#SBATCH -p macnut_genome # Partition to submit to the standard compute node partition(community.q) or the large memory nodepartition(lm.q)
#SBATCH -e /home/bjarne/macnut-%A_%a.err # Standard err goes to this file
#SBATCH --mail-user bjarne@hawaii.edu # this is the email you wish tobe notified at
#SBATCH --mail-type ALL # this specifies what events you should get an email about ALL will alert you of jobbeginning,completion, failure etc
module load bio/SRA-Toolkit/2.9.6-centos_linux64
module load bio/FastQC/0.11.8-Java-1.8.0_191
# prefetch SRR10424549 -p -v -O /home/bjarne/kantar_lts/bjarne/
# vdb-validate /home/bjarne/kantar_lts/bjarne/SRR10424549.sra > /home/bjarne/kantar_lts/bjarne/SRR10424549.vdbvalidate.txt
# mkdir /home/bjarne/kantar_lts/bjarne/temp/
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/013/358/625/GCF_013358625.1_SCU_Mint_v3/ -P /home/bjarne/kantar_lts/bjarne
# fasterq-dump SRR10424549 -e 4 -O /home/bjarne/kantar_lts/bjarne/ -t /home/bjarne/kantar_lts/bjarne/temp/
# tar -zxf /home/bjarne/kantar_lts/bjarne/*.fastq.gz
fastqc /home/bjarne/kantar_lts/bjarne/*.fastq.gz
