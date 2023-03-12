
MAKEBLASTDB="singularity exec /usr/local/biotools/b/blast:2.13.0--hf3cf87c_0 makeblastdb -hash_index -parse_seqids "

rRNA_fasta=/home/w3wabi/BLAST/na/16S/fasta
ZCAT="$HOME/local/bin/pigz -cd -p 8"

${ZCAT} ${rRNA_fasta}/16S.fasta.gz | ${MAKEBLASTDB} -out 16S/16S -dbtype nucl -title 16S
