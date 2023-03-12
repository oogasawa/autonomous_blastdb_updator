#!/bin/bash

SRC_DATASET_DIR=${HOME}/BLAST
DEST_DATASET_DIR=${HOME}/blast_test_dataset

# ddbj databases
mkdir -p ${DEST_DATASET_DIR}/na/ddbj/fasta

## ddbj general
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/ddbjhum1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/ddbjpri1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/ddbjrod1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/ddbjmam1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/ddbjvrt1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/ddbjinv1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/ddbjpln1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/ddbjbct1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/ddbjvrl1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/ddbjphg1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/ddbjsyn1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/ddbjenv1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta

## ddbj other
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/est_rest1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/ddbjgss1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/ddbjsts1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/ddbjhtc1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/ddbjhtg1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/ddbjpat1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/ddbjsts1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/ddbjuna1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta
cp -p ${SRC_DATASET_DIR}/na/ddbj/fasta/ddbjtsa1.seq.gz ${DEST_DATASET_DIR}/na/ddbj/fasta

# 16S rRNA
mkdir -p ${DEST_DATASET_DIR}/na/16S/fasta
cp -p ${SRC_DATASET_DIR}/na/16S/fasta/16S.fasta.gz ${DEST_DATASET_DIR}/na/ddbj/fasta

