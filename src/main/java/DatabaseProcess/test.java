/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DatabaseProcess;

import java.sql.SQLException;

/**
 *
 * @author yaya_aye
 */
public class test {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        Login l = new Login();
        l.Login("yaya", "1234");
        //System.out.println(l.Login("yaya", "1234"));
        System.out.println(Session.getUser_id());
        System.out.println(Session.getUser_name());
        System.out.println(Session.getUser_email());
    }
    
}
