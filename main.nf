#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

process tailInput {

    publishDir "${params.outdir}/tail", mode: 'copy'

    container 'ubuntu:20.04'

    input:
    path csv
    val num_lines

    output:
    path "*.csv"

    script:
    """
    head -n 1 $csv > output.csv
    cat $csv | tail -n $num_lines >> output.csv
    """
}

process summarizeInput {

    publishDir "${params.outdir}/summarize", mode: 'copy'

    // See: https://quay.io/repository/biocontainers/pandas?tag=latest&tab=tags
    container 'quay.io/biocontainers/pandas:1.1.5'

    input:
    path csv

    output:
    path "summary.csv"

    script: 
    // `summarize.py` can be found in the bin/ directory in the root of the repo
    // Nextflow will automatically load this into $PATH when running the pipeline
    // Ensure the first line of this script is a shebang - in this case for Python i.e. `#!/usr/bin/env python3`
    """
    summarize.py $csv
    """
}

workflow {

    ch_input = file(params.input, checkIfExists: true)
    tailInput(ch_input, params.num_lines) | summarizeInput

}
