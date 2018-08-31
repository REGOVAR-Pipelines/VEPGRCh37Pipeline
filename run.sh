#! /bin/sh

cd /inputs
for file in "*.vcf"; do
  vep \
    --fork 2 \
    --buffer_size 200000 \
    --cache --dir /.vep --offline \
    --fasta /human_g1k_v37.fasta.gz \
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
    -i "/inputs/$file" \
    -o "/outputs/$file" \
    > "/logs/$file.log"
done
