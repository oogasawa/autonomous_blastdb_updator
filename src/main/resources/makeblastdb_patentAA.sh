
MAKEBLASTDB="singularity exec /usr/local/biotools/b/blast:2.13.0--hf3cf87c_0 makeblastdb -hash_index -parse_seqids "


patent_aa_fasta=/home/w3wabi/BLAST/aa/patent/fasta/
ZCAT="pigz -cd -p 8"

${ZCAT} ${patent_aa_fasta}/epo.gz | ${MAKEBLASTDB} -out patent/epo -dbtype prot -title epo
${ZCAT} ${patent_aa_fasta}/jpo.gz | ${MAKEBLASTDB} -out patent/jpo -dbtype prot -title jpo
${ZCAT} ${patent_aa_fasta}/kipo.gz | ${MAKEBLASTDB} -out patent/kipo -dbtype prot -title kipo
${ZCAT} ${patent_aa_fasta}/uspto.gz | ${MAKEBLASTDB} -out patent/uspto -dbtype prot -title uspto

cat <<EOF > patent/patent.nal                                                                                                                                      
TITLE patent                                                                                                                                                       
DBLIST epo jpo kipo uspto                                                                                                                                          
EOF                                                                                                                                                                
