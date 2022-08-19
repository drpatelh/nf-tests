# Running Python in Nextflow

POC to highlight how to run Python scripts within a Nextflow pipeline.

> **NOTE**: Change `--outdir` to an absolute path if running in the Cloud e.g. `--outdir 's3://mybucket/nf-tests/results'` (default : `./results`)

## Run directly

- Run with `docker`:

```
nextflow run drpatelh/nf-tests -profile docker -r python
```

## Run locally

- Clone repo:

```
git clone https://github.com/drpatelh/nf-tests.git
cd nf-tests
git checkout python
```

- Run with `docker`:

```
nextflow run main.nf -profile docker
```
