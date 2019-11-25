#! /bin/bash

for i in *.sorted.bam; do
	idPth=$( echo $i | cut -f1 -d'.' )
	echo $idPth 
	java -jar ~/bio/picard.jar MarkDuplicates I= $i O= ${idPth}.markDup.sorted.bam READ_NAME_REGEX= null M= ${idPth}.marked_dup_metrics.txt
done
