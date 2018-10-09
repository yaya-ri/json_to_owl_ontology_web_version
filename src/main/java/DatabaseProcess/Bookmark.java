/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DatabaseProcess;

import Connection.Koneksi;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author yaya_aye
 */
public class Bookmark {
    
    public void AddBookmark(String fileName) throws SQLException{
        //String sql = "INSERT INTO ontology VALUES ('"+1+"','" + fileName + "')";
        String sql = "INSERT INTO bookmark (bookmark_file,user_id) VALUES ('" + fileName + "','" + Session.getUser_id() + "')";
        java.sql.Connection conn = (Connection) Koneksi.configDB();
        java.sql.PreparedStatement pst = conn.prepareStatement(sql);
        pst.execute();
    }
    
    
}
