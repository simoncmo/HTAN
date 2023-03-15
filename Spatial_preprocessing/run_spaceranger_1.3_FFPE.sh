#!/bin/bash

# General Spaceranger processing pipeline for Visium FFPE samples
# References: https://support.10xgenomics.com/spatial-gene-expression/software/pipelines/latest/what-is-space-ranger

sample="SampleID"
libraryName="LibraryName"
TIFF_image="/PATH/TO/TIFF_file.tif"
SLIDE_SERIAL_ID="serial_ID" # e.g. V10N12-111
AREA="slide_area" # A1,B1, C1 or D1. https://support.10xgenomics.com/spatial-gene-expression/software/pipelines/latest/using/slide-info
datadirectory="/PATH/TO/fastq/directory/"
reference="/PATH/TO/refdata-gex-GRCh38-2020-A" # https://support.10xgenomics.com/spatial-gene-expression/software/pipelines/latest/installation
probeset="/PATH/TO/Visium_Human_Transcriptome_Probe_Set_v1.0_GRCh38-2020-A.csv" # https://support.10xgenomics.com/spatial-gene-expression-ffpe/probe-sets/Visium-Human-Transcriptome-Probe-Set-v1-0-GRCh38-2020-A

spaceranger count --id=${sample} --transcriptome=${reference} --fastqs=${datadirectory} --sample=${sample2} --image=${TIF_IMAGE} --slide=${SLIDE_SERIAL_ID} --area=${AREA} --reorient-images --localcores=32 --localmem=150


spaceranger count --id=${sample} \
                   --transcriptome=${reference} \
                   --probe-set=${probeset} \
                   --fastqs=${datadirectory} \
                   --sample=${libraryName} \
                   --image=${TIFF_image} \
                   --slide=${SLIDE_SERIAL_ID} \
                   --area=${AREA} \
                   --reorient-images \
                   --localcores=8 \
                   --localmem=64
