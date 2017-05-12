/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.AdministradorDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 *
 * @author Gladys M
 */
public class AdministradorDAO {
    
    private Connection con;

    public AdministradorDAO(Connection con) {
        this.con = con;
    }
    
   /**
    * Metodo que consulta un Administrador en la Base de Datos según su Identificación
    * @param id
    * @return Objeto de tipp AdministradorDTO
    * @throws SQLException Error de ejecución de sql, ocurre si hace falta algun campo de la base de datos por llenar.
    */
    public AdministradorDTO consultarAdminporId(int id) throws SQLException{               
        
        String sql = "SELECT * FROM administrador WHERE identificacion_administrador = ? ";
        
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setInt(1, id);
        
        ResultSet rs = ps.executeQuery();
        
        AdministradorDTO admin = null;
        
        if(rs.next()){
            
            admin = new AdministradorDTO();
            
            admin.setIdentificacion_administrador(rs.getInt("identificacion_administrador"));
            admin.setNombre_administrador(rs.getString("nombre_administrador"));
            admin.setCorreo_administrador(rs.getString("correo_administrador"));
            admin.setTelefono_administrador(rs.getString("telefono_administrador"));
            admin.setCodigo_administrador(rs.getInt("codigo_administrador"));
            admin.setFechanacimiento_administrador(rs.getString("fechanacimiento_administrador"));
            admin.setGenero_administrador(rs.getString("genero_administrador"));
            admin.setEstadocivil_administrador(rs.getString("estadocivil_administrador"));
            admin.setDireccion_administrador(rs.getString("direccion_administrador"));    
            admin.setContrasena_administrador(rs.getString("contrasena_administrador"));                        
            
        }
        
        
        return admin;
        
    }
    
    public boolean modificarAdmin(int identificacion_administrador, String correo_administrador, String telefono_administrador, String contrasena_administrador, String direccion_administrador,
                                  String fechanacimiento_administrador, String genero_administrador, String estadocivil_administrador  ) throws SQLException{
        
        String sql = "UPDATE administrador SET correo_administrador = ?, telefono_administrador = ?, contrasena_administrador = ?, direccion_administrador = ?, "
                + " fechanacimiento_administrador = ?, genero_administrador = ?, estadocivil_administrador = ?"
                + "WHERE identificacion_administrador = ? ";
        
        PreparedStatement ps = con.prepareStatement(sql);                
         
        ps.setString(1, correo_administrador);
        ps.setString(2, telefono_administrador);
        ps.setString(3, contrasena_administrador);
        ps.setString(4, direccion_administrador);
        ps.setString(5, fechanacimiento_administrador);
        ps.setString(6, genero_administrador);
        ps.setString(7, estadocivil_administrador);
        ps.setInt(8, identificacion_administrador);                
        
        int rta = ps.executeUpdate();
        
        if(rta > 0){
            return true;
            
        }
        else
            return false;
        
    }
}
