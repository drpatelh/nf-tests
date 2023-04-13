#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

process TSV_FROM_LIST {
    executor 'local'

    input:
    val tsv_data // [ 'foo', 'bar' ]

    output:
    path "*.tsv"

    exec:
    def contents = ""
    if (tsv_data.size() > 0) {
        contents += tsv_data.join('\n')
    }

    def out_file = task.workDir.resolve("test.tsv")
    out_file.text = contents
}

workflow {
    Channel.of( 'foo', 'bar' ) | collect | TSV_FROM_LIST
}