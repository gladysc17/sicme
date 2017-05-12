/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package util;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que permite conectar con una Base De datos Mysql; sin embargo,
 * con solo cambiar el atributo controlador puede usarse para cualquier motor de base de datos
 * @author Marco Adarme
 * @version 2.0
 */
public class ConexionPostgres {
    
    
    
    private Connection conexion=null;
    
    private static  String bd = "DSAS";
    private static  String login = "ufps_26";
    private static  String password = "ufps_29";
    private static  String url = "jdbc:postgresql://sandbox2.ufps.edu.co/"+bd;
    private static  String controlador="org.postgresql.Driver";
    private static   JDBCMiddler jdbc;
    

    public ConexionPostgres() {
        try {
            
            DriverManager.registerDriver(new org.postgresql.Driver() );
            conexion = DriverManager.getConnection(url, login, password);
            System.out.println("Conexión a la BD ---> OK");
        } catch (SQLException ex) {
            Logger.getLogger(ConexionPostgres.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Connection getconexion(){
        return conexion;
    }
    
 
    
}