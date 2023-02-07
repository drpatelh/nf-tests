process ECHO_PATH {

    debug true

    //conda "conda-forge::python=3.9.5"
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://depot.galaxyproject.org/singularity/python:3.9--1' :
        'quay.io/biocontainers/python:3.9--1' }"

    // print(workflow.profile.tokenize().intersect(['conda', 'mamba']))
    if (workflow.profile.tokenize(',').intersect(['conda', 'mamba']).size() >= 1) {
        exit 1, "Conda environments cannot be used when using the Cell Ranger tool. Please use docker or singularity containers."
    }
    // if (workflow.profile.contains('conda') || workflow.profile.contains('mamba')) {
        // exit 1, "Conda environments cannot be used when using the Cell Ranger tool. Please use docker or singularity containers."
    // }

    input:
    path input

    script:
    """
    echo $input
    """
}
