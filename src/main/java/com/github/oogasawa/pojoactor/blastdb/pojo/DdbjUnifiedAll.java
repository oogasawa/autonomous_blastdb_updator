package com.github.oogasawa.pojoactor.blastdb.pojo;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class DdbjUnifiedAll {

    final Path basePath = Path.of("/home/w3wabi/BLAST/na/ddbj/fasta");
    
    public static void main(String[] args) {
        DdbjUnifiedAll obj = new DdbjUnifiedAll();
        obj.summalizeFileList();
    }

    public void summalizeFileList() {
        try {
            Files.list(basePath)
                .map((path)->{return path.getFileName();})
                .forEach((name)->{System.out.println(name);});
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
}
