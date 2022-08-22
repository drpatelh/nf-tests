#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

def tower_run_id = workflow.workDir
def tower_run_url = "${params.tower_host}/orgs/${params.tower_organisation}/workspaces/${params.tower_workspace}/watch/${tower_run_id}"

println(tower_run_id)
println(tower_run_url)
