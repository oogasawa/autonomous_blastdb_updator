package com.github.oogasawa.pojoactor.blastdb.team;

import java.nio.file.Path;
import java.util.concurrent.ExecutionException;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.github.oogasawa.pojoactor.ActorSystem;
import com.github.oogasawa.pojoactor.blastdb.pojo.FastaUniquifier;

import org.apache.commons.cli.CommandLine;

public class FastaUniquifierTeam {

    private static final Logger logger = Logger.getLogger("com.github.oogasawa.pojoactor.blastdb.FastaUniquifierTeam");
    
    String fastaBasePath;
    String extension;
    String dbName;
    String outfile;
    
    public void setOptions(CommandLine cmd) {
        this.fastaBasePath = cmd.getOptionValue("fastaBasePath");
        this.extension = cmd.getOptionValue("ext");
        this.dbName = cmd.getOptionValue("dbName");

        this.outfile = cmd.getOptionValue("outfile");
    }

    
    public void start() {
    
        int maxWorkerThreads = 10;
        ActorSystem system = new ActorSystem("fasta_uniquifier", maxWorkerThreads);

        // Initialize actors
        system.actorOf("uniquifier", new FastaUniquifier());

        try {
            system.getActor("uniquifier")
                .tell(a -> ((FastaUniquifier) a).readAll(Path.of(fastaBasePath), extension, dbName),
                      system.getWorkStealingPool())
                .get();

            system.getActor("uniquifier")
                .tell(a -> ((FastaUniquifier) a).write(Path.of(outfile), dbName),
                      system.getWorkStealingPool())
                .get();
            
        } catch (InterruptedException e) {
            logger.log(Level.SEVERE, "Interrupted", e);
        } catch(ExecutionException e) {
            logger.log(Level.SEVERE, "Unexpected Error", e);
        }
        
    }
}
