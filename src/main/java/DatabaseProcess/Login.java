/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DatabaseProcess;
import Connection.Koneksi;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 *
 * @author yaya_aye
 */
public class Login {
    Session s = new Session();
    private String sql;
    public Boolean Login(String username, String password) throws SQLException{
        sql = " SELECT * FROM user WHERE user_name='"+username+"' AND user_password='"+password+"'  ";
        Koneksi DB = new Koneksi();
        Connection conn = DB.configDB();
        Statement stat = DB.stm;
        
        try {
            ResultSet rs = stat.executeQuery(sql);
            if (rs.next()) {
                if (username.equals(rs.getString("user_name")) && password.equals(rs.getString("user_password"))) {
                    System.out.println("Berhasil Login");
                    Session.setUser_name(rs.getString("user_name"));
                    Session.setUser_id(rs.getInt("user_id"));
                    Session.setUser_email(rs.getString("user_email"));
                    return true;
                }
            } else {
                System.out.println("Account Tidak Ada");
                return false;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
        return false;
        
    }
}
