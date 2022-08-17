#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

if (params.input) { ch_input = file(params.input) } else { exit 1, 'Input samplesheet not specified!' }

include { ECHO_PATH as ECHO_PATH_1 } from './echo_path'
include { ECHO_PATH as ECHO_PATH_2 } from './echo_path'

workflow {

    ECHO_PATH_1 (
        ch_input
    )

    ECHO_PATH_2 (
        ch_input
    )

}