#!/bin/bash
#SBATCH --job-name=MacnutTrinity # Name for your job
#SBATCH --account=macnut_genome
#SBATCH --tasks-per-node=1 # Number of tasks when using MPI. Default is 1
#SBATCH --cpus-per-task=4 # Number of cores requested, Default is 1 (total cores requested = tasks x cores)
#SBATCH --nodes=1 # Number of nodes to spread cores across - default is 1 - if you are not using MPI this should likelybe 1
#SBATCH --mem=12G # max amount of memory per node you require in MB (default) G (gigabyte)
##SBATCH --core-spec=0 ## Uncomment to allow jobs to request all cores on a node
#SBATCH -t 43200 # Runtime in minutes. Default is 10 minutes. The Maximum runtime currently is 72 hours, 4320 minutes -requests over that time will not run
#SBATCH -p macnut_genome # Partition to submit to the standard compute node partition(community.q) or the large memory nodepartition(lm.q)
#SBATCH -e /home/bjarne/%x-%A_%a.err # Standard err goes to this file
#SBATCH --mail-user bjarne@hawaii.edu # this is the email you wish tobe notified at
#SBATCH --mail-type ALL # this specifies what events you should get an email about ALL will alert you of jobbeginning,completion, failure etc
mkdir /home/bjarne/kantar_lts/bjarne/rsem_outdir_18
#module load tools/Singularity/3.1.1
module load bio/Bowtie2/2.3.4.2-intel-2018.5.274
module load bio/Bowtie/1.2.2-foss-2018b
module load bio/SAMtools/1.9-intel-2018.5.274
module load bio/Trinity/2.9.1-intel-2018.5.274
module load bio/Trinotate/3.2.2-intel-2018.5.274
module load bio/RSEM/1.3.3-intel-2018.5.274
# singularity exec -e /home/bjarne/trinityrnaseq.v2.11.0.simg  Trinity \
#           --seqType fq \
#           --samples_file /home/bjarne/kantar_lts/bjarne/MacnutSamples2.txt  \
#           --max_memory 40G --CPU 3 \
#           --output /home/bjarne/kantar_lts/bjarne/Trinity_19/
/home/bjarne/trinityrnaseq-v2.13.2/util/align_and_estimate_abundance.pl --transcripts /home/bjarne/kantar_lts/bjarne/19.fasta --seqType fq --left /home/bjarne/kantar_lts/bjarne/SRR10424519.sra_1.fastq --right /home/bjarne/kantar_lts/bjarne/SRR10424519.sra_2.fastq --est_method RSEM --aln_method bowtie --trinity_mode --prep_reference --output_dir /home/bjarne/kantar_lts/bjarne/rsem_outdir_19
/home/bjarne/trinityrnaseq-v2.13.2/util/align_and_estimate_abundance.pl --transcripts /home/bjarne/kantar_lts/bjarne/20.fasta --seqType fq --left /home/bjarne/kantar_lts/bjarne/SRR10424520.sra_1.fastq --right /home/bjarne/kantar_lts/bjarne/SRR10424520.sra_2.fastq --est_method RSEM --aln_method bowtie --trinity_mode --prep_reference --output_dir /home/bjarne/kantar_lts/bjarne/rsem_outdir_20
/home/bjarne/trinityrnaseq-v2.13.2/util/align_and_estimate_abundance.pl --transcripts /home/bjarne/kantar_lts/bjarne/21.fasta --seqType fq --left /home/bjarne/kantar_lts/bjarne/SRR10424521.sra_1.fastq --right /home/bjarne/kantar_lts/bjarne/SRR10424521.sra_2.fastq --est_method RSEM --aln_method bowtie --trinity_mode --prep_reference --output_dir /home/bjarne/kantar_lts/bjarne/rsem_outdir_21
/home/bjarne/trinityrnaseq-v2.13.2/util/align_and_estimate_abundance.pl --transcripts /home/bjarne/kantar_lts/bjarne/22.fasta --seqType fq --left /home/bjarne/kantar_lts/bjarne/SRR10424522.sra_1.fastq --right /home/bjarne/kantar_lts/bjarne/SRR10424522.sra_2.fastq --est_method RSEM --aln_method bowtie --trinity_mode --prep_reference --output_dir /home/bjarne/kantar_lts/bjarne/rsem_outdir_22
