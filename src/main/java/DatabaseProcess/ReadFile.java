
package DatabaseProcess;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

/**
 *
 * @author yaya_aye
 */
public class ReadFile {
    public String fileToStringResult(String filename) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\yaya_aye\\Documents\\NetBeansProjects\\TA_Web_Maven\\"+filename+".owl"));
        StringBuilder builder = new StringBuilder();
        String line;

        // For every line in the file, append it to the string builder
        while ((line = reader.readLine()) != null) {
            builder.append("    "+line + "\n");
        }

        reader.close();
        return builder.toString();
    }
    
    public String fileToStringProcess(String filename, int cClass, int cOP, int cDP) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\yaya_aye\\Documents\\NetBeansProjects\\TA_Web_Maven\\" + filename + ".owl"));
        StringBuilder builder = new StringBuilder();
        String line;
        int i = 1;
        int ns=6;
        int cl=ns+cClass;
        int op=cl+cOP;
        int dt=op+cDP;
        // For every line in the file, append it to the string builder
        while ((line = reader.readLine()) != null) {
            builder.append("    " + line + "\n");

            if (i == ns) {
                builder.append("\n");
            } else if (i == cl) {
                builder.append("\n");
            } else if (i == op) {
                builder.append("\n");
            } else if (i == dt) {
                builder.append("\n");
            }

            i++;
        }

        reader.close();
        return builder.toString();
    }
    
    public String fileToStringInput(String filename) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\yaya_aye\\Documents\\NetBeansProjects\\TA_Web_Maven\\json-schema-generator\\file\\"+filename+".json"));
        StringBuilder builder = new StringBuilder();
        String line;

        // For every line in the file, append it to the string builder
        while ((line = reader.readLine()) != null) {
            builder.append(line + "\n");
        }

        reader.close();
        return builder.toString();
    }
    
    public String fileToStringSchema(String filename) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\yaya_aye\\Documents\\NetBeansProjects\\TA_Web_Maven\\json-schema-generator\\file\\" + filename + "_schema.json"));
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
