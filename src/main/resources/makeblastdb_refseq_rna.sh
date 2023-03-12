
MAKEBLASTDB="singularity exec /usr/local/biotools/b/blast:2.13.0--hf3cf87c_0 makeblastdb -hash_index -parse_seqids "


# RefSeq
refseq_na_fasta=/home/w3wabi/BLAST/na/refseq/fasta
ZCAT="pigz -cd -p 8"

## RNA
${ZCAT} ${refseq_na_fasta}/release/archaea/*.rna.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-rna-archaea -dbtype nucl -title refseq-rna-archaea
${ZCAT} ${refseq_na_fasta}/release/bacteria/*.rna.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-rna-bacteria -dbtype nucl -title refseq-rna-bacteria
${ZCAT} ${refseq_na_fasta}/release/fungi/*.rna.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-rna-fungi -dbtype nucl -title refseq-rna-fungi
${ZCAT} ${refseq_na_fasta}/release/invertebrate/*.rna.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-rna-invertebrate -dbtype nucl -title refseq-rna-invertebrate
#${ZCAT} ${refseq_na_fasta}/release/mitocondrion/*.genomic.fna.gz | ${MAKEBLASTDB} -out refseq/genomic/mitocondrion -dbtype nucl -title mitocondrion
${ZCAT} ${refseq_na_fasta}/release/plant/*.rna.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-rna-plant -dbtype nucl -title refseq-rna-plant
${ZCAT} ${refseq_na_fasta}/release/plasmid/*.rna.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-rna-plasmid -dbtype nucl -title refseq-rna-plasmid
${ZCAT} ${refseq_na_fasta}/release/protozoa/*.rna.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-rna-protozoa -dbtype nucl -title refseq-rna-protozoa
${ZCAT} ${refseq_na_fasta}/release/vertebrate_mammalian/*.rna.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-rna-vertebrate_mammalian -dbtype nucl -title refseq-rna-vert\
ebrate_mammalian
${ZCAT} ${refseq_na_fasta}/release/vertebrate_other/*.rna.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-rna-vertebrate_other -dbtype nucl -title refseq-rna-vertebrate_o\
ther
