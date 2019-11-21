#! /bin/bash

#PBS -l walltime=240:00:00
#PBS -l mem=220gb,ncpus=24

#PBS -m e
#PBS -M schimar@gmail.com

#PBS -N bbforthewin

#PBS -o bbvars85.o
#PBS -e bbvars85.e 

module load jdk/1.8.0_45
module load samtools-1.6-gcc-4.8-lcsoxia 
module load sambamba/0.7.0

WORKDIR='/scratch/uibk/c7701188/mpallida/bbmap/mt/92010/id80/'
cd $WORKDIR
bbpth='/home/uibk/c7701188/bio/bbmap/'
ncpus=24

shopt -s nullglob

## variant calling with quality score recalibration 

sysconfcpus -n $ncpus "${bbpth}"callvariants.sh -Xmx220g -Xms220g t=24 list=ids85.list ref=../../../../ref/Talp.v1.0.assembly.fasta ploidy=2 multisample out=bbvars.vcf 

sysconfcpus -n $ncpus "${bbpth}"calctruequality.sh -Xms220g -Xmx220g vcf=bbvars_initial.vcf ref=../../ref/Talp.v1.0.assembly.fasta in=460_92360.sorted.bam 460_92361.sorted.bam 460_92362.sorted.bam 460_92363.sorted.bam 460_92364.sorted.bam 460_92365.sorted.bam 460_92366.sorted.bam 460_92367.sorted.bam 460_92368.sorted.bam 460_92369.sorted.bam 460_92370.sorted.bam 460_92371.sorted.bam 460_92372.sorted.bam 460_92373.sorted.bam 460_92374.sorted.bam 460_92375.sorted.bam 460_92376.sorted.bam


for i in *.sorted.bam; do 
	stm=${i%.sorted.bam}
	#stm=${instm##*/}
	echo $stm
	sysconfcpus -n $ncpus "${bbpth}"bbduk.sh -Xmx220g -Xms220g in=$i out=${stm}.recal.sam 
done
#
ls *.recal.sam > ids85.recal.list
#
sysconfcpus -n $ncpus "${bbpth}"callvariants.sh -Xmx220g -Xms220g t=24 list=ids85.recal.list ref=../../../../ref/Talp.v1.0.assembly.fasta ploidy=2 multisample out=bbvars_final.vcf 


