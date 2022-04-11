#!/bin/bash
#SBATCH --job-name=MacnutBusco # Name for your job
#SBATCH --account=macnut_genome
#SBATCH --tasks-per-node=1 # Number of tasks when using MPI. Default is 1
#SBATCH --cpus-per-task=1 # Number of cores requested, Default is 1 (total cores requested = tasks x cores)
#SBATCH --nodes=1 # Number of nodes to spread cores across - default is 1 - if you are not using MPI this should likelybe 1
#SBATCH --mem=2G # max amount of memory per node you require in MB (default) G (gigabyte)
##SBATCH --core-spec=0 ## Uncomment to allow jobs to request all cores on a node
#SBATCH -t 43200 # Runtime in minutes. Default is 10 minutes. The Maximum runtime currently is 72 hours, 4320 minutes -requests over that time will not run
#SBATCH -p macnut_genome # Partition to submit to the standard compute node partition(community.q) or the large memory nodepartition(lm.q)
#SBATCH -e /home/bjarne/%x-%A_%a.err # Standard err goes to this file
#SBATCH --mail-user bjarne@hawaii.edu # this is the email you wish tobe notified at
#SBATCH --mail-type ALL # this specifies what events you should get an email about ALL will alert you of jobbeginning,completion, failure etc
#module load bio/BLAST+/2.2.31
module load tools/Singularity/3.6.1
#singularity exec -e /home/bjarne/busco.simg busco \
#	--list-datasets \
singularity exec -e /home/bjarne/buscov5.simg busco \
	-m transcriptome \
	-i mod.SRR10424518_trinity.fa \
	-o SRR10424518_trinity_busco \
	-l eudicots_odb10 \
	-f
# singularity exec -e /home/bjarne/buscov5.simg busco \
# 	-m transcriptome \
# 	-i mod.SRR10424519_trinity.fa \
# 	-o SRR10424519_trinity_busco \
# 	-l eudicots_odb10 \
# 	-f
# singularity exec -e /home/bjarne/buscov5.simg busco \
# 	-m transcriptome \
# 	-i mod.SRR10424520_trinity.fa \
# 	-o SRR10424520_trinity_busco \
# 	-l eudicots_odb10 \
# 	-f
# singularity exec -e /home/bjarne/buscov5.simg busco \
# 	-m transcriptome \
# 	-i mod.SRR10424521_trinity.fa \
# 	-o SRR10424521_trinity_busco \
# 	-l eudicots_odb10 \
# 	-f
# singularity exec -e /home/bjarne/buscov5.simg busco \
# 	-m transcriptome \
# 	-i mod.SRR10424522_trinity.fa \
# 	-o SRR10424522_trinity_busco \
# 	-l eudicots_odb10 \
# 	-f
# singularity exec -e /home/bjarne/buscov5.simg busco \
# 	-m transcriptome \
# 	-i mod.all_trinity.fa \
# 	-o all_trinity_busco \
# 	-l eudicots_odb10 \
# 	-f
