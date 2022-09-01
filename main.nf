#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

Channel
    .fromPath("*.csv")
    .set { ch_input }

ch_input
    .mix(ch_input)
    .collect()
    .set { ch_input }

include { ECHO_PATH } from './echo_path'

workflow {

    ECHO_PATH (
        ch_input
    )

}