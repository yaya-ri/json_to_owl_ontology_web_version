/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DatabaseProcess;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

/**
 *
 * @author yaya_aye
 */
public class ReadFile {
    public String fileToString(String filename) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\yaya_aye\\Documents\\NetBeansProjects\\TA_Web_Maven\\"+filename+".owl"));
        StringBuilder builder = new StringBuilder();
        String line;

        // For every line in the file, append it to the string builder
        while ((line = reader.readLine()) != null) {
            builder.append(line + "\n");
        }

        reader.close();
        return builder.toString();
    }
}
