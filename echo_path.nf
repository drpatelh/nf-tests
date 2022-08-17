process ECHO_PATH {

    debug true

    container 'ubuntu:20.04'

    input:
    path input

    script:
    """
    echo $input
    """
}
