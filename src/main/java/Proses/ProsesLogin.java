/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Proses;

import DatabaseProcess.Login;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ProsesLogin", urlPatterns = {"/ProsesLogin"})
public class ProsesLogin extends HttpServlet {
    
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        
        String getUsername = req.getParameter("username");
        String getPassword = req.getParameter("password");

        Login l = new Login();
        try {
            if (l.Login(getUsername, getPassword)) {
                res.sendRedirect("home_l.jsp");
            } else {
                res.sendRedirect("login.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProsesLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
