echo $PWD
MAKEBLASTDB="singularity exec -H $PWD /usr/local/biotools/b/blast:2.13.0--hf3cf87c_0 makeblastdb -hash_index -parse_seqids "
ddbj_unified_all_fasta=$HOME/BLAST/na/ddbj/fasta
ZCAT="pigz -cd -p 8"

mkdir ddbj
${ZCAT} ${ddbj_unified_all_fasta}/*ddbjhum*.seq.gz | ${MAKEBLASTDB} -out ddbj/hum -dbtype nucl -title hum
${ZCAT} ${ddbj_unified_all_fasta}/*ddbjpri*.seq.gz | ${MAKEBLASTDB} -out ddbj/pri -dbtype nucl -title pri
${ZCAT} ${ddbj_unified_all_fasta}/*ddbjrod*.seq.gz | ${MAKEBLASTDB} -out ddbj/rod -dbtype nucl -title rod
${ZCAT} ${ddbj_unified_all_fasta}/*ddbjmam*.seq.gz | ${MAKEBLASTDB} -out ddbj/mam -dbtype nucl -title mam
${ZCAT} ${ddbj_unified_all_fasta}/*ddbjvrt*.seq.gz | ${MAKEBLASTDB} -out ddbj/vrt -dbtype nucl -title vrt 
${ZCAT} ${ddbj_unified_all_fasta}/*ddbjinv*.seq.gz | ${MAKEBLASTDB} -out ddbj/inv -dbtype nucl -title inv 
${ZCAT} ${ddbj_unified_all_fasta}/*ddbjpln*.seq.gz | ${MAKEBLASTDB} -out ddbj/pln -dbtype nucl -title pln 
${ZCAT} ${ddbj_unified_all_fasta}/*ddbjbct*.seq.gz | ${MAKEBLASTDB} -out ddbj/bct -dbtype nucl -title bct 
${ZCAT} ${ddbj_unified_all_fasta}/*ddbjvrl*.seq.gz | ${MAKEBLASTDB} -out ddbj/vrl -dbtype nucl -title vrl 
${ZCAT} ${ddbj_unified_all_fasta}/*ddbjphg*.seq.gz | ${MAKEBLASTDB} -out ddbj/phg -dbtype nucl -title phg 
${ZCAT} ${ddbj_unified_all_fasta}/*ddbjsyn*.seq.gz | ${MAKEBLASTDB} -out ddbj/syn -dbtype nucl -title syn
${ZCAT} ${ddbj_unified_all_fasta}/*ddbjenv*.seq.gz | ${MAKEBLASTDB} -out ddbj/env -dbtype nucl -title env

cat <<EOT > ddbj/general.nal                                                                                                                                       
TITLE general                                                                                                                                                      
DBLIST hum pri rod mam vrt inv pln bct vrl phg syn env                                                                                                                 
EOT
