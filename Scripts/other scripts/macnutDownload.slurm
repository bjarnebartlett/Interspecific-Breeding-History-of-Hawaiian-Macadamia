#!/bin/bash
#SBATCH --job-name=MacnutDownload # Name for your job
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
prefetch SRR10424518 -p -v -O /home/bjarne/kantar_lts/bjarne/
prefetch SRR10424519 -p -v -O /home/bjarne/kantar_lts/bjarne/
prefetch SRR10424520 -p -v -O /home/bjarne/kantar_lts/bjarne/
prefetch SRR10424521 -p -v -O /home/bjarne/kantar_lts/bjarne/
prefetch SRR10424522 -p -v -O /home/bjarne/kantar_lts/bjarne/
vdb-validate /home/bjarne/kantar_lts/bjarne/SRR10424518.sra > /home/bjarne/kantar_lts/bjarne/SRR10424518.vdbvalidate.txt
vdb-validate /home/bjarne/kantar_lts/bjarne/SRR10424519.sra > /home/bjarne/kantar_lts/bjarne/SRR10424519.vdbvalidate.txt
vdb-validate /home/bjarne/kantar_lts/bjarne/SRR10424520.sra > /home/bjarne/kantar_lts/bjarne/SRR10424520.vdbvalidate.txt
vdb-validate /home/bjarne/kantar_lts/bjarne/SRR10424521.sra > /home/bjarne/kantar_lts/bjarne/SRR10424521.vdbvalidate.txt
vdb-validate /home/bjarne/kantar_lts/bjarne/SRR10424522.sra > /home/bjarne/kantar_lts/bjarne/SRR10424522.vdbvalidate.txt
mkdir /home/bjarne/kantar_lts/bjarne/temp/
fasterq-dump /home/bjarne/kantar_lts/bjarne/SRR10424518.sra -e 4 -O /home/bjarne/kantar_lts/bjarne/ -t /home/bjarne/kantar_lts/bjarne/temp/
fasterq-dump /home/bjarne/kantar_lts/bjarne/SRR10424519.sra -e 4 -O /home/bjarne/kantar_lts/bjarne/ -t /home/bjarne/kantar_lts/bjarne/temp/
fasterq-dump /home/bjarne/kantar_lts/bjarne/SRR10424520.sra -e 4 -O /home/bjarne/kantar_lts/bjarne/ -t /home/bjarne/kantar_lts/bjarne/temp/
fasterq-dump /home/bjarne/kantar_lts/bjarne/SRR10424521.sra -e 4 -O /home/bjarne/kantar_lts/bjarne/ -t /home/bjarne/kantar_lts/bjarne/temp/
fasterq-dump /home/bjarne/kantar_lts/bjarne/SRR10424522.sra -e 4 -O /home/bjarne/kantar_lts/bjarne/ -t /home/bjarne/kantar_lts/bjarne/temp/
tar -zxf /home/bjarne/kantar_lts/bjarne/*.fastq.gz
# less -S /home/bjarne/nfs_fs02/SRR10424518_1.fastq | awk -F '.' '{if(length($2)>0) print$1":"$3; else print $1}' | awk -F ' ' '{print $1}' | awk -F '+' '{if (length($2)>0) print"+"; else print $1}' > /home/bjarne/nfs_fs02/SRR10424518_1.fastq
# less -S /home/bjarne/nfs_fs02/SRR10424518_2.fastq | awk -F '.' '{if(length($2)>0) print$1":"$3; else print $1}' | awk -F ' ' '{print $1}' | awk -F '+' '{if (length($2)>0) print"+"; else print $1}' > /home/bjarne/nfs_fs02/SRR10424518_2.fastq
# less -S /home/bjarne/nfs_fs02/SRR10424519_1.fastq | awk -F '.' '{if(length($2)>0) print$1":"$3; else print $1}' | awk -F ' ' '{print $1}' | awk -F '+' '{if (length($2)>0) print"+"; else print $1}' > /home/bjarne/nfs_fs02/SRR10424519_1.fastq
# less -S /home/bjarne/nfs_fs02/SRR10424519_2.fastq | awk -F '.' '{if(length($2)>0) print$1":"$3; else print $1}' | awk -F ' ' '{print $1}' | awk -F '+' '{if (length($2)>0) print"+"; else print $1}' > /home/bjarne/nfs_fs02/SRR10424519_2.fastq
# less -S /home/bjarne/nfs_fs02/SRR10424520_1.fastq | awk -F '.' '{if(length($2)>0) print$1":"$3; else print $1}' | awk -F ' ' '{print $1}' | awk -F '+' '{if (length($2)>0) print"+"; else print $1}' > /home/bjarne/nfs_fs02/SRR10424520_1.fastq
# less -S /home/bjarne/nfs_fs02/SRR10424520_2.fastq | awk -F '.' '{if(length($2)>0) print$1":"$3; else print $1}' | awk -F ' ' '{print $1}' | awk -F '+' '{if (length($2)>0) print"+"; else print $1}' > /home/bjarne/nfs_fs02/SRR10424520_2.fastq
# less -S /home/bjarne/nfs_fs02/SRR10424521_1.fastq | awk -F '.' '{if(length($2)>0) print$1":"$3; else print $1}' | awk -F ' ' '{print $1}' | awk -F '+' '{if (length($2)>0) print"+"; else print $1}' > /home/bjarne/nfs_fs02/SRR10424521_1.fastq
# less -S /home/bjarne/nfs_fs02/SRR10424521_2.fastq | awk -F '.' '{if(length($2)>0) print$1":"$3; else print $1}' | awk -F ' ' '{print $1}' | awk -F '+' '{if (length($2)>0) print"+"; else print $1}' > /home/bjarne/nfs_fs02/SRR10424521_2.fastq
# less -S /home/bjarne/nfs_fs02/SRR10424522_1.fastq | awk -F '.' '{if(length($2)>0) print$1":"$3; else print $1}' | awk -F ' ' '{print $1}' | awk -F '+' '{if (length($2)>0) print"+"; else print $1}' > /home/bjarne/nfs_fs02/SRR10424522_1.fastq
# less -S /home/bjarne/nfs_fs02/SRR10424522_2.fastq | awk -F '.' '{if(length($2)>0) print$1":"$3; else print $1}' | awk -F ' ' '{print $1}' | awk -F '+' '{if (length($2)>0) print"+"; else print $1}' > /home/bjarne/nfs_fs02/SRR10424522_2.fastq
# less -S /home/bjarne/kantar_lab/SRR10424518_1_mod.fastq | awk -F '.' '{if(length($2)>0) print$1":"$3; else print $1}' | awk -F ' ' '{print $1}' | awk -F '+' '{if (length($2)>0) print"+"; else print $1}' > /home/bjarne/nfs_fs02/SRR10424518_1.fastq
# less -S /home/bjarne/kantar_lab/SRR10424518_2_mod.fastq | awk -F '.' '{if(length($2)>0) print$1":"$3; else print $1}' | awk -F ' ' '{print $1}' | awk -F '+' '{if (length($2)>0) print"+"; else print $1}' > /home/bjarne/nfs_fs02/SRR10424518_2.fastq
# less -S /home/bjarne/kantar_lab/SRR10424519_1_mod.fastq | awk -F '.' '{if(length($2)>0) print$1":"$3; else print $1}' | awk -F ' ' '{print $1}' | awk -F '+' '{if (length($2)>0) print"+"; else print $1}' > /home/bjarne/nfs_fs02/SRR10424519_1.fastq
# less -S /home/bjarne/kantar_lab/SRR10424519_2_mod.fastq | awk -F '.' '{if(length($2)>0) print$1":"$3; else print $1}' | awk -F ' ' '{print $1}' | awk -F '+' '{if (length($2)>0) print"+"; else print $1}' > /home/bjarne/nfs_fs02/SRR10424519_2.fastq
# less -S /home/bjarne/kantar_lab/SRR10424520_1_mod.fastq | awk -F '.' '{if(length($2)>0) print$1":"$3; else print $1}' | awk -F ' ' '{print $1}' | awk -F '+' '{if (length($2)>0) print"+"; else print $1}' > /home/bjarne/nfs_fs02/SRR10424520_1.fastq
# less -S /home/bjarne/kantar_lab/SRR10424520_2_mod.fastq | awk -F '.' '{if(length($2)>0) print$1":"$3; else print $1}' | awk -F ' ' '{print $1}' | awk -F '+' '{if (length($2)>0) print"+"; else print $1}' > /home/bjarne/nfs_fs02/SRR10424520_2.fastq
# less -S /home/bjarne/kantar_lab/SRR10424521_1_mod.fastq | awk -F '.' '{if(length($2)>0) print$1":"$3; else print $1}' | awk -F ' ' '{print $1}' | awk -F '+' '{if (length($2)>0) print"+"; else print $1}' > /home/bjarne/nfs_fs02/SRR10424521_1.fastq
# less -S /home/bjarne/kantar_lab/SRR10424521_2_mod.fastq | awk -F '.' '{if(length($2)>0) print$1":"$3; else print $1}' | awk -F ' ' '{print $1}' | awk -F '+' '{if (length($2)>0) print"+"; else print $1}' > /home/bjarne/nfs_fs02/SRR10424521_2.fastq
# less -S /home/bjarne/kantar_lab/SRR10424522_1_mod.fastq | awk -F '.' '{if(length($2)>0) print$1":"$3; else print $1}' | awk -F ' ' '{print $1}' | awk -F '+' '{if (length($2)>0) print"+"; else print $1}' > /home/bjarne/nfs_fs02/SRR10424522_1.fastq
# less -S /home/bjarne/kantar_lab/SRR10424522_2_mod.fastq | awk -F '.' '{if(length($2)>0) print$1":"$3; else print $1}' | awk -F ' ' '{print $1}' | awk -F '+' '{if (length($2)>0) print"+"; else print $1}' > /home/bjarne/nfs_fs02/SRR10424522_2.fastq
fastqc /home/bjarne/nfs_fs02/*.fastq
# head -16 /home/bjarne/nfs_fs02/SRR10424518_1.fastq > /home/bjarne/SRR10424518_1.head.txt
# head -16 /home/bjarne/nfs_fs02/SRR10424518_2.fastq > /home/bjarne/SRR10424518_2.head.txt
# head -16 /home/bjarne/nfs_fs02/SRR10424519_1.fastq > /home/bjarne/SRR10424519_1.head.txt
# head -16 /home/bjarne/nfs_fs02/SRR10424519_2.fastq > /home/bjarne/SRR10424519_2.head.txt
# head -16 /home/bjarne/nfs_fs02/SRR10424520_1.fastq > /home/bjarne/SRR10424520_1.head.txt
# head -16 /home/bjarne/nfs_fs02/SRR10424520_2.fastq > /home/bjarne/SRR10424520_2.head.txt
# head -16 /home/bjarne/nfs_fs02/SRR10424521_1.fastq > /home/bjarne/SRR10424521_1.head.txt
# head -16 /home/bjarne/nfs_fs02/SRR10424521_2.fastq > /home/bjarne/SRR10424521_2.head.txt
# head -16 /home/bjarne/nfs_fs02/SRR10424522_1.fastq > /home/bjarne/SRR10424522_1.head.txt
# head -16 /home/bjarne/nfs_fs02/SRR10424522_2.fastq > /home/bjarne/SRR10424522_2.head.txt
