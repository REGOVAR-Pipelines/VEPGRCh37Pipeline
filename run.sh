#! /bin/sh

cd "/regovar/inputs"
for file in *.vcf; do
  vep \
    --fork 2 \
    --buffer_size 200000 \
    --cache --dir /.vep --offline \
    --fasta "/regovar/databases/GRCh37/human_g1k_v37.fasta" \
    --db_version 92 \
    --species homo_sapiens \
    --assembly GRCh37 \
    --no_escape \
    --vcf_info_field CSQ \
    --terms ensembl \
    --hgvs \
    --symbol \
    --format vcf \
    --vcf \
    --no_stats \
    -i "/regovar/inputs/$file" \
    -o "/regovar/outputs/$file" \
    > "/regovar/logs/$file.log"
done
