
package UTIL;

import java.sql.Connection;
import java.sql.DriverManager;


public class ConexionBD {

    public static Connection getConexionBD(){
        Connection cn=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            cn=DriverManager.getConnection("jdbc:mysql://localhost/cesar_moza","root","");
            System.out.println("Se Conecto");
        }catch(Exception e){
            System.out.println("NO SE CONECTO");
        } return cn;
    }
    public static void main(String[] args) {
        ConexionBD obj = new ConexionBD();
        obj.getConexionBD();
    }
    
}
