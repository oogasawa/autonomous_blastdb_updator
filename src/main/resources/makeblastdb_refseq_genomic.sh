
MAKEBLASTDB="singularity exec -H $PWD /usr/local/biotools/b/blast:2.13.0--hf3cf87c_0 makeblastdb -hash_index -parse_seqids "


# RefSeq
refseq_na_fasta=$HOME/BLAST/na/refseq/fasta
ZCAT="pigz -cd -p 8"
mkdir refseq

## genomic
${ZCAT} ${refseq_na_fasta}/release/archaea/*.genomic.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-genomic-archaea -dbtype nucl -title refseq-genomic-archaea
${ZCAT} ${refseq_na_fasta}/release/bacteria/*.genomic.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-genomic-bacteria -dbtype nucl -title refseq-genomic-bacteria
${ZCAT} ${refseq_na_fasta}/release/fungi/*.genomic.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-genomic-fungi -dbtype nucl -title refseq-genomic-fungi
${ZCAT} ${refseq_na_fasta}/release/invertebrate/*.genomic.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-genomic-invertebrate -dbtype nucl -title refseq-genomic-inverteb\
rate
${ZCAT} ${refseq_na_fasta}/release/mitochondrion/*.genomic.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-genomic-mitochondrion -dbtype nucl -title refseq-genomic-mitochond\
rion
${ZCAT} ${refseq_na_fasta}/release/plant/*.genomic.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-genomic-plant -dbtype nucl -title refseq-genomic-plant
${ZCAT} ${refseq_na_fasta}/release/plasmid/*.genomic.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-genomic-plasmid -dbtype nucl -title refseq-genomic-plasmid
${ZCAT} ${refseq_na_fasta}/release/plastid/*.genomic.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-genomic-plastid -dbtype nucl -title refseq-genomic-plastid
${ZCAT} ${refseq_na_fasta}/release/protozoa/*.genomic.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-genomic-protozoa -dbtype nucl -title refseq-genomic-protozoa
${ZCAT} ${refseq_na_fasta}/release/virus/*.genomic.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-genomic-virus -dbtype nucl -title refseq-genomic-virus
${ZCAT} ${refseq_na_fasta}/release/vertebrate_mammalian/*.genomic.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-genomic-vertebrate-mammalian -dbtype nucl -title refseq-genomic-vertebrate-mammalian
${ZCAT} ${refseq_na_fasta}/release/vertebrate_other/*.genomic.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-genomic-vertebrate-other -dbtype nucl -title refseq-genomic-vertebrate-other

### Added.
${ZCAT} ${refseq_na_fasta}/release/other/*.genomic.fna.gz | ${MAKEBLASTDB} -out refseq/refseq-genomic-other -dbtype nucl -title refseq-genomic-other



cat <<EOT > refseq/refseq-genomic.nal
TITLE refseq-genomic                                                                                                                                                      
DBLIST refseq-genomic-archaea refseq-genomic-bacteria refseq-genomic-fungi refseq-genomic-invertebrate refseq-genomic-plant refseq-genomid-plasmid refseq-genomic-plastid refseq-genomic-protozoa refseq-genomic-virus refseq-genomic-vertebrate_mammalian refseq-genonic-vertebrate_other
EOT
