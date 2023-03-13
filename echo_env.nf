process ECHO_ENV {

    debug true

    container 'quay.io/biocontainers/python:3.9--1'

    script:
    """
    env | grep "proxy"
    """
}
