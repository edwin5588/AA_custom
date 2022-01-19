#!/bin/bash


MOSEKLM_LICENSE_FILE=/home/programs/mosek/8/licenses
export MOSEKLM_LICENSE_FILE
AA_DATA_REPO=/home/data_repo
export AA_DATA_REPO
DOWNSAMPLE=$7
export DOWNSAMPLE


python2 AA/AmpliconArchitect.py --bam testdata/FF-1.cs.bam --bed testdata/FF-1_GRCh38_AA_CNV_SEEDS.bed --out output/FF-1 --ref GRCh38 --downsample -1
python2 AA/AmpliconArchitect.py --bam testdata/FF-10.cs.bam --bed testdata/FF-10_GRCh38_AA_CNV_SEEDS.bed --out output/FF-10 --ref GRCh38 --downsample -1
python2 AA/AmpliconArchitect.py --bam testdata/FF-11.cs.bam --bed testdata/FF-11_GRCh38_AA_CNV_SEEDS.bed --out output/FF-11 --ref GRCh38 --downsample -1
python2 AA/AmpliconArchitect.py --bam testdata/FF-12.cs.bam --bed testdata/FF-12_GRCh38_AA_CNV_SEEDS.bed --out output/FF-12 --ref GRCh38 --downsample -1
python2 AA/AmpliconArchitect.py --bam testdata/FF-13.cs.bam --bed testdata/FF-13_GRCh38_AA_CNV_SEEDS.bed --out output/FF-13 --ref GRCh38 --downsample -1
python2 AA/AmpliconArchitect.py --bam testdata/FF-16.cs.bam --bed testdata/FF-16_GRCh38_AA_CNV_SEEDS.bed --out output/FF-16 --ref GRCh38 --downsample -1
python2 AA/AmpliconArchitect.py --bam testdata/FF-17.cs.bam --bed testdata/FF-17_GRCh38_AA_CNV_SEEDS.bed --out output/FF-17 --ref GRCh38 --downsample -1
python2 AA/AmpliconArchitect.py --bam testdata/FF-18.cs.bam --bed testdata/FF-18_GRCh38_AA_CNV_SEEDS.bed --out output/FF-18 --ref GRCh38 --downsample -1
python2 AA/AmpliconArchitect.py --bam testdata/FF-19.cs.bam --bed testdata/FF-19_GRCh38_AA_CNV_SEEDS.bed --out output/FF-19 --ref GRCh38 --downsample -1
python2 AA/AmpliconArchitect.py --bam testdata/FF-20.cs.bam --bed testdata/FF-20_GRCh38_AA_CNV_SEEDS.bed --out output/FF-20 --ref GRCh38 --downsample -1
python2 AA/AmpliconArchitect.py --bam testdata/FF-21.cs.bam --bed testdata/FF-21_GRCh38_AA_CNV_SEEDS.bed --out output/FF-21 --ref GRCh38 --downsample -1
python2 AA/AmpliconArchitect.py --bam testdata/FF-22.cs.bam --bed testdata/FF-22_GRCh38_AA_CNV_SEEDS.bed --out output/FF-22 --ref GRCh38 --downsample -1
python2 AA/AmpliconArchitect.py --bam testdata/FF-23.cs.bam --bed testdata/FF-23_GRCh38_AA_CNV_SEEDS.bed --out output/FF-23 --ref GRCh38 --downsample -1
python2 AA/AmpliconArchitect.py --bam testdata/FF-24.cs.bam --bed testdata/FF-24_GRCh38_AA_CNV_SEEDS.bed --out output/FF-24 --ref GRCh38 --downsample -1
python2 AA/AmpliconArchitect.py --bam testdata/FF-27.cs.bam --bed testdata/FF-27_GRCh38_AA_CNV_SEEDS.bed --out output/FF-27 --ref GRCh38 --downsample -1
python2 AA/AmpliconArchitect.py --bam testdata/FF-101.cs.bam --bed testdata/FF-101_GRCh38_AA_CNV_SEEDS.bed --out output/FF-101 --ref GRCh38 --downsample -1
python2 AA/AmpliconArchitect.py --bam testdata/FF-104.cs.bam --bed testdata/FF-104_GRCh38_AA_CNV_SEEDS.bed --out output/FF-104 --ref GRCh38 --downsample -1
python2 AA/AmpliconArchitect.py --bam testdata/FF-105.cs.bam --bed testdata/FF-105_GRCh38_AA_CNV_SEEDS.bed --out output/FF-105 --ref GRCh38 --downsample -1
python2 AA/AmpliconArchitect.py --bam testdata/FF-109.cs.bam --bed testdata/FF-109_GRCh38_AA_CNV_SEEDS.bed --out output/FF-109 --ref GRCh38 --downsample -1