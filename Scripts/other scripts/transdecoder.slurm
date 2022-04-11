#!/bin/bash
#SBATCH --job-name=MacnutTransDecoder # Name for your job
#SBATCH --account=macnut_genome
#SBATCH --tasks-per-node=1 # Number of tasks when using MPI. Default is 1
#SBATCH --cpus-per-task=1 # Number of cores requested, Default is 1 (total cores requested = tasks x cores)
#SBATCH --nodes=1 # Number of nodes to spread cores across - default is 1 - if you are not using MPI this should likelybe 1
#SBATCH --mem=16G # max amount of memory per node you require in MB (default) G (gigabyte)
##SBATCH --core-spec=0 ## Uncomment to allow jobs to request all cores on a node
#SBATCH -t 43200 # Runtime in minutes. Default is 10 minutes. The Maximum runtime currently is 72 hours, 4320 minutes -requests over that time will not run
#SBATCH -p macnut_genome # Partition to submit to the standard compute node partition(community.q) or the large memory nodepartition(lm.q)
#SBATCH -e /home/bjarne/%x-%A_%a.err # Standard err goes to this file
#SBATCH --mail-user bjarne@hawaii.edu # this is the email you wish tobe notified at
#SBATCH --mail-type ALL # this specifies what events you should get an email about ALL will alert you of jobbeginning,completion, failure etc
module load bio/BLAST+/2.2.31
lang/Perl/5.28.1-GCCcore-6.3.0
mkdir /home/bjarne/kantar_lts/bjarne/Trinity_TransDecoder_SRR10424518/
/home/bjarne/TransDecoder-TransDecoder-v5.5.0/TransDecoder.LongOrfs -t /home/bjarne/kantar_lts/bjarne/Trinity_Output_SRR10424518/both.fa -O /home/bjarne/kantar_lts/bjarne/Trinity_TransDecoder_SRR10424518/
mkdir /home/bjarne/kantar_lts/bjarne/Trinity_TransDecoder_SRR10424519/
/home/bjarne/TransDecoder-TransDecoder-v5.5.0/TransDecoder.LongOrfs -t /home/bjarne/kantar_lts/bjarne/Trinity_Output_SRR10424519/both.fa -O /home/bjarne/kantar_lts/bjarne/Trinity_TransDecoder_SRR10424519/
mkdir /home/bjarne/kantar_lts/bjarne/Trinity_TransDecoder_SRR10424520/
/home/bjarne/TransDecoder-TransDecoder-v5.5.0/TransDecoder.LongOrfs -t /home/bjarne/kantar_lts/bjarne/Trinity_Output_SRR10424520/both.fa -O /home/bjarne/kantar_lts/bjarne/Trinity_TransDecoder_SRR10424520/
mkdir /home/bjarne/kantar_lts/bjarne/Trinity_TransDecoder_SRR10424521/
/home/bjarne/TransDecoder-TransDecoder-v5.5.0/TransDecoder.LongOrfs -t /home/bjarne/kantar_lts/bjarne/Trinity_Output_SRR10424521/both.fa -O /home/bjarne/kantar_lts/bjarne/Trinity_TransDecoder_SRR10424521/
mkdir /home/bjarne/kantar_lts/bjarne/Trinity_TransDecoder_SRR10424522/
/home/bjarne/TransDecoder-TransDecoder-v5.5.0/TransDecoder.LongOrfs -t /home/bjarne/kantar_lts/bjarne/Trinity_Output_SRR10424522/both.fa -O /home/bjarne/kantar_lts/bjarne/Trinity_TransDecoder_SRR10424522/
mkdir /home/bjarne/kantar_lts/bjarne/Trinity_TransDecoder_All/
/home/bjarne/TransDecoder-TransDecoder-v5.5.0/TransDecoder.LongOrfs -t /home/bjarne/kantar_lts/bjarne/Trinity_All/both.fa -O /home/bjarne/kantar_lts/bjarne/Trinity_TransDecoder_All/
