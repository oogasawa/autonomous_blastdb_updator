
MAKEBLASTDB="singularity exec /usr/local/biotools/b/blast:2.13.0--hf3cf87c_0 makeblastdb -hash_index -parse_seqids "

refseq_na_fasta=/home/w3wabi/BLAST/na/refseq/fasta
ZCAT="$HOME/local/bin/pigz -cd -p 8"

# refseq daily
${ZCAT} ${refseq_na_fasta}/daily/*.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-na-daily -dbtype nucl -title refseq-na-daily
