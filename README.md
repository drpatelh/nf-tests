# Tower Run URL within Workflow

POC to highlight how to obtain Tower URL for a run from within a running Workflow.

The script parses the `workflow.workDir` variable to get the run id.

## Run directly

- Run with `docker`:

```
nextflow run drpatelh/nf-tests -profile docker -r runid
```

## Run locally

- Clone repo:

```
git clone https://github.com/drpatelh/nf-tests.git
cd nf-tests
git checkout runid
```

- Run with `docker`:

```
nextflow run main.nf -profile docker
```
