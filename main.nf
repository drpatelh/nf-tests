#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { PREPARE_GENOME } from './subworkflows/local/prepare_genome'

workflow {

    PREPARE_GENOME ()

    // FASTQ_ALIGN_BOWTIE2 (
    //         ch_variants_fastq,
    //         PREPARE_GENOME.out.bowtie2_index.collect(),
    //         params.save_unaligned,
    //         false,
    //         PREPARE_GENOME.out.fasta.collect()
    //     )

}