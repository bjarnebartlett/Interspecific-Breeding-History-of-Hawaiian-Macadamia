#!/bin/bash
#SBATCH --job-name=DNASeq # Name for your job
#SBATCH --account=macnut_genome
#SBATCH --tasks-per-node=1 # Number of tasks when using MPI. Default is 1
#SBATCH --cpus-per-task=3 # Number of cores requested, Default is 1 (total cores requested = tasks x cores)
#SBATCH --nodes=1 # Number of nodes to spread cores across - default is 1 - if you are not using MPI this should likelybe 1
#SBATCH --mem=60G # max amount of memory per node you require in MB (default) G (gigabyte)
##SBATCH --core-spec=0 ## Uncomment to allow jobs to request all cores on a node
#SBATCH -t 43200 # Runtime in minutes. Default is 10 minutes. The Maximum runtime currently is 72 hours, 4320 minutes -requests over that time will not run
#SBATCH -p macnut_genome # Partition to submit to the standard compute node partition(community.q) or the large memory nodepartition(lm.q)
#SBATCH -e /home/(user)/%x-%A_%a.err # Standard err goes to this file
#SBATCH --mail-user (user)@hawaii.edu # this is the email you wish tobe notified at
#SBATCH --mail-type ALL # this specifies what events you should get an email about ALL will alert you of jobbeginning,completion, failure etc
module load bio/BWA/0.7.17-intel-2018.5.274
module load bio/FastQC/0.11.8-Java-1.8.0_191
module load bio/SAMtools/1.9-intel-2018.5.274
module load bio/SRA-Toolkit/2.9.6-centos_linux64

directory="/home/(user)"
reference="file"
sample="SRR1972917" #sample2=SRR1972918
#download data for sample
fastq-dump --split-files -X 100000 $sample

#runfastqc
fastqc -o qc ${sample}_1.fastq ${sample}_2.fastq

#runtrimmomatic
#trimmomatic is not available as a module
#trimmomatic PE ${sample}_1.fastq ${sample}_2.fastq trimmed_1.fastq unpaired_1.fastq trimmed_2.fastq unpaired_2.fastq ILLUMINACLIP:adapters.fa:2:30:10 LEADING:20 TRAILING:20 AVGQUAL:20 MINLEN:20

#redo fastqc on trimmed files
#fastqc -o qc trimmed_1.fastq trimmed_2.fastq

#alignment with BWA
bwa mem -R \
"@RG\tID:${sample}\tSM:${sample}\tPL:ILLUMINA\tLB:${sample}" \
/home/bqhs/ebola/AF086833.fa \
trimmed_1.fastq trimmed_2.fastq > ${sample}_raw.sam

#sort with Samtools
samtools sort ${sample}_raw.sam > ${sample}_sort.bam

#MarkDuplicates
picard MarkDuplicates -Xmx50g I=${sample}_sort.bam O=${sample}_dedup.bam M=${sample}_dedup.txt

#collect alignment metrics
picard CollectAlignmentSummaryMetrics -Xmx50g INPUT=${sample}_dedup.bam OUTPUT=${sample}_aln_metrics.txt REFERENCE_SEQUENCE=/home/bqhs/ebola/AF086833.fa

#base recalibration
#gatk BaseRecalibrator -R /home/bqhs/hg38/genome.fa -I ${sample}_dedup.bam --known-sites /home/bqhs/hg38/dbsnp_146.hg38.vcf.gz --known-sites /home/bqhs/hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf.gz -O recal.table

#bqsr application
#gatk ApplyBQSR -R /home/bqhs/hg38/genome.fa -I ${sample}_dedup.bam --bqsr-recal-file recal.table -O ${sample}_FINAL.bam

#index final bam file
samtools index ${sample}_dedup.bam

#Zaire 1976 dataset /home/bqhs/ebola/AF086833.fa
gatk HaplotypeCaller -R /home/bqhs/ebola/AF086833.fa -I ${sample}_dedup.bam -O ${sample}.g.vcf -ERC GVCF

gatk HaplotypeCaller -R /home/bqhs/ebola/AF086833.fa -I SRR1972918_dedup.bam -O SRR1972918.g.vcf -ERC GVCF

gatk CombineGVCFs -R /home/bqhs/ebola/AF086833.fa -V ${sample}.g.vcf -V SRR1972918.g.vcf -O combined.g.vcf

gatk GenotypeGVCFs -R /home/bqhs/ebola/AF086833.fa -V combined.g.vcf -O combined.vcf

gatk VariantFiltration -R /home/bqhs/ebola/AF086833.fa \
	-V combined.vcf \
	-O combined.filter.vcf \
	-filter "QUAL < 30.0 || DP < 10" \
	--filter-name lowQualDp

gatk GenotypeConcordance -CV combined.filter.vcf -TV /home/bqhs/ebola/ebola-samples.vcf -O ${sample}.filter.concordance.vcf -CS ${sample} -TS ${sample}
gatk GenotypeConcordance -CV combined.filter.vcf -TV /home/bqhs/ebola/ebola-samples.vcf -O SRR1972918.filter.concordance.vcf -CS SRR1972918 -TS SRR1972918

snpEff ann AF086833 -v \
-c /home/bqhs/miniconda2/share/snpeff-4.3.1t-1/snpEff.config \
-s snpeffrept.html combined.filter.vcf > annotated.combined.filter.vcf

SnpSift extractFields annotated.combined.filter.vcf CHROM POS ID AF | head
