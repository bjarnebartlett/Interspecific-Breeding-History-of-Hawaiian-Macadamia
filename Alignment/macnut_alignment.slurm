#!/bin/bash
#SBATCH --job-name=MacnutFASTQC # Name for your job
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
module load bio/BWA/0.7.17-intel-2018.5.274
module load bio/BCFtools/1.9-intel-2018.5.274
module load bio/SAMtools/1.9-intel-2018.5.274
module load bio/SRA-Toolkit/2.9.6-centos_linux64
# #index with BWA


# #alignment with BWA
# bwa mem -R \
# /home/bqhs/ebola/AF086833.fa \
# trimmed_1.fastq trimmed_2.fastq > ${sample}_raw.sam
#
# #sort with Samtools
# samtools sort ${sample}_raw.sam > ${sample}_sort.bam
#
# #MarkDuplicates
# picard MarkDuplicates -Xmx50g I=${sample}_sort.bam O=${sample}_dedup.bam M=${sample}_dedup.txt
#
# #collect alignment metrics
# picard CollectAlignmentSummaryMetrics -Xmx50g INPUT=${sample}_dedup.bam OUTPUT=${sample}_aln_metrics.txt REFERENCE_SEQUENCE=/home/bqhs/ebola/AF086833.fa
#
# #base recalibration
# #gatk BaseRecalibrator -R /home/bqhs/hg38/genome.fa -I ${sample}_dedup.bam --known-sites /home/bqhs/hg38/dbsnp_146.hg38.vcf.gz --known-sites /home/bqhs/hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf.gz -O recal.table
#
# #bqsr application
# #gatk ApplyBQSR -R /home/bqhs/hg38/genome.fa -I ${sample}_dedup.bam --bqsr-recal-file recal.table -O ${sample}_FINAL.bam
#
# #index final bam file
# samtools index ${sample}_dedup.bam
