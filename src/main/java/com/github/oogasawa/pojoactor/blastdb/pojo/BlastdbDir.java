package com.github.oogasawa.pojoactor.blastdb.pojo;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;


/** This class holds information about the directories where the Blast databases are created.
 *
 * The directories and its variable name involved include the following:
 * <ul>
 * <li>{@code blastdbBaseDir} : e.g. {@code $HOME/blastdb5}</li>
 * <li>{@code buildDir} : e.g. {@code $HOME/blastdb5/build_230306_0917}</li>
 * <li>{@code naBuildDir} : e.g. {@code $HOME/blastdb5/build_230306_0917/na}</li>
 * <li>{@code aaBuildDir} : e.g. {@code $HOME/blastdb5/build_230306_0917/aa}</li>
 * </ul>
 *
 * 
 */
public class BlastdbDir {

    private static final Logger logger = Logger.getLogger("com.github.oogasawa.pojoactor.blastdb.pojo.BlastdbDir");
    
    Path blastdbBaseDir = null;
    
    public static void main(String[] args) {
        BlastdbDir obj = new BlastdbDir();
        
        System.out.println(obj.createBuildDirectory(LocalDateTime.now(), true));
    }


    public BlastdbDir() {
        initBlastdbBaseDir();
    }


    public Path createBuildDirectory(LocalDateTime dt, boolean latestLink ) {
        Path buildDirectory = generateBuildDirectoryPath(dt);

        Path naBuildDir = buildDirectory.resolve("na");
        naBuildDir.toFile().mkdirs();

        Path aaBuildDir = buildDirectory.resolve("aa");
        aaBuildDir.toFile().mkdirs();
        
        if (latestLink == true) {
            updateLatestLink(buildDirectory);
        }
        
        return buildDirectory;
    }
    
    
    private Path generateBuildDirectoryPath(LocalDateTime dt) {
        Path buildDir = blastdbBaseDir.resolve(generateBuildDirectoryName(dt));
        return buildDir;
    }


    private String generateBuildDirectoryName(LocalDateTime dt) {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd_HHmm");        
        return "build_" + dt.format(formatter);
    }

    

    public void initBlastdbBaseDir() {
        String homeDir = System.getenv("HOME");
        blastdbBaseDir = Path.of(homeDir, "blastdb5");
    }


    private boolean updateLatestLink(Path buildDirectory) {
        boolean result = false;
        Path link = blastdbBaseDir.resolve("latest");
        try {
            if (Files.exists(link)) {
                Files.delete(link);
            }
            Files.createSymbolicLink(link, buildDirectory);
            result = true;
        } catch (IOException e) {
            logger.log(Level.SEVERE, "Failed to create the symbolic link (named latest)." , e);
        }
        
        return result;
    }


    
}
