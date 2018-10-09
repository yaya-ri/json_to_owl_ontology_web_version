/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Proses;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author yaya_aye
 */
@WebServlet(name = "DownloadFile", urlPatterns = {"/DownloadFile"})
public class DownloadFile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String name = request.getParameter("fileName");
        
        PrintWriter out = response.getWriter();
        String fileName = name+".owl";
        String filePath = "C:\\Users\\yaya_aye\\Documents\\NetBeansProjects\\TA_Web_Maven\\";
        response.setContentType("APPLICATION/OCTET-STREAM");
        response.setHeader("Content-Disposition", "attachment;filename=\""+fileName+"\"");
        FileInputStream fi = new FileInputStream(filePath+fileName);
        int i;
        while((i=fi.read()) != -1)
            out.write(i);
        out.close();
        fi.close();
    }
}
