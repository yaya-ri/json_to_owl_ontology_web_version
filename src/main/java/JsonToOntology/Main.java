/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JsonToOntology;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author yaya_aye
 */
public class Main {
    public static void main(String[] args) throws IOException, FileNotFoundException {
        String jsonFile="antrian_rsjd";
        String jsonFile1 = "kesehatan1";
        GenerateJsonToSchema generateResult = new GenerateJsonToSchema();
        BuildFile builfFile = new BuildFile();
        //generateResult.GenerateJsonToSchema(jsonFile);
        if (generateResult.GenerateJsonToSchema(jsonFile1)) {
            try {
                builfFile.BuildFile(jsonFile1);
            } catch (SQLException ex) {
                Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
}
