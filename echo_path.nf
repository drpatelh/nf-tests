process ECHO_PATH {

    debug true

    input:
    path input

    script:
    """
    echo $input
    """
}
