package com.github.oogasawa.pojoactor.blastdb;


import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;

import java.nio.file.Path;

import com.github.oogasawa.pojoactor.blastdb.pojo.FastaUniquifier;
import com.github.oogasawa.pojoactor.blastdb.pojo.MinimizedDatasetGenerator;
import com.github.oogasawa.utility.cli.CliCommands;


public class App
{
    public static void main( String[] args )
    {

        var helpStr = "java -jar blastdb-updator.jar <command> <options>";
        var cli = new CliCommands();

        cli.addCommand("blastdb5:update", createUpdateOptions());
        cli.addCommand("fasta:unique", fastaUniqueOptions());
        cli.addCommand("test_dataset:generate", createTestDatasetOptions());

        try {

            CommandLine cmd = cli.parse(args);

            if (cli.getCommand() == null) {
                // check universal options.
                if (cmd.hasOption("h") || cmd.hasOption("help")) {
                    cli.printHelp(helpStr);
                }

            }
            else if (cli.getCommand().equals("blastdb5:update")) {
                UpdatorStage stage = new UpdatorStage();
                stage.start();
            }
            else if (cli.getCommand().equals("fasta:unique")) {
                FastaUniquifier unifier = new FastaUniquifier();
                String fastaBasePath = cmd.getOptionValue("fastaBasePath");
                String extension = cmd.getOptionValue("ext");
                String dbName = cmd.getOptionValue("dbName");
                unifier.readAll(Path.of(fastaBasePath), extension, dbName);

                String outfile = cmd.getOptionValue("outfile");
                unifier.write(Path.of(outfile), dbName);
            }
            else if (cli.getCommand().equals("test_dataset:generate")) {
                MinimizedDatasetGenerator gen = new MinimizedDatasetGenerator();
                gen.printShellScript();
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

        public static Options createTestDatasetOptions() {
        Options opts = new Options();

        opts.addOption(Option.builder("dataset")
                        .option("s")
                        .longOpt("dataset")
                        .hasArg(true)
                        .argName("datasetName")
                        .desc("dataset name (e.g. ddbj, 16S, ...: sorry, not impremented)")
                        .required(false)
                        .build());

        return opts;
    }

    
    public static Options fastaUniqueOptions() {
        Options opts = new Options();


        opts.addOption(Option.builder("fastaBasePath")
                        .option("b")
                        .longOpt("fastaBasePath")
                        .hasArg(true)
                        .argName("fastaBasePath")
                        .desc("A FASTA base path (e.g. '/home/you/BLAST/na/refseq/fasta/daily')")
                        .required(true)
                        .build());


        
        opts.addOption(Option.builder("dbName")
                        .option("d")
                        .longOpt("dbName")
                        .hasArg(true)
                        .argName("dbName")
                        .desc("A BDB database name in which data are uniqued.")
                        .required(true)
                        .build());

        
        opts.addOption(Option.builder("ext")
                        .option("e")
                        .longOpt("ext")
                        .hasArg(true)
                        .argName("ext")
                        .desc("An extension of FASTA files (e.g. 'fna.gz')")
                        .required(true)
                        .build());



        opts.addOption(Option.builder("outfile")
                       .option("o")
                       .longOpt("outfile")
                       .hasArg(true)
                       .argName("outfile")
                       .desc("An output FASTA file (e.g. 'result.fasta')")
                       .required(true)
                       .build());

        
        return opts;
    }



}

