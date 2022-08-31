# nf-tests
Repo to test NF / Tower code 


```
touch test.txt
mkdir test
cd test
ln -s ../test.txt link1.txt
ln -s ../test.txt link2.txt
cd ..

nextflow run main.nf -profile docker --input test/
```