#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

params.input = 's3://ngi-igenomes/test-data/demultiplex/miseq_35147139.tar.gz'

process UNTAR {
    cpus 12
    memory 72.GB
    time 16.h

    container "nfcore/bcl2fastq:2.20.0.422"

    input:
    path run_dir

    output:
    path "InterOp/*.bin", emit: interop

    script:
    untar_dir = run_dir.toString().endsWith(".tar.gz") ? run_dir.toString() - '.tar.gz' : run_dir
    """
    tar -xzvf $run_dir

    cp -r $untar_dir/InterOp .
    """
}

workflow {
    UNTAR ( params.input )
}

