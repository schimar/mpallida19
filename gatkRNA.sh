#! /bin/bash

module load jdk/1.8.0_45
module load python/3.6.3


java -Xmx256g -jar ${gatkPth}gatk-package-4.1.2.0-local.jar HaplotypeCaller -R ref/Mpallida_transcriptome_final.fasta -mbq 17 -I mybbam.bam -O mpal17rna.vcf 

