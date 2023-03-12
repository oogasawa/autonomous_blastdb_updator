MAKEBLASTDB="singularity exec /usr/local/biotools/b/blast:2.13.0--hf3cf87c_0 makeblastdb -hash_index -parse_seqids "

ddbj_unified_all_fasta=/home/w3wabi/BLAST/na/ddbj/fasta
ZCAT="pigz -cd -p 8"

${ZCAT} ${ddbj_unified_all_fasta}/*est*.seq.gz | ${MAKEBLASTDB} -out ddbj/est -dbtype nucl -title est

${ZCAT} ${ddbj_unified_all_fasta}/*ddbjgss*.seq.gz | ${MAKEBLASTDB} -out ddbj/gss -dbtype nucl -title gss
${ZCAT} ${ddbj_unified_all_fasta}/*ddbjsts*.seq.gz | ${MAKEBLASTDB} -out ddbj/sts -dbtype nucl -title sts
${ZCAT} ${ddbj_unified_all_fasta}/*ddbjhtc*.seq.gz | ${MAKEBLASTDB} -out ddbj/htc -dbtype nucl -title htc
${ZCAT} ${ddbj_unified_all_fasta}/*ddbjhtg*.seq.gz | ${MAKEBLASTDB} -out ddbj/htg -dbtype nucl -title htg
${ZCAT} ${ddbj_unified_all_fasta}/*ddbjpat*.seq.gz | ${MAKEBLASTDB} -out ddbj/pat -dbtype nucl -title pat
${ZCAT} ${ddbj_unified_all_fasta}/*ddbjsts*.seq.gz | ${MAKEBLASTDB} -out ddbj/sts -dbtype nucl -title sts
${ZCAT} ${ddbj_unified_all_fasta}/*ddbjuna*.seq.gz | ${MAKEBLASTDB} -out ddbj/una -dbtype nucl -title una
${ZCAT} ${ddbj_unified_all_fasta}/*ddbjtsa*.seq.gz | ${MAKEBLASTDB} -out ddbj/tsa -dbtype nucl -title tsa
