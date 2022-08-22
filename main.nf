#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

Channel
    .fromPath("${projectDir}/input/sgRNA_pools/Pool*.csv")
    .map {
        [
            it.toString().replaceAll("(.*)/sgRNA_pools/(.*).csv", "\$2"),
            it
        ]
    }
    .dump(tag: 'pools')
    .set { ch_pools }

process REFORMAT_POOL {

    tag { pool }

    executor "local"

    input:
    tuple val(pool), path(csv)

    output:
    tuple val(pool), path("*control.txt")
        
    script:
    """
    cat "${csv}" \
        | grep -i nonTarget \
        | awk -F "," '{ print \$1 }' \
        | sort \
        | uniq \
        > "${pool}_control.txt"
    """
}

workflow {

      REFORMAT_POOL ( ch_pools )

      REFORMAT_POOL
        .out
        .view()
}
