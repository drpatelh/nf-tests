#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { STAGE_FILES    } from './stage_files'
include { BAMTOOLS_SPLIT } from './bamtools_split'

workflow {

    STAGE_FILES ()

    BAMTOOLS_SPLIT (
        STAGE_FILES.out.bam
    )

    BAMTOOLS_SPLIT
        .out
        .bam
        .view()

}