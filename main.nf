#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

if (params.input) { ch_input = Channel.fromPath(params.input, checkIfExists: true) } else { exit 1, 'Input file not specified!' }

include { ECHO_PATH } from './echo_path'

workflow {

    ECHO_PATH (
        ch_input
    )

}