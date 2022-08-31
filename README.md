# nf-tests
Repo to test NF / Tower code 


```
$ touch test.txt
$ mkdir test
$ cd test
$ ln -s ../test.txt link1.txt
$ ln -s ../test.txt link2.txt
$ cd ..

$ nextflow run main.nf -profile docker --input test/

N E X T F L O W  ~  version 22.08.2-edge
Launching `main.nf` [zen_pesquet] DSL2 - revision: 7c8de976ef
executor >  local (1)
[11/cb8184] process > ECHO_PATH (1) [100%] 1 of 1 ✔
lrwxrwxrwx 1 harshil harshil 11 Aug 31 14:57 test/link1.txt -> ../test.txt
lrwxrwxrwx 1 harshil harshil 11 Aug 31 14:57 test/link2.txt -> ../test.txt
```