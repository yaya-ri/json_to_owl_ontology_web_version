/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Proses;

import DatabaseProcess.Session;
import JsonToOntology.BuildFile;
import JsonToOntology.GenerateJsonToSchema;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author yaya_aye
 */
@MultipartConfig
@WebServlet(name = "ProsesKonversi", urlPatterns = {"/ProsesKonversi"})
public class ProsesKonversi extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, FileNotFoundException {

        Part getJson = req.getPart("jsonData");
        String getNameWithType = getSubmittedFileName(getJson);

        // regex get name before .
        String[] parts = getNameWithType.split("\\.");
        String finalName = parts[0];
        
        GenerateJsonToSchema generateResult = new GenerateJsonToSchema();
        BuildFile b = new BuildFile();
        generateResult.GenerateJsonToSchema(finalName);
        
        if (generateResult.GenerateJsonToSchema(finalName)) {
            try {
                b.BuildFile(finalName);
            } catch (SQLException ex) {
                Logger.getLogger(ProsesKonversi.class.getName()).log(Level.SEVERE, null, ex);
            }
            Session.setFileName(finalName);
            if(Session.getUser_id()>0){
                res.sendRedirect("result_l.jsp");
            }else{
                res.sendRedirect("result.jsp");
            }
        } else if(!generateResult.GenerateJsonToSchema(finalName)) {
            res.sendRedirect("home_l.jsp");
        } else {
            res.sendRedirect("login.jsp");
        }
    }

    private static String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }
}
