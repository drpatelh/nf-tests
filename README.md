# Handling file name collisions

## Run directly

- Run with `docker`:

```
touch test.csv
nextflow run drpatelh/nf-tests -profile docker -r filename-collision --input test.csv
```

## Run locally

- Clone repo:

```
git clone https://github.com/drpatelh/nf-tests.git
cd nf-tests
git checkout filename-collision
```

- Run with `docker`:

```
touch test.csv

nextflow run main.nf -profile docker --input test.csv

N E X T F L O W  ~  version 22.08.2-edge
Launching `main.nf` [hungry_meucci] DSL2 - revision: 11cc73574e
executor >  local (1)
[fa/63f9b7] process > ECHO_PATH [100%] 1 of 1 ✔
dir01:
total 8
drwxr-xr-x 2 harshil harshil 4096 Sep  1 15:25 .
drwxr-xr-x 4 harshil harshil 4096 Sep  1 15:25 ..
lrwxrwxrwx 1 harshil harshil   44 Sep  1 15:25 test.csv -> /home/harshil/nf-tests/test.csv

dir02:
total 8
drwxr-xr-x 2 harshil harshil 4096 Sep  1 15:25 .
drwxr-xr-x 4 harshil harshil 4096 Sep  1 15:25 ..
lrwxrwxrwx 1 harshil harshil   44 Sep  1 15:25 test.csv -> /home/harshil/nf-tests/test.csv
```