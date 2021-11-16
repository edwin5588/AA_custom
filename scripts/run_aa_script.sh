#!/bin/bash


tar -xf /home/genepattern/data_repo/$1.tar.gz
cp $2 /home/genepattern/programs/mosek/8/licenses/
cp $2 /home/genepattern/programs/mosek/

MOSEKLM_LICENSE_FILE=/home/genepattern/programs/mosek/8/licenses
export MOSEKLM_LICENSE_FILE
AA_DATA_REPO=/home/genepattern/data_repo
export AA_DATA_REPO
export DOWNSAMPLE
DOWNSAMPLE = $7

BAMFILE=$3
bambase="$(basename -- $BAMFILE)"
BEDFILE=$4
bedbase="$(basename -- $BEDFILE)"
BAIFILE=$6
baibase="$(basename -- $BAIFILE)"

mv $3 /home/genepattern/input/
mv $4 /home/genepattern/input/
mv $6 /home/genepattern/input/

bam="/home/genepattern/input/$bambase"
bed="/home/genepattern/input/$bedbase"
bai="/home/genepattern/input/$baibase"


python2 /home/genepattern/AA/AmpliconArchitect.py --bam $bam --bed $bed --out $5 --ref $1
