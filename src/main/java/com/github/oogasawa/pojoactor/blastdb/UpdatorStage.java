package com.github.oogasawa.pojoactor.blastdb;

import java.util.concurrent.CompletableFuture;

import com.github.oogasawa.pojoactor.ActorRef;
import com.github.oogasawa.pojoactor.ActorSystem;
import com.github.oogasawa.pojoactor.blastdb.pojo.Updator;

public class UpdatorStage {

    public static void exec() {

        ActorSystem system = new ActorSystem("blast_updator", 10);

        ActorRef<Updator> actor = system.actorOf("", new Updator());
     //   CompletableFuture<Void> result = actor.tell((a)->a.update());
        
    }
    
}
