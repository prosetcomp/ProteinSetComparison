#!/bin/bash

#backup data and normalized data
x=`date +%m%d%y`
mkdir "../backupfiles/normalized_data/backup$x"
mv ../normalized_data/*.tsv "../backupfiles/normalized_data/backup$x"
mkdir "../backupfiles/data/backup$x"
mv ../data/* "../backupfiles/data/backup$x"
mv ../backupfiles/data/backup$x/GET_DATA ./
mv ../backupfiles/data/backup$x/production_script.sh ./

#get data
sh ./GET_DATA

#new normalized data generation
sh ../GENERATE_PL

#quality check 40 log to production.$x.log 
perl ../quality/quality_check1.pl
sh ../quality/quality_check2

#check production.$x.log
q1=`ls -l ../quality/qualitycheck1 | awk '{ if ($5>0) print $9}'`
q2=`ls -l ../quality/qualitycheck2 | awk '{ if ($5>0) print $9}'`

if [ -z "$q1" ] && [ -z "$q2" ];
then
	sh ../sqlscripts/db.sh
	sh ../sqlscripts/loadscr1.sh
	sh ../sqlscripts/loadscr2.sh
	sh ../sqlscripts/load_procedures.sh
else
	echo "quality checks failed."
	echo $q1
	echo $q2	
fi



	


