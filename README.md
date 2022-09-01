# nf-tests

Repo to test a simple NF pipeline that has GATK4 Baserecalibrator nf-core/module installed.

## Run directly

- Run with `docker`:

```
nextflow run drpatelh/nf-tests -profile test,docker -r baserecalibrator
```

## Run locally

- Clone repo:

```
git clone https://github.com/drpatelh/nf-tests.git
cd nf-tests
git checkout baserecalibrator
```

- Run with `docker`:

```
nextflow run main.nf -profile test,docker
```