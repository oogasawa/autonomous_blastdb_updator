package com.github.oogasawa.pojoactor.blastdb;

import java.io.BufferedReader;
import java.util.List;
import java.util.logging.Logger;
import java.io.InputStreamReader;


import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;



public class App2
{

    private static final Logger logger = Logger.getLogger(App2.class.getName());

    String      synopsis = "java -jar autonomous_blastdb.jar <command> <options>";
    CliCommands cmds     = new CliCommands();

    
    public static void main( String[] args )
    {
        App app = new App();
        
        app.setupCommands();

        try {

            CommandLine cl = app.cmds.parse(args);
            String command = app.cmds.getCommand();
            
            if (command == null) {
                app.cmds.printCommandList(app.synopsis);
            }
            else if (app.cmds.hasCommand(command)) {
                app.cmds.execute(command, cl);
            }
            else {
                System.err.println("The specified command is not available: " + app.cmds.getCommand());
                app.cmds.printCommandList(app.synopsis);
            }

        } catch (ParseException e) {
            System.err.println("Parsing failed.  Reason: " + e.getMessage() + "\n");
            app.cmds.printCommandHelp(app.cmds.getCommand());
        } 
            
    
    }


    
    public void setupCommands() {
    
        dbUngzipCommand();
        tsvGetColumnsCommand();

    }


    public void lineGetColumnsCommand() {
        Options opts = new Options();

        opts.addOption(Option.builder("dir")
                        .option("d")
                        .longOpt("dir")
                        .hasArg(true)
                        .argName("dir")
                        .desc("Directory of the compressed BLAST database. (default: current directory)")
                        .required(false)
                        .build());

        opts.addOption(Option.builder("processes")
                        .option("p")
                        .longOpt("processes")
                        .hasArg(true)
                        .argName("processes")
                        .desc("Number of simultaneous executions of decompression programs. (default: 4)")
                        .required(false)
                        .build());


    
        this.cmds.addCommand("db:ungzip", opts,
                       "Ungzip all compressed BLAST database files in parallel.",
                       (CommandLine cl)-> {
                            String workdir = cl.getOptionValue("dir", System.getenv("PWD"));
                            int numOfProcesses = cl.getOptionValue("processes", "4").parseInt();

                            UngzipTeam team = new UngzipTeam();
                            team.setOptions(cl);
                            team.start();
                       });
        
    }


}
