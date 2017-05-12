/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;
import java.sql.*;

/**
 *
 * @author GLADYS
 */
public class probarConexion {
    
    public static void main(String [] arg){
        
        ConexionPostgres c = new ConexionPostgres();
        
        Connection con = c.getconexion();
        
        if( c != null){
            System.out.println("HAY CONEXION");
        }
        else{
            System.out.println("NO HAY CONEXION");
        }
    }
    
}
