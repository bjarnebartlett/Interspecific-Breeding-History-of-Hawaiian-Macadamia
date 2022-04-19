#!/bin/bash
mkdir ~/vcftools
SUBSET_VCF=/Volumes/My\ Book/MT1_var.vcf.gz
OUT=~/vcftools/MT1_subset
vcftools --gzvcf $SUBSET_VCF --freq2 --out $OUT --max-alleles 2
vcftools --gzvcf $SUBSET_VCF --depth --out $OUT
vcftools --gzvcf $SUBSET_VCF --site-mean-depth --out $OUT
vcftools --gzvcf $SUBSET_VCF --site-quality --out $OUT
vcftools --gzvcf $SUBSET_VCF --missing-indv --out $OUT
vcftools --gzvcf $SUBSET_VCF --missing-site --out $OUT
vcftools --gzvcf $SUBSET_VCF --het --out $OUT
