#!/bin/bash
## This needs to be run from the directory where the individual folder containing fastq for each sample is 
## This code was run inside a conda environment with salmon installed 



for dir in `ls`
do
	if [ -d "$dir" ]; then
		#echo "Printing what value is passed to dir"
		echo "$dir"
		ar=(`ls ./$dir/*.fq.gz`)
		echo "No of fastq in this sample is: ${#ar[*]}"
		if [[ ${#ar[*]} == 2 ]]; then
			sorted_array=( $(IFS=$'\n'; echo "${ar[*]}" | sort) )
			echo "No of fastq is 2"
			echo ${sorted_array[0]}
			echo ${sorted_array[1]}
			echo salmon quant --libType A -i /Users/siddhaduio.no/Desktop/All_omics_tools/Homo_sapiens.GRCh38.cdna.index/ -1 ${sorted_array[0]} -2 ${sorted_array[1]} -p 8 --validateMappings -o ./$dir >> salmon_bash_script.sh
		else
			if [[ ${#ar[*]} == 4 ]]; then
				sorted_array=( $(IFS=$'\n'; echo "${ar[*]}" | sort) )
				echo "No of fastq is 4"
				echo ${sorted_array[0]}
				echo ${sorted_array[1]}
				echo ${sorted_array[2]}
				echo ${sorted_array[3]}
				echo salmon quant --libType A -i /Users/siddhaduio.no/Desktop/All_omics_tools/Homo_sapiens.GRCh38.cdna.index/ -1 ${sorted_array[0]} -1 ${sorted_array[2]} -2 ${sorted_array[1]} -2 ${sorted_array[3]} -p 8 --validateMappings -o ./$dir >> salmon_bash_script.sh
			fi
		fi		
			
		
		
		
		
	fi
	
done
