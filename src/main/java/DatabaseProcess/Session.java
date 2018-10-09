/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DatabaseProcess;

/**
 *
 * @author yaya_aye
 */
public class Session {
    private static int user_id;
    private static String user_name;
    private static String user_email;
    private static String user_password;
    private static String fileName;

    public static String getFileName() {
        return fileName;
    }

    public static void setFileName(String fileName) {
        Session.fileName = fileName;
    }

    public static int getUser_id() {
        return user_id;
    }

    public static void setUser_id(int user_id) {
        Session.user_id = user_id;
    }

    public static String getUser_name() {
        return user_name;
    }

    public static void setUser_name(String user_name) {
        Session.user_name = user_name;
    }

    public static String getUser_email() {
        return user_email;
    }

    public static void setUser_email(String user_email) {
        Session.user_email = user_email;
    }

    public static String getUser_password() {
        return user_password;
    }

    public static void setUser_password(String user_password) {
        Session.user_password = user_password;
    }
}
