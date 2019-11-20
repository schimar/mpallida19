#! /bin/bash


shopt -s nullglob

for i in innsbruck_*/; do		#*001.fastq; do 
	fldr=$(echo $i | cut -f1 -d'/') 
	#echo $i		#fldr
	cd $fldr
	echo $fldr
	p1=( *R1*.fastq.gz )
	p2=( *R2*.fastq.gz )
	id=$( echo ${p1[0]} | cut -f1 -d'.' )
	#echo $id
	##mkdir ../../trmd/0408/$fldr
	skewer -m pe -Q 8 -t 8 ${p1[0]} ${p2[0]} -o ../../../trmd/0408/$fldr/$id
	cd ../ 
done



