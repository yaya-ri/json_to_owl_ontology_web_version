/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author yaya_aye
 */
public class Koneksi {
    //public static Connection con;
    public static Statement stm;
    private static Connection mysqlconfig;
    public static Connection configDB() throws SQLException {
        try {
            String url = "jdbc:mysql://localhost:3306/ta"; //url database
            String user = "root"; //user database
            String pass = ""; //password database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            mysqlconfig = DriverManager.getConnection(url, user, pass);
            stm = mysqlconfig.createStatement();
            //System.out.println("berhasil");
        } catch (Exception e) {
            System.err.println("koneksi gagal " + e.getMessage()); //perintah menampilkan error pada koneksi
        }
        return mysqlconfig;
    }
}
