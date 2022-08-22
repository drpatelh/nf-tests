# Debug `toAbsolutePath()` error

POC to debug `toAbsolutePath() on null object` error reported on [nf-core Slack](https://nfcore.slack.com/archives/D0336TKDEQY/p1661180251769559)

## Create test files

```
$ mkdir -p input/sgRNA_pools/
$ touch input/sgRNA_pools/Pool_1.csv  
$touch input/sgRNA_pools/Pool_2.csv
```

## Run directly

- Run with `docker`:

```
nextflow run drpatelh/nf-tests -profile docker -r crispr
```

## Run locally

- Clone repo:

```
git clone https://github.com/drpatelh/nf-tests.git
cd nf-tests
git checkout crispr
```

- Run with `docker`:

```
nextflow run main.nf -profile docker
```
