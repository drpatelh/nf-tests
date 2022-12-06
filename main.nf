#!/usr/bin/env nextflow

nextflow.enable.dsl=2

println """\
         ===================================
         P P I - P R E D I C T - N F   P I P E L I N E    
         ===================================
          interactions:   ${params.interactions}
          embeddings:     ${params.embeddings}
          weights:        ${params.weights}
          s3_publish:     ${params.s3_publish}
         """
         .stripIndent()


process PredictPPI {
    publishDir(
        path: "${params.s3_publish}",
        mode: 'copy',
    )
    accelerator 1
    input:
    tuple path(interactions), path(embeddings), path(weights)
    
    output:
    path "*"

    script:
    """
    conda run -n ppi_prediction /app/predict_parameterized.py \
    -interactions $interactions \
    -embeddings $embeddings \
    -weights $weights
    """
}

workflow {
    Channel.fromPath(params.index) \
        | splitCsv(header:true) \
        | map { row -> [row.interactions, row.embeddings, row.weights] } \
        | PredictPPI
}
