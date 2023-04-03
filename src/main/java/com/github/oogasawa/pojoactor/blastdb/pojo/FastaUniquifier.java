package com.github.oogasawa.pojoactor.blastdb.pojo;

import java.io.IOException;
import java.nio.file.Path;
import java.util.Iterator;
import java.util.StringJoiner;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

import com.github.oogasawa.datacell.DataCell;
import com.github.oogasawa.datacell.bdb.BDBFactory;
import com.github.oogasawa.datacell.container.DCContainer;
import com.github.oogasawa.utility.files.FileIO;

import org.apache.commons.configuration2.ex.ConfigurationException;


public class FastaUniquifier {

    private static final Logger logger = Logger.getLogger("com.github.oogasawa.pojoactor.pojo.FastaUniquifier");
    
    
    /** Reads a FASTA file into a BDB database, with removing duplication of sequence IDs.
     *
     * When there are multiple identical IDs, the one that appears later takes precedence.
     * (The data of the one that appears later will overwrite the data of the one that appeared earlier.)
     * 
     * @param infile A FASTA file path.
     * @param dbName  A BDB database name.
     */
    public void read(Path infile, String dbName) {

        
        logger.logp(Level.INFO, FastaUniquifier.class.getName(), "read", "enter");
        logger.info("infile: " + infile.toString());
        
        Pattern pDescLine = Pattern.compile("^>(\\S+)\s+(.+)$");
        Pattern pSeqLine = Pattern.compile("^([ a-zA-Z]+)$");
        Pattern pNullLine = Pattern.compile("^\s*$");
        
        BDBFactory facObj = new BDBFactory();
        DCContainer dbObj = null;
        try {
            dbObj = facObj.getInstance(dbName);

            String key = null;
            StringJoiner value = new StringJoiner("\n");
            try (var in = FileIO.getBufferedReaderGz(infile.toString())) {
                String line = null;
                while ((line = in.readLine()) != null) {

                    // description line.
                    Matcher m = pDescLine.matcher(line);
                    if (m.find()) {

                        if (key != null) {
                            dbObj.putRowWithReplacingValues("seqId", key, "contents", value.toString());
                            value = new StringJoiner("\n");
                        }
                
                        key = m.group(1);
                        value.add(line);
                        continue;
                    }

                    // empty (null) line
                    m = pNullLine.matcher(line);
                    if (m.matches()) {
                        continue;
                    }

                    // sequence line
                    m = pSeqLine.matcher(line);
                    if (m.matches()) {
                        value.add(line);
                        continue;
                    }

                    logger.log(Level.WARNING, "Unexpected line in the FASTA: " + line);
                }
                
            } catch (IOException e) {
                logger.log(Level.SEVERE, "Error at opening FASTA file " + infile.toString(), e);
            }
            
        } catch (ConfigurationException e) {
            logger.log(Level.SEVERE, "Error at opening BDB database " + dbName, e);
        }
        finally {
            logger.logp(Level.INFO, FastaUniquifier.class.getName(), "read", "exit");
            dbObj.close();
        }
        

    }    

    /** Reads all FASTA files in a given directory to a BDB database in date order.
     *
     * @param fastaBasePath A directory where FASTA files are located.
     * @param ext An extension. (e.g. ".fna.gz")
     * @param dbName BDB database name.
     */
    public void readAll(Path fastaBasePath, String ext, String dbName) {

        logger.logp(Level.INFO, FastaUniquifier.class.getName(), "readAll", "enter");
        logger.log(Level.INFO, "fastaBasePath: " + fastaBasePath.toString());
        
        Stream.of(fastaBasePath.toFile().listFiles())
            .filter(f->f.getName().endsWith(ext))
            .sorted((f1, f2)->{
                    if ( f1.lastModified() > f2.lastModified() )
                        return 1;
                    else if (f1.lastModified() == f2.lastModified())
                        return 0;
                    else
                        return -1;
                })
            .forEach((f)->{
                    this.read(f.toPath(), dbName);
                });

        logger.logp(Level.INFO, FastaUniquifier.class.getName(), "readAll", "exit");
    }


    

    /** Writes all the uniquified FASTA data in a BDB database to a text file.
     *
     * This method writes out all the data in the BDB represented as dbName into the outfile.
     * 
     * @param outfile A FASTA file path.
     * @param dbName  A BDB database name.
     */
    public void write(Path outfile, String dbName) {

        logger.logp(Level.INFO, FastaUniquifier.class.getName(), "write", "enter");
        
        BDBFactory facObj = new BDBFactory();
        DCContainer dbObj = null;
        
        try {
            dbObj = facObj.getInstance(dbName);

            try (var out = FileIO.getPrintWriter(outfile.toFile())) {

                dbObj.setIterableTable("seqId", "contents");
                Iterator<DataCell> iter = dbObj.iterator();
                while (iter.hasNext()) {
                    DataCell cell = iter.next();
                    out.write(cell.getValue() + "\n\n");
                }
                
                
            } catch (IOException e) {
                logger.log(Level.SEVERE, "Error at opening FASTA file " + outfile.toString(), e);
            }

            
            
        } catch (ConfigurationException e) {
            logger.log(Level.SEVERE, "Error at opening BDB database " + dbName, e);
        }
        finally {
            logger.logp(Level.INFO, FastaUniquifier.class.getName(), "write", "exit");
            dbObj.close();
        }
        
    }



    
}
