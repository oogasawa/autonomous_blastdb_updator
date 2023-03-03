package com.github.oogasawa.pojoactor.blastdb;


import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;

import com.github.oogasawa.utility.cli.CliCommands;


public class App
{
    public static void main( String[] args )
    {

        var helpStr = "java -jar blastdb-updator.jar <command> <options>";
        var cli = new CliCommands();

        cli.addCommand("update", createUpdateOptions());
        //cli.addCommand("dummy", createDummyOptions());

        try {

            CommandLine cmd = cli.parse(args);

            if (cli.getCommand() == null) {
                // check universal options.
                if (cmd.hasOption("h") || cmd.hasOption("help")) {
                    cli.printHelp(helpStr);
                }

            }
            else if (cli.getCommand().equals("update")) {

            }
            else {
                cli.printHelp(helpStr);
            }

        } catch (ParseException e) {
            System.err.println("Parsing failed.  Reason: " + e.getMessage());
            cli.printHelp(helpStr);
        }
    }



    public static Options createUpdateOptions() {
        Options opts = new Options();

        opts.addOption(Option.builder("threadNum")
                        .option("n")
                        .longOpt("threadNum")
                        .hasArg(true)
                        .argName("threadNum")
                        .desc("Number of Threads")
                        .required(true)
                        .build());

        return opts;
    }



}

