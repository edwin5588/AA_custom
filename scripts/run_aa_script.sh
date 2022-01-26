#!/bin/bash

mkdir -p $PWD/genome/$1

tar -xf /opt/genepatt/data_repo/$1.tar.gz --directory ${PWD}/genome/$1

# cp $2 /opt/genepatt/programs/mosek/8/licenses/
# cp $2 /opt/genepatt/programs/mosek/

MOSEKLM_LICENSE_FILE=$2
export MOSEKLM_LICENSE_FILE
AA_DATA_REPO=${PWD}/genome/
export AA_DATA_REPO
DOWNSAMPLE = $7
export DOWNSAMPLE

BAMFILE=$3
bambase="$(basename -- $BAMFILE)"
bampath="$(dirname -- $BAMFILE)"
BEDFILE=$4
bedbase="$(basename -- $BEDFILE)"
bedpath="$(dirname -- $BEDFILE)"
BAIFILE=$6
baibase="$(basename -- $BAIFILE)"
baipath="$(dirname -- $BAIFILE)"

bam="$bampath/$bambase"
bed="$bedpath/$bedbase"
bai="$baipath/$baibase"

mkdir ./.data
ln -s $BAMFILE ./.data/$bambase
ln -s $BAIFILE ./.data/$baibase

# assumes that the bai is next to the bam
python2 /opt/genepatt/AA/AmpliconArchitect.py --bam ./.data/$bambase  --bed $bed --out $5 --ref $PWD/genome/${1}

# python2 /opt/genepatt/AA/AmpliconArchitect.py --bam $bam --bed $bed --out $5 --ref $PWD/genome/${1}

# remove the genome so it does not show as an output
rm -rf ./genome


