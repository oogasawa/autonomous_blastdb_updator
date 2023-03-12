
MAKEBLASTDB="singularity exec -H $PWD /usr/local/biotools/b/blast:2.13.0--hf3cf87c_0 makeblastdb -hash_index -parse_seqids "

refseq_na_fasta=$HOME/BLAST/na/refseq/fasta
ZCAT="pigz -cd -p 8"

mkdir refseq
# refseq daily
${ZCAT} ${refseq_na_fasta}/daily/*.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-na-daily -dbtype nucl -title refseq-na-daily
