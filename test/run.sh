#!/bin/bash

echo "docker run -v $PWD:$PWD -w $PWD/job_0 liefeld/aa:2 /genepatt/run_aa_script.sh GRCh37  $PATH/data/mosek.lic $PWD/data/pdx-tumor_BT084_XP1_629_merged.mdup.bam $PWD/data/BT084_XP1_629_AA_CNV_SEEDS.bed out $PWD/data/pdx-tumor_BT084_XP1_629_merged.mdup.bam.bai 0 "

docker run -v $PWD:$PWD -w $PWD/job_0 liefeld/aa:2 /genepatt/run_aa_script.sh GRCh37  $PATH/data/mosek.lic $PWD/data/pdx-tumor_BT084_XP1_629_merged.mdup.bam $PWD/data/BT084_XP1_629_AA_CNV_SEEDS.bed out $PWD/data/pdx-tumor_BT084_XP1_629_merged.mdup.bam.bai 0

# docker run -v $PWD:$PWD -w $PWD/job_0 -it liefeld/aa:2 bash

