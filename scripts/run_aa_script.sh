#!/bin/bash


tar -xf /genepatt/data_repo/$1.tar.gz --directory /genepatt
cp $2 /genepatt/programs/mosek/8/licenses/
cp $2 /genepatt/programs/mosek/

MOSEKLM_LICENSE_FILE=/genepatt/programs/mosek/8/licenses
export MOSEKLM_LICENSE_FILE
AA_DATA_REPO=/genepatt/data_repo
export AA_DATA_REPO
export DOWNSAMPLE
DOWNSAMPLE = $7

BAMFILE=$3
bambase="$(basename -- $BAMFILE)"
bampath="$(dirname -- $BAMFILE)"
BEDFILE=$4
bedbase="$(basename -- $BEDFILE)"
bedpath="$(dirname -- $BEDFILE)"
BAIFILE=$6
baibase="$(basename -- $BAIFILE)"
baipath="$(dirname -- $BAIFILE)"

#mv $3 /genepatt/input/
#mv $4 /genepatt/input/
#mv $6 /genepatt/input/

bam="$bampath/$bambase"
bed="$bedpath/$bedbase"
bai="$baipath/$baibase"


python2 /genepatt/AA/AmpliconArchitect.py --bam $bam --bed $bed --out $5 --ref /genepatt/${1}
