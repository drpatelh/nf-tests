#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

process FOO {
    executor 'local'

    exec:
    def x = 1
}

workflow {
    FOO()
}