
MAKEBLASTDB="singularity exec -H $PWD /usr/local/biotools/b/blast:2.13.0--hf3cf87c_0 makeblastdb -hash_index -parse_seqids "

dad_all_fasta=$HOME/BLAST/aa/dad/fasta
ZCAT="pigz -cd -p 8"

mkdir dad
${ZCAT} ${dad_all_fasta}/*ddbjhum*.fasta.gz | perl -ne 'if (/^(>\S+\|\S+\|[0-9]+\|)(.+)/) { print $1, " ", $2, "\n";} else {print $_}'  | ${MAKEBLASTDB} -out dad/hum -dbtype prot -title hum
${ZCAT} ${dad_all_fasta}/*ddbjpri*.fasta.gz | perl -ne 'if (/^(>\S+\|\S+\|[0-9]+\|)(.+)/) { print $1, " ", $2, "\n";} else {print $_}'  | ${MAKEBLASTDB} -out dad/pri -dbtype prot -title pri
${ZCAT} ${dad_all_fasta}/*ddbjrod*.fasta.gz | perl -ne 'if (/^(>\S+\|\S+\|[0-9]+\|)(.+)/) { print $1, " ", $2, "\n";} else {print $_}'  | ${MAKEBLASTDB} -out dad/rod -dbtype prot -title rod
${ZCAT} ${dad_all_fasta}/*ddbjmam*.fasta.gz | perl -ne 'if (/^(>\S+\|\S+\|[0-9]+\|)(.+)/) { print $1, " ", $2, "\n";} else {print $_}'  | ${MAKEBLASTDB} -out dad/mam -dbtype prot -title mam
${ZCAT} ${dad_all_fasta}/*ddbjvrt*.fasta.gz | perl -ne 'if (/^(>\S+\|\S+\|[0-9]+\|)(.+)/) { print $1, " ", $2, "\n";} else {print $_}'  | ${MAKEBLASTDB} -out dad/vrt -dbtype prot -title vrt
${ZCAT} ${dad_all_fasta}/*ddbjinv*.fasta.gz | perl -ne 'if (/^(>\S+\|\S+\|[0-9]+\|)(.+)/) { print $1, " ", $2, "\n";} else {print $_}'  | ${MAKEBLASTDB} -out dad/inv -dbtype prot -title inv
${ZCAT} ${dad_all_fasta}/*ddbjpln*.fasta.gz | perl -ne 'if (/^(>\S+\|\S+\|[0-9]+\|)(.+)/) { print $1, " ", $2, "\n";} else {print $_}'  | ${MAKEBLASTDB} -out dad/pln -dbtype prot -title pln
${ZCAT} ${dad_all_fasta}/*ddbjbct*.fasta.gz | perl -ne 'if (/^(>\S+\|\S+\|[0-9]+\|)(.+)/) { print $1, " ", $2, "\n";} else {print $_}'  | ${MAKEBLASTDB} -out dad/bct -dbtype prot -title bct
${ZCAT} ${dad_all_fasta}/*ddbjvrl*.fasta.gz | perl -ne 'if (/^(>\S+\|\S+\|[0-9]+\|)(.+)/) { print $1, " ", $2, "\n";} else {print $_}'  | ${MAKEBLASTDB} -out dad/vrl -dbtype prot -title vrl
${ZCAT} ${dad_all_fasta}/*ddbjphg*.fasta.gz | perl -ne 'if (/^(>\S+\|\S+\|[0-9]+\|)(.+)/) { print $1, " ", $2, "\n";} else {print $_}'  | ${MAKEBLASTDB} -out dad/phg -dbtype prot -title phg
${ZCAT} ${dad_all_fasta}/*ddbjsyn*.fasta.gz | perl -ne 'if (/^(>\S+\|\S+\|[0-9]+\|)(.+)/) { print $1, " ", $2, "\n";} else {print $_}'  | ${MAKEBLASTDB} -out dad/syn -dbtype prot -title syn
${ZCAT} ${dad_all_fasta}/*ddbjenv*.fasta.gz | perl -ne 'if (/^(>\S+\|\S+\|[0-9]+\|)(.+)/) { print $1, " ", $2, "\n";} else {print $_}'  | ${MAKEBLASTDB} -out dad/env -dbtype prot -title env


${ZCAT} ${dad_all_fasta}/*est*.fasta.gz | perl -ne 'if (/^(>\S+\|\S+\|[0-9]+\|)(.+)/) { print $1, " ", $2, "\n";} else {print $_}'  | ${MAKEBLASTDB} -out dad/est -dbtype prot -title est
${ZCAT} ${dad_all_fasta}/*ddbjgss*.fasta.gz | perl -ne 'if (/^(>\S+\|\S+\|[0-9]+\|)(.+)/) { print $1, " ", $2, "\n";} else {print $_}'  | ${MAKEBLASTDB} -out dad/gss -dbtype prot -title gss
${ZCAT} ${dad_all_fasta}/*ddbjsts*.fasta.gz | perl -ne 'if (/^(>\S+\|\S+\|[0-9]+\|)(.+)/) { print $1, " ", $2, "\n";} else {print $_}'  | ${MAKEBLASTDB} -out dad/sts -dbtype prot -title sts
${ZCAT} ${dad_all_fasta}/*ddbjhtc*.fasta.gz | perl -ne 'if (/^(>\S+\|\S+\|[0-9]+\|)(.+)/) { print $1, " ", $2, "\n";} else {print $_}'  | ${MAKEBLASTDB} -out dad/htc -dbtype prot -title htc
${ZCAT} ${dad_all_fasta}/*ddbjhtg*.fasta.gz | perl -ne 'if (/^(>\S+\|\S+\|[0-9]+\|)(.+)/) { print $1, " ", $2, "\n";} else {print $_}'  | ${MAKEBLASTDB} -out dad/htg -dbtype prot -title htg
${ZCAT} ${dad_all_fasta}/*ddbjsts*.fasta.gz | perl -ne 'if (/^(>\S+\|\S+\|[0-9]+\|)(.+)/) { print $1, " ", $2, "\n";} else {print $_}'  | ${MAKEBLASTDB} -out dad/sts -dbtype prot -title sts
${ZCAT} ${dad_all_fasta}/*ddbjuna*.fasta.gz | perl -ne 'if (/^(>\S+\|\S+\|[0-9]+\|)(.+)/) { print $1, " ", $2, "\n";} else {print $_}'  | ${MAKEBLASTDB} -out dad/una -dbtype prot -title una
${ZCAT} ${dad_all_fasta}/*ddbjtsa*.fasta.gz | perl -ne 'if (/^(>\S+\|\S+\|[0-9]+\|)(.+)/) { print $1, " ", $2, "\n";} else {print $_}'  | ${MAKEBLASTDB} -out dad/tsa -dbtype prot -title tsa

cat <<EOT > dad/general.nal                                                                                                                                        
TITLE general                                                                                                                                                      
DBLIST hum pri rod mam vrt inv pln bct vrl phg syn env                                                                                                                 
EOT
