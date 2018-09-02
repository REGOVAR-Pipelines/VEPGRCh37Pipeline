FROM continuumio/miniconda:latest

RUN \
  mkdir -p /regovar/{inputs,outputs,logs,databases} && \
  conda config --add channels defaults && \
  conda config --add channels conda-forge && \
  conda config --add channels bioconda && \
  conda install ensembl-vep && \
  vep_install -a cf -s homo_sapiens -y GRCh37 -c /.vep --CONVERT

COPY run.sh /

CMD ["/run.sh"]
