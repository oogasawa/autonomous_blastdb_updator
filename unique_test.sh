

MAKEBLASTDB="singularity exec -H $PWD /usr/local/biotools/b/blast:2.13.0--hf3cf87c_0 makeblastdb -hash_index -parse_seqids "

#refseq_na_fasta=$HOME/BLAST/na/refseq/fasta
refseq_na_fasta=$HOME/blast_test_dataset/na/refseq/fasta
work_dir=$PWD
ZCAT="pigz -cd -p 8"

mkdir refseq
# refseq daily


java -DXmx24G --enable-preview -jar target/blastdb-updator.jar fasta:unique \
    --fastaBasePath=${refseq_na_fasta}/daily \
    --dbName=${work_dir}/tmp_refseq_daily \
    --ext="fna.gz" \
    --outfile=${work_dir}/refseq_daily.fasta

rm -Rf ${work_dir}/tmp_refseq_daily

cat ${work_dir}/refseq_daily.fasta | ${MAKEBLASTDB} -out refseq/refseq-na-daily -dbtype nucl -title refseq-na-daily




