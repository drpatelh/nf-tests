process ECHO_PATH {

    debug true

    container 'ubuntu:latest'

    input:
    path input

    script:
    """
    ls -la $input/*
    """
}
