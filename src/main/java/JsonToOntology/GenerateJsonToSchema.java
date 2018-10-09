/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JsonToOntology;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author yaya_aye
 */
public class GenerateJsonToSchema {
    public Boolean GenerateJsonToSchema(String nameJsonFile) throws IOException {
        
        String nameJsonSchema = nameJsonFile + "_schema";
        String jsonSchema = nameJsonSchema + ".json";
        String jsonFile = nameJsonFile + ".json";
//        System.out.println(jsonFile);
//        System.out.println(jsonSchema);
        
        boolean check = new File("C:\\Users\\yaya_aye\\Documents\\NetBeansProjects\\TA_Web_Maven\\json-schema-generator\\file\\" + jsonSchema).exists();
        
        String newfile = "-o";
        String replace = "-f";
//        System.out.println(check);
        List<String> cmds;
        
        if(!check){
            cmds = Arrays.asList("cmd.exe", "/C", "json-schema-generator json-schema-generator\\file\\" + jsonFile, "-o", "json-schema-generator\\file\\" + jsonSchema);
        }else{
            cmds = Arrays.asList("cmd.exe", "/C", "json-schema-generator json-schema-generator\\file\\"+jsonFile,"-f","json-schema-generator\\file\\"+jsonSchema);
        }
        
        ProcessBuilder builder = new ProcessBuilder(cmds);
        builder.directory(new File("C:\\Users\\yaya_aye\\Documents\\NetBeansProjects\\TA_Web_Maven"));
        Process proc = builder.start();
        BufferedReader r;
        r = new BufferedReader(new InputStreamReader(proc.getInputStream()));
        String line;
        String keluaran = null;
        while (true) {
            line = r.readLine();
            //ystem.out.println(line);
            if (line == null) {
                break;
            }
            keluaran = keluaran + "\n" + line;
        }
//        System.out.println(keluaran);
        
        return check;
    }

}