# Refseq daily
mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/daily
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/daily/*.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/daily

# Refseq genomic
mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/archaea
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/archaea/archaea.1.1.genomic.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/archaea

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/bacteria
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/bacteria/bacteria.1.1.genomic.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/bacteria

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/fungi
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/fungi/fungi.1.1.genomic.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/fungi

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/invertebrate
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/invertebrate/invertebrate.1.1.genomic.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/invertebrate

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/mitochondrion
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/mitochondrion/mitochondrion.1.1.genomic.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/mitochondrion

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/other
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/other/other.1.1.genomic.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/other

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/plant
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/plant/plant.1.1.genomic.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/plant

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/plasmid
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/plasmid/plasmid.1.1.genomic.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/plasmid

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/plastid
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/plastid/plastid.1.1.genomic.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/plastid

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/protozoa
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/protozoa/protozoa.1.1.genomic.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/protozoa

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/vertebrate_mammalian
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/vertebrate_mammalian/vertebrate_mammalian.1.1.genomic.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/vertebrate_mammalian

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/vertebrate_other
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/vertebrate_other/vertebrate_other.1.1.genomic.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/vertebrate_other

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/viral
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/viral/viral.1.1.genomic.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/viral

# Refseq rna
mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/archaea
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/archaea/archaea.1.rna.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/archaea

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/bacteria
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/bacteria/bacteria.1.rna.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/bacteria

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/fungi
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/fungi/fungi.1.rna.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/fungi

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/invertebrate
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/invertebrate/invertebrate.1.rna.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/invertebrate

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/mitochondrion
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/mitochondrion/mitochondrion.1.rna.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/mitochondrion

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/other
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/other/other.1.rna.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/other

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/plant
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/plant/plant.1.rna.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/plant

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/plasmid
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/plasmid/plasmid.1.rna.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/plasmid

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/plastid
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/plastid/plastid.1.rna.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/plastid

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/protozoa
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/protozoa/protozoa.1.rna.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/protozoa

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/vertebrate_mammalian
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/vertebrate_mammalian/vertebrate_mammalian.1.rna.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/vertebrate_mammalian

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/vertebrate_other
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/vertebrate_other/vertebrate_other.1.rna.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/vertebrate_other

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/viral
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/release/viral/viral.1.rna.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/release/viral

# Refseq Model
mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/B_taurus/mRNA_Prot/
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/B_taurus/mRNA_Prot/cow.1.rna.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/B_taurus/mRNA_Prot

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/D_rerio/mRNA_Prot/
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/D_rerio/mRNA_Prot/zebrafish.1.rna.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/D_rerio/mRNA_Prot

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/H_sapiens/mRNA_Prot/
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/H_sapiens/mRNA_Prot/human.1.rna.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/H_sapiens/mRNA_Prot

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/M_musculus/mRNA_Prot/
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/M_musculus/mRNA_Prot/mouse.1.rna.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/M_musculus/mRNA_Prot

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/R_norvegicus/mRNA_Prot/
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/R_norvegicus/mRNA_Prot/rat.1.rna.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/R_norvegicus/mRNA_Prot

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/S_scrofa/mRNA_Prot/
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/S_scrofa/mRNA_Prot/pig.1.rna.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/S_scrofa/mRNA_Prot

mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/X_tropicalis/mRNA_Prot/
cp -p ${SRC_DATASET_DIR}/na/refseq/fasta/X_tropicalis/mRNA_Prot/frog.1.rna.fna.gz ${DEST_DATASET_DIR}/na/refseq/fasta/X_tropicalis/mRNA_Prot

# DAD Databases
mkdir -p ${DEST_DATASET_DIR}/aa/dad/fasta
## dad general
cp -p ${SRC_DATASET_DIR}/aa/dad/fasta/ddbjhum1.DAD.fasta.gz ${DEST_DATASET_DIR}/aa/dad/fasta
cp -p ${SRC_DATASET_DIR}/aa/dad/fasta/ddbjpri1.DAD.fasta.gz ${DEST_DATASET_DIR}/aa/dad/fasta
cp -p ${SRC_DATASET_DIR}/aa/dad/fasta/ddbjrod1.DAD.fasta.gz ${DEST_DATASET_DIR}/aa/dad/fasta
cp -p ${SRC_DATASET_DIR}/aa/dad/fasta/ddbjmam1.DAD.fasta.gz ${DEST_DATASET_DIR}/aa/dad/fasta
cp -p ${SRC_DATASET_DIR}/aa/dad/fasta/ddbjvrt1.DAD.fasta.gz ${DEST_DATASET_DIR}/aa/dad/fasta
cp -p ${SRC_DATASET_DIR}/aa/dad/fasta/ddbjinv1.DAD.fasta.gz ${DEST_DATASET_DIR}/aa/dad/fasta
cp -p ${SRC_DATASET_DIR}/aa/dad/fasta/ddbjpln1.DAD.fasta.gz ${DEST_DATASET_DIR}/aa/dad/fasta
cp -p ${SRC_DATASET_DIR}/aa/dad/fasta/ddbjbct1.DAD.fasta.gz ${DEST_DATASET_DIR}/aa/dad/fasta
cp -p ${SRC_DATASET_DIR}/aa/dad/fasta/ddbjvrl1.DAD.fasta.gz ${DEST_DATASET_DIR}/aa/dad/fasta
cp -p ${SRC_DATASET_DIR}/aa/dad/fasta/ddbjphg1.DAD.fasta.gz ${DEST_DATASET_DIR}/aa/dad/fasta
cp -p ${SRC_DATASET_DIR}/aa/dad/fasta/ddbjsyn1.DAD.fasta.gz ${DEST_DATASET_DIR}/aa/dad/fasta
cp -p ${SRC_DATASET_DIR}/aa/dad/fasta/ddbjenv1.DAD.fasta.gz ${DEST_DATASET_DIR}/aa/dad/fasta

## dad other
cp -p ${SRC_DATASET_DIR}/aa/dad/fasta/est_rest.DAD.fasta.gz ${DEST_DATASET_DIR}/aa/dad/fasta
cp -p ${SRC_DATASET_DIR}/aa/dad/fasta/ddbjgss1.DAD.fasta.gz ${DEST_DATASET_DIR}/aa/dad/fasta
cp -p ${SRC_DATASET_DIR}/aa/dad/fasta/ddbjsts1.DAD.fasta.gz ${DEST_DATASET_DIR}/aa/dad/fasta
cp -p ${SRC_DATASET_DIR}/aa/dad/fasta/ddbjhtc1.DAD.fasta.gz ${DEST_DATASET_DIR}/aa/dad/fasta
cp -p ${SRC_DATASET_DIR}/aa/dad/fasta/ddbjhtg1.DAD.fasta.gz ${DEST_DATASET_DIR}/aa/dad/fasta
cp -p ${SRC_DATASET_DIR}/aa/dad/fasta/ddbjsts1.DAD.fasta.gz ${DEST_DATASET_DIR}/aa/dad/fasta
cp -p ${SRC_DATASET_DIR}/aa/dad/fasta/ddbjuna1.DAD.fasta.gz ${DEST_DATASET_DIR}/aa/dad/fasta
cp -p ${SRC_DATASET_DIR}/aa/dad/fasta/ddbjtsa1.DAD.fasta.gz ${DEST_DATASET_DIR}/aa/dad/fasta

# Patent AA
mkdir -p ${DEST_DATASET_DIR}/aa/patent/fasta
cp -p ${SRC_DATASET_DIR}/aa/patent/fasta/*.gz ${DEST_DATASET_DIR}/aa/patent/fasta

# Uniprot
mkdir -p ${DEST_DATASET_DIR}/aa/uniprot/fasta
cp -p ${SRC_DATASET_DIR}/aa/uniprot/fasta/*.fasta.gz ${DEST_DATASET_DIR}/aa/uniprot/fasta

