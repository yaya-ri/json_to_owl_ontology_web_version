/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Proses;

import DatabaseProcess.Bookmark;
import DatabaseProcess.Login;
import DatabaseProcess.Session;
import JsonToOntology.BuildFile;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author yaya_aye
 */
@WebServlet(name = "ProsesAddBookmark", urlPatterns = {"/ProsesAddBookmark"})
public class ProsesAddBookmark extends HttpServlet {

    

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        Bookmark bookmark = new Bookmark();
        try {
            bookmark.AddBookmark(Session.getFileName());
            res.sendRedirect("home_l.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(ProsesAddBookmark.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
