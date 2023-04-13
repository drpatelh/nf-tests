#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

process FOO {
    executor 'local'
    debug 'true'

    exec:
    def contents = 'bar'
    def out_file = task.workDir.resolve("foo.txt")
    out_file.text = contents
}

workflow {
    FOO()
}