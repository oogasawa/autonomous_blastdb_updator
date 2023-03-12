package com.github.oogasawa.pojoactor.blastdb.pojo;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.github.oogasawa.utility.files.FileIO;



public class ScriptExecutor {

    private static final Logger logger = Logger.getLogger("com.github.oogasawa.pojoactor.pojo.ScriptExecutor");
    
    String seqType;
    String dbName;
    String scriptName;

    
    public static void main(String args[]) {

        BlastdbDir blastdbDir = new BlastdbDir();        
        Path buildDir = blastdbDir.createBuildDirectory(LocalDateTime.now(), true);

        var obj = new ScriptExecutor();
        System.out.println(obj.execute("na", "test", buildDir));
        //System.out.println(obj.execute("na", "ddbj_general", buildDir));
    }



    /** Copies a shell script from the resources directory to a calculation node.
     *
     * This method copies a shell script for creating BLAST databases
     * from the resources directory ({@code src/main/resources}) in the jar file
     * to the "na" or "aa" directory under the blastdb base directory (e.g. {@code $HOME/blastdb5/latest/na}) on a calculation node,
     * where the {@code makeblastdb} is to be run. 
     *
     * It is assumed that the "na" directory on the computation node already exists.
     * 
     * @param dbName A database name (One of: ddbj_general, ddbj_other, 16S, refseq_daily, refseq_genomic, refseq_rna and refseq_model)
     * @param scriptMap 
     * @param xxBuidDir A target directory of BLAST databases (e.g. {@code $HOME/blastdb5/build_230306_1028/na}).
     * 
     */
    public void deployScript(String dbName, Path xxBuildDir) {
        Path outfilePath = xxBuildDir.resolve(scriptName);

        try (InputStream in = getClass().getResourceAsStream("/" + scriptName);
                PrintWriter out = FileIO.getPrintWriter(outfilePath.toString())) {
            BufferedReader reader = new BufferedReader(new InputStreamReader(in));

            String line = null;
            while ((line = reader.readLine()) != null) {
                out.write(line + "\n");
            }
        } catch (IOException e) {
            logger.log(Level.SEVERE, "Failed to create a shell script.", e);
        }
    }    


    /** Executes a makeblastdb shell script on buildDir.
     *
     * @param buildDir A directory on which a makeblastdb shell script is executed. (e.g. {@code $HOME/blastdb5/build_230308})
     * @return A return code of the shell script.
     */
    public int execute(Path buildDir) {
        return this.execute(this.seqType, this.dbName, buildDir);
    }

    
    public int execute(String seqType, String dbName, Path buildDir) {

        int result = -1;

        try {
            if (seqType.equals("na")) {
                Path naBuildDir = buildDir.resolve("na");

                deployScript(dbName, naBuildDir);

                String resultFileName = "result_" + dbName + ".txt";
                Process p = new ProcessBuilder("/bin/bash", scriptName)
                    .directory(naBuildDir.toFile())
                    .redirectErrorStream(true)
                    .redirectOutput(new File(naBuildDir + "/" + resultFileName))
                    .start();

                result = p.waitFor();
                
            } else if (seqType.equals("aa")) {
                Path aaBuildDir = buildDir.resolve("aa");
                deployScript(dbName, aaBuildDir);

                String resultFileName = "result_" + dbName + ".txt";
                Process p = new ProcessBuilder("/bin/bash", scriptName)
                    .directory(aaBuildDir.toFile())
                    .redirectErrorStream(true)
                    .redirectOutput(new File(aaBuildDir + "/" + resultFileName))
                    .start();

                result = p.waitFor();
            }
        } catch (IOException e) {
            logger.log(Level.SEVERE, "IOException: " + dbName, e);
        } catch (InterruptedException e) {
            logger.log(Level.SEVERE, "Interrupted: " + dbName, e);
        }

        return result;
    }


    public void init(String seqType, String dbName) {
        this.seqType = seqType;
        this.dbName = dbName;
        this.scriptName = "makeblastdb_" + dbName + ".sh";
        //this.scriptName = "test_workload.sh"; // for the testing purpose.
    }
    
}
