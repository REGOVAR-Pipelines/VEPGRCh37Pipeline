FROM continuumio/miniconda:latest

RUN \
  curl "ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/reference/human_g1k_v37.fasta.gz" -o /human_g1k_v37.fasta.gz

RUN \
  mkdir -p /regovar/{inputs,outputs,logs,databases} && \
  conda config --add channels defaults && \
  conda config --add channels conda-forge && \
  conda config --add channels bioconda && \
  conda install ensembl-vep && \
  vep_install -a cf -s homo_sapiens -y GRCh37 -c /.vep –CONVERT

COPY run.sh /

CMD ["/run.sh"]
