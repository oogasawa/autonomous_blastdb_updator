
MAKEBLASTDB="singularity exec /usr/local/biotools/b/blast:2.13.0--hf3cf87c_0 makeblastdb -hash_index -parse_seqids "


# RefSeq
refseq_na_fasta=/home/w3wabi/BLAST/na/refseq/fasta
ZCAT="pigz -cd -p 8"

## model RNA
${ZCAT} ${refseq_na_fasta}/B_taurus/mRNA_Prot/*.fna.gz | ${MAKEBLASTDB} -out refseq/B_taurus -dbtype nucl -title B_taurus
${ZCAT} ${refseq_na_fasta}/D_rerio/mRNA_Prot/*.fna.gz | ${MAKEBLASTDB} -out refseq/D_rerio -dbtype nucl -title D_rerio
${ZCAT} ${refseq_na_fasta}/H_sapiens/mRNA_Prot/*.fna.gz | ${MAKEBLASTDB} -out refseq/H_sapiens -dbtype nucl -title H_sapiens
${ZCAT} ${refseq_na_fasta}/M_musculus/mRNA_Prot/*.fna.gz | ${MAKEBLASTDB} -out refseq/M_musculus -dbtype nucl -title M_musculus
${ZCAT} ${refseq_na_fasta}/R_norvegicus/mRNA_Prot/*.fna.gz | ${MAKEBLASTDB} -out refseq/R_norvegicus -dbtype nucl -title R_norvegicus
${ZCAT} ${refseq_na_fasta}/S_scrofa/mRNA_Prot/*.fna.gz | ${MAKEBLASTDB} -out refseq/S_scrofa -dbtype nucl -title S_scrofa
${ZCAT} ${refseq_na_fasta}/X_tropicalis/mRNA_Prot/*.fna.gz | ${MAKEBLASTDB} -out refseq/X_tropicalis -dbtype nucl -title X_tropicalis
