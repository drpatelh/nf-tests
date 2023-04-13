#!/usr/bin/env nextflow

process foo {
    executor 'local'

    debug true
    
    input: 
    path x
    
    """
    echo $x
    """
}

workflow {
    Channel.fromPath('s3://rnaseq-nf/data/ggal/transcript.fa') | foo 
}