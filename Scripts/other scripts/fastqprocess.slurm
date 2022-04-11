#!/bin/bash
#SBATCH --job-name=fastqprocess # Name for your job
#SBATCH --account=macnut_genome
#SBATCH --tasks-per-node=1 # Number of tasks when using MPI. Default is 1
#SBATCH --cpus-per-task=16 # Number of cores requested, Default is 1 (total cores requested = tasks x cores)
#SBATCH --nodes=1 # Number of nodes to spread cores across - default is 1 - if you are not using MPI this should likelybe 1
#SBATCH --mem=120G # max amount of memory per node you require in MB (default) G (gigabyte)
##SBATCH --core-spec=0 ## Uncomment to allow jobs to request all cores on a node
#SBATCH -t 20000 # Runtime in minutes. Default is 10 minutes. The Maximum runtime currently is 72 hours, 4320 minutes -requests over that time will not run
#SBATCH -p macnut_genome # Partition to submit to the standard compute node partition(community.q) or the large memory nodepartition(lm.q)
#SBATCH -e /home/bjarne/fastqprocess-%A_%a.err # Standard err goes to this file
#SBATCH --mail-user bjarne@hawaii.edu # this is the email you wish tobe notified at
#SBATCH --mail-type ALL # this specifies what events you should get an email about ALL will alert you of jobbeginning,completion, failure etc
mv /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424518_1.fastq ~
cat /home/bjarne/SRR10424518_1.fastq | cut -f1 -d ' ' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/adj.SRR10424518_1.fastq
mv /home/bjarne/SRR10424518_1.fastq /home/bjarne/kantar_lab/
mv /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424518_2.fastq ~
cat /home/bjarne/SRR10424518_2.fastq | cut -f1 -d ' ' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/adj.SRR10424518_2.fastq
mv /home/bjarne/SRR10424518_2.fastq /home/bjarne/kantar_lab/
mv /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424519_1.fastq ~
cat /home/bjarne/SRR10424519_1.fastq | cut -f1 -d ' ' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/adj.SRR10424519_1.fastq
mv /home/bjarne/SRR10424519_1.fastq /home/bjarne/kantar_lab/
mv /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424519_2.fastq ~
cat /home/bjarne/SRR10424519_2.fastq | cut -f1 -d ' ' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/adj.SRR10424519_2.fastq
mv /home/bjarne/SRR10424519_2.fastq /home/bjarne/kantar_lab/
mv /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424520_1.fastq ~
cat /home/bjarne/SRR10424520_1.fastq | cut -f1 -d ' ' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/adj.SRR10424520_1.fastq
mv /home/bjarne/SRR10424520_1.fastq /home/bjarne/kantar_lab/
mv /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424520_2.fastq ~
cat /home/bjarne/SRR10424520_2.fastq | cut -f1 -d ' ' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/adj.SRR10424520_2.fastq
mv /home/bjarne/SRR10424520_2.fastq /home/bjarne/kantar_lab/
mv /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424521_1.fastq ~
cat /home/bjarne/SRR10424521_1.fastq | cut -f1 -d ' ' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/adj.SRR10424521_1.fastq
mv /home/bjarne/SRR10424521_1.fastq /home/bjarne/kantar_lab/
mv /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424521_2.fastq ~
cat /home/bjarne/SRR10424521_2.fastq | cut -f1 -d ' ' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/adj.SRR10424521_2.fastq
mv /home/bjarne/SRR10424521_2.fastq /home/bjarne/kantar_lab/
mv /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424522_1.fastq ~
cat /home/bjarne/SRR10424522_1.fastq | cut -f1 -d ' ' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/adj.SRR10424522_1.fastq
mv /home/bjarne/SRR10424522_1.fastq /home/bjarne/kantar_lab/
mv /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424522_2.fastq ~
cat /home/bjarne/SRR10424522_2.fastq | cut -f1 -d ' ' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/adj.SRR10424522_2.fastq
mv /home/bjarne/SRR10424522_2.fastq /home/bjarne/kantar_lab/
#cat /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424518_1.fastq | cut -f1 -d ' ' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/adj.SRR10424518_1.fastq
#cat /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424518_2.fastq | cut -f1 -d ' ' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/adj.SRR10424518_2.fastq
#cat /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424519_1.fastq | cut -f1 -d ' ' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/adj.SRR10424519_1.fastq
#cat /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424519_2.fastq | cut -f1 -d ' ' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/adj.SRR10424519_2.fastq
#cat /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424520_1.fastq | cut -f1 -d ' ' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/adj.SRR10424520_1.fastq
#cat /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424520_2.fastq | cut -f1 -d ' ' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/adj.SRR10424520_2.fastq
#cat /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424521_1.fastq | cut -f1 -d ' ' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/adj.SRR10424521_1.fastq
#cat /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424521_2.fastq | cut -f1 -d ' ' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/adj.SRR10424521_2.fastq
#cat /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424522_1.fastq | cut -f1 -d ' ' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/adj.SRR10424522_1.fastq
#cat /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424522_2.fastq | cut -f1 -d ' ' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/adj.SRR10424522_2.fastq
#less -S /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424518_1.fastq | awk -F '\.' '{if ($0 ~ /^@SRR/ || $0 ~ /^+SRR/) print $1"."$2"/"$3; else print $0}' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424518_1.fastq
#less -S /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424518_2.fastq | awk -F '\.' '{if ($0 ~ /^@SRR/ || $0 ~ /^+SRR/) print $1"."$2"/"$3; else print $0}' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424518_2.fastq
#less -S /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424519_1.fastq | awk -F '\.' '{if ($0 ~ /^@SRR/ || $0 ~ /^+SRR/) print $1"."$2"/"$3; else print $0}' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424519_1.fastq
#less -S /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424519_2.fastq | awk -F '\.' '{if ($0 ~ /^@SRR/ || $0 ~ /^+SRR/) print $1"."$2"/"$3; else print $0}' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424519_2.fastq
#less -S /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424520_1.fastq | awk -F '\.' '{if ($0 ~ /^@SRR/ || $0 ~ /^+SRR/) print $1"."$2"/"$3; else print $0}' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424520_1.fastq
#less -S /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424520_2.fastq | awk -F '\.' '{if ($0 ~ /^@SRR/ || $0 ~ /^+SRR/) print $1"."$2"/"$3; else print $0}' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424520_2.fastq
#less -S /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424521_1.fastq | awk -F '\.' '{if ($0 ~ /^@SRR/ || $0 ~ /^+SRR/) print $1"."$2"/"$3; else print $0}' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424521_1.fastq
#less -S /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424521_2.fastq | awk -F '\.' '{if ($0 ~ /^@SRR/ || $0 ~ /^+SRR/) print $1"."$2"/"$3; else print $0}' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424521_2.fastq
#less -S /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424522_1.fastq | awk -F '\.' '{if ($0 ~ /^@SRR/ || $0 ~ /^+SRR/) print $1"."$2"/"$3; else print $0}' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424522_1.fastq
#less -S /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424522_2.fastq | awk -F '\.' '{if ($0 ~ /^@SRR/ || $0 ~ /^+SRR/) print $1"."$2"/"$3; else print $0}' > /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424522_2.fastq
#head -10 /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424518.sra_1.fastq > SRR10424518_1.head.txt
#head -10 /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424518.sra_2.fastq > SRR10424518_2.head.txt
#head -10 /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424519.sra_1.fastq > SRR10424519_1.head.txt
#head -10 /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424519.sra_2.fastq > SRR10424519_2.head.txt
#head -10 /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424520.sra_1.fastq > SRR10424520_1.head.txt
#head -10 /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424520.sra_2.fastq > SRR10424520_2.head.txt
#head -10 /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424521.sra_1.fastq > SRR10424521_1.head.txt
#head -10 /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424521.sra_2.fastq > SRR10424521_2.head.txt
#head -10 /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424522.sra_1.fastq > SRR10424522_1.head.txt
#head -10 /home/bjarne/nfs_fs02/MacadamiaTetraphyllaAssembly_2020/FASTQ_Macadamia0509/SRR10424522.sra_2.fastq > SRR10424522_2.head.txt
head -10 /home/bjarne/adj.SRR10424518.sra_1.fastq > SRR10424518_1.head.txt
head -10 /home/bjarne/adj.SRR10424518.sra_2.fastq > SRR10424518_2.head.txt
head -10 /home/bjarne/adj.SRR10424519.sra_1.fastq > SRR10424519_1.head.txt
head -10 /home/bjarne/adj.SRR10424519.sra_2.fastq > SRR10424519_2.head.txt
head -10 /home/bjarne/adj.SRR10424520.sra_1.fastq > SRR10424520_1.head.txt
head -10 /home/bjarne/adj.SRR10424520.sra_2.fastq > SRR10424520_2.head.txt
head -10 /home/bjarne/adj.SRR10424521.sra_1.fastq > SRR10424521_1.head.txt
head -10 /home/bjarne/adj.SRR10424521.sra_2.fastq > SRR10424521_2.head.txt
head -10 /home/bjarne/adj.SRR10424522.sra_1.fastq > SRR10424522_1.head.txt
head -10 /home/bjarne/adj.SRR10424522.sra_2.fastq > SRR10424522_2.head.txt
