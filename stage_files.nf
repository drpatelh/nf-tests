process STAGE_FILES {
    container "quay.io/biocontainers/wget:1.20.1"

    output:
    path "*.bam", emit: bam

    script:
    """
    wget -L https://raw.githubusercontent.com/nf-core/test-datasets/modules/data/genomics/homo_sapiens/illumina/bam/test.paired_end.sorted.bam
    """
}