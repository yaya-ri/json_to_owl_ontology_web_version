/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JsonToOntology;

import Connection.Koneksi;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import org.apache.jena.ontology.DatatypeProperty;
import org.apache.jena.ontology.Individual;
import org.apache.jena.ontology.ObjectProperty;
import org.apache.jena.ontology.OntClass;
import org.apache.jena.ontology.OntModel;
import org.apache.jena.ontology.OntModelSpec;
import org.apache.jena.rdf.model.Literal;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.Property;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.rdf.model.Statement;
import org.apache.jena.util.PrintUtil;
import org.apache.jena.vocabulary.XSD;

/**
 *
 * @author yaya_aye
 */
public class BuildOntology {
    public boolean BuildOWLOntology(ArrayList<String> listClass, ArrayList<String>[] listObjectProperty, ArrayList<String>[] listDataTypeProperty, ArrayList<String>[] listIndividu, ArrayList<String>[] listStatementDataTypeProperty, ArrayList<String>[] listStatementObjectProperty, String jsonFileName) throws FileNotFoundException, SQLException {
        boolean check=false;
//        org.apache.log4j.Logger.getRootLogger().setLevel(org.apache.log4j.Level.OFF);
        String mergeURI = "http://www.example.com/merge.owl#";
        PrintUtil.registerPrefix("merge", mergeURI);

        OntModel mo = ModelFactory.createOntologyModel(OntModelSpec.OWL_MEM);
        mo.setNsPrefix("", mergeURI);
        mo.setNsPrefix("base", mergeURI);

//        Create Class
        for (int i = 0; i < listClass.size(); i++) {
            mo.createClass(mergeURI + listClass.get(i));
        }

//        Create Object Property
        for (int i = 0; i < listObjectProperty.length; i++) {
            ObjectProperty oop = mo.createObjectProperty(mergeURI + listObjectProperty[i].get(1));
            oop.addDomain(mo.getResource(mergeURI + listObjectProperty[i].get(0)));
            oop.addRange(mo.getResource(mergeURI + listObjectProperty[i].get(2)));
        }

        //Create Data type property
        for (int i = 0; i < listDataTypeProperty.length; i++) {
            DatatypeProperty dt = mo.createDatatypeProperty(mergeURI + "punya" + listDataTypeProperty[i].get(1));
            dt.addDomain(mo.getResource(mergeURI + listDataTypeProperty[i].get(0)));
            if (listDataTypeProperty[i].get(2).equalsIgnoreCase("xsd:string")) {
                dt.addRange(XSD.xstring);
            } else if (listDataTypeProperty[i].get(2).equalsIgnoreCase("xsd:integer")) {
                dt.addRange(XSD.integer);
            } else if (listDataTypeProperty[i].get(2).equalsIgnoreCase("xsd:boolean")) {
                dt.addRange(XSD.xboolean);
            }

        }
//
//        //Create individu
        for (int i = 0; i < listIndividu.length; i++) {
            OntClass newclass = mo.getOntClass(mergeURI + listIndividu[i].get(1));
            mo.createIndividual(mergeURI + listIndividu[i].get(0), newclass);
        }

//        //Create Statement Data Type Property
        for (int i = 0; i < listStatementDataTypeProperty.length; i++) {
            //System.out.println(listStatement[i].get(1));
            Literal r = mo.createLiteral(mergeURI + listStatementDataTypeProperty[i].get(2));
            Individual ex = mo.getIndividual(mergeURI + listStatementDataTypeProperty[i].get(0));
            Property ex1 = mo.getProperty(mergeURI + listStatementDataTypeProperty[i].get(1));
            Statement news = mo.createStatement(ex, ex1, r);
            //System.out.println(news);
            mo.add(news);
        }
//                
        //Create Statement Data Type Property
        for (int i = 0; i < listStatementObjectProperty.length; i++) {
            Resource o = mo.createResource(mergeURI + listStatementObjectProperty[i].get(2));
            Resource ex = mo.getResource(mergeURI + listStatementObjectProperty[i].get(0));
            Property ex1 = mo.getProperty(mergeURI + listStatementObjectProperty[i].get(1));
            Statement news = mo.createStatement(ex, ex1, o);
            System.out.println(news);
            mo.add(news);
            check=true;
            
        }

        String basePath = new File("").getAbsolutePath();
        String finalPath = basePath.replace("\\", "\\\\");
        String fileName = jsonFileName+".owl";
        mo.write(new FileOutputStream("C:\\Users\\yaya_aye\\Documents\\NetBeansProjects\\TA_Web_Maven\\" + fileName));
        
        //String sql = "INSERT INTO ontology VALUES ('"+1+"','" + fileName + "')";
//        String sql = "INSERT INTO ontology (ontology_name) VALUES ('" + fileName + "')";
//        java.sql.Connection conn = (Connection) Koneksi.configDB();
//        java.sql.PreparedStatement pst = conn.prepareStatement(sql);
//        pst.execute();
        

        return check;
    }

}
