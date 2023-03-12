MAKEBLASTDB="singularity exec -H $PWD /usr/local/biotools/b/blast:2.13.0--hf3cf87c_0 makeblastdb -hash_index -parse_seqids "

# UniProt
uniprot_fasta=$HOME/BLAST/aa/uniprot/fasta/
ZCAT="pigz -cd -p 8"
mkdir uniprot

${ZCAT} ${uniprot_fasta}/uniprot_sprot*.fasta.gz | ${MAKEBLASTDB} -out uniprot/swissprot -dbtype prot -title swissprot
${ZCAT} ${uniprot_fasta}/uniprot_trembl.fasta.gz | ${MAKEBLASTDB} -out uniprot/trembl -dbtype prot -title trembl
