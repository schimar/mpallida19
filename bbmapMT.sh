#! /bin/bash



module load jdk/1.8.0_45

ncpus=12

shopt -s nullglob

fq1=( fq/460*/460*R1*.fq )
fq2=( fq/460*/460*R2*.fq ) 

for i in {0..16}; do
	id=$( echo ${fq1[$i]} | cut -f1 -d'.' | cut -f3 -d'/' | cut -f1,2 -d'_' )
	echo $id
	sysconfcpus -n $ncpus "${bbpth}"bbmap.sh -Xmx110g t=12 ref=bbmap/mt/92010/92010_songxin.fa in1=${fq1[$i]} in2=${fq2[$i]} out=bbmap/mt/92010/id90/${id}.sam minid=0.90 rgid=$id rglb=igaRNA rgsm=$id rgpl=ILLUMINA

done

