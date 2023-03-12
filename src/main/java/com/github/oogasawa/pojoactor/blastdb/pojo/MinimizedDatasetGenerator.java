package com.github.oogasawa.pojoactor.blastdb.pojo;

import java.nio.file.Path;
import java.util.StringJoiner;
import java.util.TreeMap;

public class MinimizedDatasetGenerator {


    public static void main(String[] args) {
        MinimizedDatasetGenerator gen = new MinimizedDatasetGenerator();
        gen.printShellScript();
    }


    // -----

    public String copyDad(String[] divisions) {
        
        StringJoiner joiner = new StringJoiner("\n");
        
        for (String d: divisions) {
            Path srcPath = Path.of("${SRC_DATASET_DIR}", "aa", "dad", "fasta", "ddbj" + d + "1.DAD.fasta.gz");
            Path destPath = Path.of("${DEST_DATASET_DIR}", "aa", "dad", "fasta");

            joiner.add(String.format("cp -p %s %s", srcPath.toString(), destPath.toString()));
        }

        return joiner.toString();
    }

    public String copyDadEst() {
        Path srcPath = Path.of("${SRC_DATASET_DIR}", "aa", "dad", "fasta", "est_rest.DAD.fasta.gz");
        Path destPath = Path.of("${DEST_DATASET_DIR}", "aa", "dad", "fasta");

        return String.format("cp -p %s %s", srcPath.toString(), destPath.toString());
        
    }
    
    
    public String copyDdbj(String[] divisions) {
        
        StringJoiner joiner = new StringJoiner("\n");
        
        for (String d: divisions) {
            Path srcPath = Path.of("${SRC_DATASET_DIR}", "na", "ddbj", "fasta", "ddbj" + d + "1.seq.gz");
            Path destPath = Path.of("${DEST_DATASET_DIR}", "na", "ddbj", "fasta");

            joiner.add(String.format("cp -p %s %s", srcPath.toString(), destPath.toString()));
        }

        return joiner.toString();
    }



    public String copyDdbjEst() {
        Path srcPath = Path.of("${SRC_DATASET_DIR}", "na", "ddbj", "fasta", "est_rest1.seq.gz");
        Path destPath = Path.of("${DEST_DATASET_DIR}", "na", "ddbj", "fasta");

        return String.format("cp -p %s %s", srcPath.toString(), destPath.toString());
        
    }


    public String dadDatabases() {

        StringJoiner joiner = new StringJoiner("\n");

        joiner.add("# DAD Databases");
        joiner.add("mkdir -p ${DEST_DATASET_DIR}/aa/dad/fasta");


        String[] general_divisions = {
          "hum", "pri", "rod", "mam", "vrt",
          "inv", "pln", "bct", "vrl", "phg",
          "syn", "env"
        };
        
        joiner.add("## dad general");
        joiner.add(copyDad(general_divisions));
        joiner.add("");


        String[] other_divisions = {
            "gss", "sts", "htc", "htg",
            "sts", "una", "tsa"
        };
        
        joiner.add("## dad other");
        joiner.add(copyDadEst());
        joiner.add(copyDad(other_divisions));
        joiner.add("");
        
        return joiner.toString();
    }

    
    
    public String ddbjDatabases() {

        StringJoiner joiner = new StringJoiner("\n");

        joiner.add("# ddbj databases");
        joiner.add("mkdir -p ${DEST_DATASET_DIR}/na/ddbj/fasta");
        joiner.add("");

        String[] general_divisions = {
          "hum", "pri", "rod", "mam", "vrt",
          "inv", "pln", "bct", "vrl", "phg",
          "syn", "env"
        };
        
        joiner.add("## ddbj general");
        joiner.add(copyDdbj(general_divisions));
        joiner.add("");


        String[] other_divisions = {
            "gss", "sts", "htc", "htg",
            "pat", "sts", "una", "tsa"
        };
        
        joiner.add("## ddbj other");
        joiner.add(copyDdbjEst());
        joiner.add(copyDdbj(other_divisions));
        joiner.add("");
        
        return joiner.toString();
    }
        

    
    public String patentAA() {

        StringJoiner joiner = new StringJoiner("\n");

        joiner.add("# Patent AA");
        joiner.add("mkdir -p ${DEST_DATASET_DIR}/aa/patent/fasta");

        Path srcPath = Path.of("${SRC_DATASET_DIR}", "aa", "patent", "fasta", "*.gz");
        Path destPath = Path.of("${DEST_DATASET_DIR}", "aa", "patent", "fasta");

        joiner.add(String.format("cp -p %s %s", srcPath.toString(), destPath.toString()));
        joiner.add("");
        
        return joiner.toString();
    }


    
    public void printShellScript() {

        System.out.println("#!/bin/bash\n");
        System.out.println(this.variables());
        System.out.println(this.ddbjDatabases());

        System.out.println(this.rrna16S());

        System.out.println(this.refseqDaily());
        System.out.println(this.refseq("genomic", ".1.1.genomic.fna.gz"));
        System.out.println(this.refseq("rna", ".1.rna.fna.gz"));
        System.out.println(this.refseqModel());


        System.out.println(this.dadDatabases());
        System.out.println(this.patentAA());
        System.out.println(this.uniprot());
    }
    

