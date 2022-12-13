*Q1: How many positions are found in this region in the VCF file?*  
 - 69


*Q2: How many samples are included in the VCF file?*  

 ```bcftools stats CEU.exon.2010_03.genotypes.vcf.gz```
- 90 

*Q3: How many positions are there total in the VCF file?*

 ```bcftools stats CEU.exon.2010_03.genotypes.vcf.gz```
- 3489 

*Q4: How many positions are there with AC=1?*

```bcftools query -i'AC=1' -f'%CHROM %POS %QUAL %DP\n' CEU.exon.2010_03.genotypes.vcf.gz | wc -l```
- 1075


*Q5: What is the ratio of transitions to transversions (ts/tv) in this file?*  

- ts/tv = 3.47

*Q6: What is the median number of variants per sample in this data set?*  

