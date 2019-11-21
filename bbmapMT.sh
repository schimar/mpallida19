#! /bin/bash

#PBS -l walltime=72:00:00
#PBS -l mem=110gb,ncpus=12

#PBS -m e
#PBS -M schimar@gmail.com

#PBS -N mpalbbmp 

#PBS -o bbmapmpal.o
#PBS -e bbmapmpal.e 

#echo Running on host 'hostname'
#echo Time is 'date'
#echo Directory is 'pwd'

module load jdk/1.8.0_45
#module load python/3.6.3

WORKDIR='/scratch/uibk/c7701188/mpallida/'
cd $WORKDIR
bbpth='/home/uibk/c7701188/bio/bbmap/'
ncpus=12

shopt -s nullglob

fq1=( fq/460*/460*R1*.fq )
fq2=( fq/460*/460*R2*.fq ) 

for i in {0..16}; do
	#id=$(echo $i | cut -f2 -d'/')
	id=$( echo ${fq1[$i]} | cut -f1 -d'.' | cut -f3 -d'/' | cut -f1,2 -d'_' )
	echo $id
	#sysconfcpus -n $ncpus "${bbpth}"bbmap.sh -Xmx110g t=12 ref=bbmap/mt/92010/92010_songxin.fa in1=${fq1[$i]} in2=${fq2[$i]} out=bbmap/mt/92010/id80/${id}.sam minid=0.80 rgid=$id rglb=igaRNA rgsm=$id rgpl=ILLUMINA		#nodisk 
	#sysconfcpus -n $ncpus "${bbpth}"bbmap.sh -Xmx110g t=12 ref=bbmap/mt/92010/92010_songxin.fa in1=${fq1[$i]} in2=${fq2[$i]} out=bbmap/mt/92010/id85/${id}.sam minid=0.85 rgid=$id rglb=igaRNA rgsm=$id rgpl=ILLUMINA
	#sysconfcpus -n $ncpus "${bbpth}"bbmap.sh -Xmx110g t=12 ref=bbmap/mt/92010/92010_songxin.fa in1=${fq1[$i]} in2=${fq2[$i]} out=bbmap/mt/92010/id90/${id}.sam minid=0.90 rgid=$id rglb=igaRNA rgsm=$id rgpl=ILLUMINA
	sysconfcpus -n $ncpus "${bbpth}"bbmap.sh -Xmx110g t=12 ref=bbmap/mt/92010/92010_songxin.fa in1=${fq1[$i]} in2=${fq2[$i]} out=bbmap/mt/92010/id95/${id}.sam minid=0.95 rgid=$id rglb=igaRNA rgsm=$id rgpl=ILLUMINA

done

