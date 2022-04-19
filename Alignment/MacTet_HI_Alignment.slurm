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
module load bio/SAMtools/1.9-intel-2018.5.274

#runtrimmomatic
#trimmomatic is not available as a module
#trimmomatic PE ${sample}_1.fastq ${sample}_2.fastq trimmed_1.fastq unpaired_1.fastq trimmed_2.fastq unpaired_2.fastq ILLUMINACLIP:adapters.fa:2:30:10 LEADING:20 TRAILING:20 AVGQUAL:20 MINLEN:20

#redo fastqc on trimmed files
#fastqc -o qc trimmed_1.fastq trimmed_2.fastq

#BWA Index
bwa index /home/bjarne/kantar_lts/bjarne/MacTet_HI/GCF_013358625.1_SCU_Mint_v3_genomic.fna

#alignment with BWA
bwa mem -R \
"@RG\tID:${sample}\tSM:${sample}\tPL:ILLUMINA\tLB:${sample}" \
/home/bjarne/kantar_lts/bjarne/MacTet_HI/GCF_013358625.1_SCU_Mint_v3_genomic.fna \
MT1_1.fq MT1_2.fq > MT1_Raw.sam

bwa mem -R \
"@RG\tID:${sample}\tSM:${sample}\tPL:ILLUMINA\tLB:${sample}" \
/home/bjarne/kantar_lts/bjarne/MacTet_HI/GCF_013358625.1_SCU_Mint_v3_genomic.fna \
MT5_1.fq MT5_2.fq > MT5_Raw.sam

bwa mem -R \
"@RG\tID:${sample}\tSM:${sample}\tPL:ILLUMINA\tLB:${sample}" \
/home/bjarne/kantar_lts/bjarne/MacTet_HI/GCF_013358625.1_SCU_Mint_v3_genomic.fna \
MT9_1.fq MT9_2.fq > MT9_Raw.sam

bwa mem -R \
"@RG\tID:${sample}\tSM:${sample}\tPL:ILLUMINA\tLB:${sample}" \
/home/bjarne/kantar_lts/bjarne/MacTet_HI/GCF_013358625.1_SCU_Mint_v3_genomic.fna \
MT10_1.fq MT10_2.fq > MT10_Raw.sam

#sort with Samtools
samtools sort MT10_Raw.sam > MT1_sort.bam
samtools sort MT10_Raw.sam > MT5_sort.bam
samtools sort MT10_Raw.sam > MT9_sort.bam
samtools sort MT10_Raw.sam > MT10_sort.bam
