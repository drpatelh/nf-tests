#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

def tower_run_id = workflow.workDir.toString().tokenize('/')[-1]
def tower_run_url = "${params.tower_host}/orgs/${params.tower_organisation}/workspaces/${params.tower_workspace}/watch/${tower_run_id}"

log.info "TOWER RUN URL: ${tower_run_url}"
