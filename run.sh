#! /bin/sh

cd "/regovar/inputs"
for file in *.vcf; do
  vep \
    --fork 40 \
    --buffer_size 200000 \
    --cache --dir /.vep --offline \
    --fasta "/regovar/databases/GRCh37/human_g1k_v37.fasta" \
    --db_version 93 \
    --species homo_sapiens \
    --assembly GRCh37 \
    --no_escape \
    --vcf_info_field CSQ \
    --format vcf \
    --vcf \
    --no_stats \
    --af --af_1kg --af_esp --af_gnomad \
    --appris --biotype --canonical --ccds --check_existing --distance 5000 --domains --hgvs --merged \
    --plugin Condel \
    --plugin MaxEntScan \
    --plugin LoFtool \
    --plugin Blosum62 \
    --plugin dbscSNV \
    --plugin AncestralAllele \
    --plugin miRNA \
    --polyphen b --protein --pubmed --regulatory --sift b \
    --species homo_sapiens --symbol --tsl --uniprot \
    -i "/regovar/inputs/$file" \
    -o "/regovar/outputs/$file" \
    > "/regovar/logs/$file.log"
done
