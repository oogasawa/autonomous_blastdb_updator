
MAKEBLASTDB="singularity exec -H $PWD /usr/local/biotools/b/blast:2.13.0--hf3cf87c_0 makeblastdb -hash_index -parse_seqids "

rRNA_fasta=$HOME/BLAST/na/16S/fasta
ZCAT="pigz -cd -p 8"

mkdir 16S
${ZCAT} ${rRNA_fasta}/16S.fasta.gz | ${MAKEBLASTDB} -out 16S/16S -dbtype nucl -title 16S
