#!/usr/bin/env nextflow

include { ECHO_ENV } from './echo_env'

workflow {
    ECHO_ENV ()
}