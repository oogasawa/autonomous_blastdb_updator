package com.github.oogasawa.pojoactor.blastdb.team;

import java.nio.file.Path;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.github.oogasawa.pojoactor.ActorSystem;
import com.github.oogasawa.pojoactor.blastdb.pojo.BlastdbDir;
import com.github.oogasawa.pojoactor.blastdb.pojo.ScriptExecutor;


public class UpdatorTeam {

    private static final Logger logger = Logger.getLogger("com.github.oogasawa.pojoactor.blastdb.UpdatorTeam");

    static String[] naDbNames = {
        "ddbj_general",
        "ddbj_other",
        "16S",
        "refseq_daily",
        "refseq_genomic",
        "refseq_rna",
        "refseq_model"
    };

    static String[] aaDbNames = {
        "dad",
        "patentAA",
        "uniprot"
    };

    
    //@SuppressWarnings("unchecked")
    public static void main(String[] args) {
        UpdatorTeam stage = new UpdatorTeam();
        stage.start();
    }

    
    public void start() {
        BlastdbDir dirObj = new BlastdbDir();
        Path buildDir = dirObj.createBuildDirectory(LocalDateTime.now(), true);

        int maxWorkerThreads = 10;
        ActorSystem system = new ActorSystem("blast_updator", maxWorkerThreads);

        
        // Initialize actors.
        for (String name: naDbNames) {
            system.actorOf(name, new ScriptExecutor());
            system.getActor(name).tell(a->((ScriptExecutor)a).init("na", name));
        }

        for (String name: aaDbNames) {
            system.actorOf(name, new ScriptExecutor());
            system.getActor(name).tell(a->((ScriptExecutor)a).init("aa", name));
        }
        

        // Invoke makeblastdb in CPU bound work stealing pool.
        try {
            ArrayList<CompletableFuture<Integer>> results = new ArrayList<>();

            ExecutorService wsp = system.getWorkStealingPool();

            for (String name: naDbNames) {
                logger.log(Level.INFO, String.format("execute actor %s, %s", name, buildDir.toString()));
                results.add(system.getActor(name).ask(a->{ return ((ScriptExecutor)a).execute(buildDir);}, wsp));
            }

            for (String name: aaDbNames) {
                results.add(system.getActor(name).ask(a->{ return ((ScriptExecutor)a).execute(buildDir);}, wsp));
            }

            CompletableFuture.allOf(results.toArray(new CompletableFuture[results.size()])).get();

            // Print return codes.
            ArrayList<Integer> resultsList = new ArrayList<>();
            for (CompletableFuture<Integer> cf: results) {
                resultsList.add(cf.get());
            }
            System.out.println(resultsList);

        } catch (ExecutionException e) {
            logger.log(Level.SEVERE, "ExecutionException at the execution stage.", e);

        } catch (InterruptedException e) {
            logger.log(Level.SEVERE, "InterruptedException at the execution stage.", e);
        } 
        
    }
    
}
