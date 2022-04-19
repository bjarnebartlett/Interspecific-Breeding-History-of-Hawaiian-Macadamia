#!/bin/bash
# mkdir ~/vcftools2
# SUBSET_VCF=MTall_var.vcf
# OUT=~/vcftools/MTall_subset
# vcftools --gzvcf $SUBSET_VCF --freq2 --out $OUT --max-alleles 2
# vcftools --gzvcf $SUBSET_VCF --depth --out $OUT
# vcftools --gzvcf $SUBSET_VCF --site-mean-depth --out $OUT
# vcftools --gzvcf $SUBSET_VCF --site-quality --out $OUT
# vcftools --gzvcf $SUBSET_VCF --missing-indv --out $OUT
# vcftools --gzvcf $SUBSET_VCF --missing-site --out $OUT
# vcftools --gzvcf $SUBSET_VCF --het --out $OUT

VCF_IN=~/MTall_var.vcf
VCF_OUT=~/vcftools/MTall_full_filtered.vcf.gz

# set filters
MAF=0.4
MISS=0.49
QUAL=30
MIN_DEPTH=30
MAX_DEPTH=70

# move to the vcf directory
cd vcftools
# perform the filtering with vcftools
vcftools --gzvcf $VCF_IN \
--remove-indels --maf $MAF --max-missing $MISS --minQ $QUAL \
--min-meanDP $MIN_DEPTH --max-meanDP $MAX_DEPTH \
--minDP $MIN_DEPTH --maxDP $MAX_DEPTH --recode --stdout | gzip -c > \
$VCF_OUT
