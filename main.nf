#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { GATK4_BASERECALIBRATOR } from './modules/nf-core/modules/gatk4/baserecalibrator/main'

workflow {

    input = [ 
        [ id:'test' ],
        file(params.bam, checkIfExists: true),
        file(params.bai, checkIfExists: true),
        []
    ]

    GATK4_BASERECALIBRATOR (
        input,
        params.fasta,
        params.fai,
        params.dict,
        params.sites_vcfs ? params.sites_vcfs.tokenize(',').collect { file(it) } : [],
        params.sites_tbis ? params.sites_tbis.tokenize(',').collect { file(it) } : []
    )

}