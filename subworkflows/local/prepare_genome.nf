//
// Uncompress and prepare reference genome files
//

include { GUNZIP as GUNZIP_FASTA        } from '../../modules/nf-core/gunzip/main'
include { GUNZIP as GUNZIP_GFF          } from '../../modules/nf-core/gunzip/main'
include { UNTAR as UNTAR_BOWTIE2_INDEX  } from '../../modules/nf-core/untar/main'
include { BOWTIE2_BUILD                 } from '../../modules/nf-core/bowtie2/build/main'
include { CUSTOM_GETCHROMSIZES          } from '../../modules/nf-core/custom/getchromsizes/main'

workflow PREPARE_GENOME {
    main:

    ch_versions = Channel.empty()

    //
    // Uncompress genome fasta file if required
    //
    if (params.fasta.endsWith('.gz')) {
        GUNZIP_FASTA (
            [ [:], params.fasta ]
        )
        ch_fasta    = GUNZIP_FASTA.out.gunzip.map { it[1] }
        ch_versions = ch_versions.mix(GUNZIP_FASTA.out.versions)
    } else {
        ch_fasta = Channel.value(file(params.fasta))
    }
    println(ch_fasta)
    ch_fasta.view()

    //.first()


    

    // //
    // // Uncompress GFF annotation file
    // //
    // if (params.gff) {
    //     if (params.gff.endsWith('.gz')) {
    //         GUNZIP_GFF (
    //             [ [:], params.gff ]
    //         )
    //         ch_gff      = GUNZIP_GFF.out.gunzip.map { it[1] }
    //         ch_versions = ch_versions.mix(GUNZIP_GFF.out.versions)
    //     } else {
    //         ch_gff = Channel.of(file(params.gff))
    //     }
    // } else {
    //     ch_gff = []
    // }

    // //
    // // Create chromosome sizes file
    // //
    // CUSTOM_GETCHROMSIZES (
    //     ch_fasta.map { [ [:], it ] }
    // )
    // ch_fai         = CUSTOM_GETCHROMSIZES.out.fai.map { it[1] }
    // ch_chrom_sizes = CUSTOM_GETCHROMSIZES.out.sizes.map { it[1] }
    // ch_versions    = ch_versions.mix(CUSTOM_GETCHROMSIZES.out.versions)

    // //
    // // Prepare reference files required for variant calling
    // //
    // ch_bowtie2_index = Channel.empty()
    // if (params.bowtie2_index) {
    //     if (params.bowtie2_index.endsWith('.tar.gz')) {
    //         UNTAR_BOWTIE2_INDEX (
    //             [ [:], params.bowtie2_index ]
    //         )
    //         ch_bowtie2_index = UNTAR_BOWTIE2_INDEX.out.untar.map { it[1] }
    //         ch_versions      = ch_versions.mix(UNTAR_BOWTIE2_INDEX.out.versions)
    //     } else {
    //         ch_bowtie2_index = Channel.of(file(params.bowtie2_index))
    //     }
    // } else {
    //     BOWTIE2_BUILD (
    //         ch_fasta.map { [ [:], it ] }
    //     )
    //     ch_bowtie2_index = BOWTIE2_BUILD.out.index
    //     ch_versions      = ch_versions.mix(BOWTIE2_BUILD.out.versions)
    // }

    emit:
    fasta         = ch_fasta // path: genome.fasta
    // gff           = ch_gff           // path: genome.gff
    // fai           = ch_fai           // path: genome.fai
    // chrom_sizes   = ch_chrom_sizes   // path: genome.sizes
    // bowtie2_index = ch_bowtie2_index // path: bowtie2/index/

}
