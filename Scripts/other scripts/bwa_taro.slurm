#!/bin/bash
#SBATCH --job-name=MacnutBWA # Name for your job
##SBATCH --account=macnut_genome
#SBATCH --tasks-per-node=1 # Number of tasks when using MPI. Default is 1
#SBATCH --cpus-per-task=2 # Number of cores requested, Default is 1 (total cores requested = tasks x cores)
#SBATCH --nodes=1 # Number of nodes to spread cores across - default is 1 - if you are not using MPI this should likelybe 1
#SBATCH --mem=5G # max amount of memory per node you require in MB (default) G (gigabyte)
##SBATCH --core-spec=0 ## Uncomment to allow jobs to request all cores on a node
#SBATCH -t 4320 # Runtime in minutes. Default is 10 minutes. The Maximum runtime currently is 72 hours, 4320 minutes -requests over that time will not run
#SBATCH -p shared # Partition to submit to the standard compute node partition(community.q) or the large memory nodepartition(lm.q)
#SBATCH -e /home/bjarne/%x-%A_%a.err # Standard err goes to this file
#SBATCH --mail-user bjarne@hawaii.edu # this is the email you wish tobe notified at
#SBATCH --mail-type ALL # this specifies what events you should get an email about ALL will alert you of jobbeginning,completion, failure etc
module load bio/BWA/0.7.17-intel-2018.5.274
module load bio/SAMtools/1.9-intel-2018.5.274
bwa index /home/bjarne/kantar_lts/carter/Taro_Genome_Mikey_GCA_014218235.1_Taro_JAAS_v1.0_genomic.fna
# bwa mem \
# /home/bjarne/kantar_lts/carter/taro_adapters_6_20/.fq > .bwa.sam \
# /home/bjarne/kantar_lts/bjarne/BWA/18.fa > SRR10424518.sam
# samtools view -o 18.bwa.sam
# samtools quickcheck SRR10424518.sam > quickcheck.txt
# samtools sort SRR10424518.sam > SRR10424518_sort.bam