    public String refseq(String type, String ext) {

        String[] lineages = { "archaea", "bacteria", "fungi", "invertebrate", "mitochondrion", "other", "plant",
                "plasmid", "plastid", "protozoa", "vertebrate_mammalian", "vertebrate_other", "viral",
        };

        StringJoiner joiner = new StringJoiner("\n");
        
        joiner.add("# Refseq " + type);

        for (String lin : lineages) {
            joiner.add("mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/release/" + lin);

            Path srcPath = Path.of("${SRC_DATASET_DIR}", "na", "refseq", "fasta", "release", lin, lin + ext);
            Path destPath = Path.of("${DEST_DATASET_DIR}", "na", "refseq", "fasta", "release", lin);

            joiner.add(String.format("cp -p %s %s", srcPath.toString(), destPath.toString()));
            joiner.add("");
        }
        
        return joiner.toString();
    }

    


    
    public String refseqDaily() {

        StringJoiner joiner = new StringJoiner("\n");

        joiner.add("# Refseq daily");
        
        joiner.add("mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/daily");

        Path srcPath = Path.of("${SRC_DATASET_DIR}", "na", "refseq", "fasta", "daily", "*.fna.gz");
        Path destPath = Path.of("${DEST_DATASET_DIR}", "na", "refseq", "fasta", "daily");

        joiner.add(String.format("cp -p %s %s", srcPath.toString(), destPath.toString()));
        joiner.add("");
        
        return joiner.toString();
    }


    

    public String refseqModel() {

        TreeMap<String, String> models = new TreeMap<>();
        models.put("B_taurus","cow.1.rna.fna.gz");
        models.put("D_rerio","zebrafish.1.rna.fna.gz");
        models.put("H_sapiens","human.1.rna.fna.gz");
        models.put("M_musculus","mouse.1.rna.fna.gz");
        models.put("R_norvegicus","rat.1.rna.fna.gz");
        models.put("S_scrofa","pig.1.rna.fna.gz");
        models.put("X_tropicalis","frog.1.rna.fna.gz");
        

        StringJoiner joiner = new StringJoiner("\n");
        
        joiner.add("# Refseq Model");

        models.forEach(
            (key, value)->{
                joiner.add("mkdir -p ${DEST_DATASET_DIR}/na/refseq/fasta/" + key + "/mRNA_Prot/");

                Path srcPath = Path.of("${SRC_DATASET_DIR}", "na", "refseq", "fasta", key, "mRNA_Prot", value);
                Path destPath = Path.of("${DEST_DATASET_DIR}", "na", "refseq", "fasta", key, "mRNA_Prot");

                joiner.add(String.format("cp -p %s %s", srcPath.toString(), destPath.toString()));
                joiner.add("");

            }
        );
        
        
        return joiner.toString();
    }


    
    public String rrna16S() {

        StringJoiner joiner = new StringJoiner("\n");

        joiner.add("# 16S rRNA");
        joiner.add("mkdir -p ${DEST_DATASET_DIR}/na/16S/fasta");

        Path srcPath = Path.of("${SRC_DATASET_DIR}", "na", "16S", "fasta", "16S.fasta.gz");
        Path destPath = Path.of("${DEST_DATASET_DIR}", "na", "16S", "fasta");

        joiner.add(String.format("cp -p %s %s", srcPath.toString(), destPath.toString()));
        joiner.add("");
        
        return joiner.toString();
    }


    
    public String uniprot() {

        StringJoiner joiner = new StringJoiner("\n");
        joiner.add("# Uniprot");
        joiner.add("mkdir -p ${DEST_DATASET_DIR}/aa/uniprot/fasta");

        Path srcPath = Path.of("${SRC_DATASET_DIR}", "aa", "uniprot", "fasta", "*.fasta.gz");
        Path destPath = Path.of("${DEST_DATASET_DIR}", "aa", "uniprot", "fasta");

        joiner.add(String.format("cp -p %s %s", srcPath.toString(), destPath.toString()));
        joiner.add("");
        
        return joiner.toString();
    }

    
    public String variables() {
        StringJoiner joiner = new StringJoiner("\n");
        joiner.add("SRC_DATASET_DIR=${HOME}/BLAST");
        joiner.add("DEST_DATASET_DIR=${HOME}/blast_test_dataset");
        joiner.add("");

        return joiner.toString();
    }
    
    




    
}
