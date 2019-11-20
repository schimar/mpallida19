#! /bin/bash
# 

#shopt -s nullglob
cd /media/schimar/schimar3/mpallida/mem/

for i in 460*/; do
    #file=$(echo $i | cut -f7 -d/)
	#id=$(echo $i | cut -f1 -d.)   # keep the path in id  (for output)
	cd $i
	id460=$( echo $i | cut -f1 -d$'/' )
	echo $id460
	fq=( *001.fq )
	#echo ${fq[@]}
	if [ ${#fq[@]} -ge 3 ] ; then 
		#echo ${fq[@]}
		n1=$( echo ${fq[0]} | cut -f1 -d$'.' )
		n2=$( echo ${fq[1]} | cut -f1 -d$'.' )
		n3=$( echo ${fq[2]} | cut -f1 -d$'.' )
		n4=$( echo ${fq[3]} | cut -f1 -d$'.' )
		#echo $n1
		#echo $n3
		paste <(paste - - - - < ${fq[0]}) <(paste - - - - < ${fq[1]}) | tr '\t' '\n' > ${id460}_004.fq
		paste <(paste - - - - < ${fq[2]}) <(paste - - - - < ${fq[3]}) | tr '\t' '\n' > ${id460}_007.fq
	else
		n1=$( echo ${fq[0]} | cut -f1 -d$'.' ) 
		n2=$( echo ${fq[1]} | cut -f1 -d$'.' )
		paste <(paste - - - - < ${fq[0]}) <(paste - - - - < ${fq[1]}) | tr '\t' '\n' > ${id460}.fq
		#n1gr=$( echo $n1 | grep 'L004' )
		#echo $n1gr
	fi
	cd ..
done

#echo "${#distro[@]}"

