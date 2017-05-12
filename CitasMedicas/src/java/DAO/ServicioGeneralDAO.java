/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.ServicioGeneralDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class ServicioGeneralDAO {
    
    private Connection con;

    public ServicioGeneralDAO(Connection con) {
        this.con = con;
    }
    
    public boolean registrarServicioGeneral(ServicioGeneralDTO sg) throws SQLException {

        String sql = "INSERT INTO serviciogeneral (identificacion_sg, tipodocumentoid_sg, codigo_sg, nombre_sg, correo_sg, "
                + "fechanacimiento_sg, genero_sg, edad_sg, estadocivil_sg, direccion_sg, telefono_sg)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, sg.getIdentificacion_sg());
        ps.setString(2, sg.getTipodocumentoid_sg());
        ps.setInt(3, sg.getCodigo_sg());
        ps.setString(4, sg.getNombre_sg());
        ps.setString(5, sg.getCorreo_sg());
        ps.setString(6, sg.getFechanacimiento_sg());
        ps.setString(7, sg.getGenero_sg());
        ps.setInt(8, sg.getEdad_sg());
        ps.setString(9, sg.getEstadocivil_sg());
        ps.setString(10, sg.getDireccion_sg());
        ps.setString(11, sg.getTelefono_sg());  

        int resultado = ps.executeUpdate();

        if (resultado == 1) {
            return true;
        } else {
            return false;
        }

    }
     public ServicioGeneralDTO consultarServicioGeneralPorId(int id) throws SQLException {

        String sql = "SELECT * FROM serviciogeneral WHERE identificacion_sg = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        ServicioGeneralDTO sg = null;

        if (rs.next()) {
            sg = new ServicioGeneralDTO();
            
            sg.setIdentificacion_sg(rs.getInt("identificacion_sg"));
            sg.setTipodocumentoid_sg(rs.getString("tipodocumentoid_sg"));
            sg.setCodigo_sg(rs.getInt("codigo_sg"));
            sg.setNombre_sg(rs.getString("nombre_sg"));
            sg.setCorreo_sg(rs.getString("correo_sg"));
            sg.setFechanacimiento_sg(rs.getString("fechanacimiento_sg"));      
            sg.setGenero_sg(rs.getString("genero_sg"));
            sg.setEdad_sg(rs.getInt("edad_sg"));
            sg.setEstadocivil_sg(rs.getString("estadocivil_sg"));
            sg.setDireccion_sg(rs.getString("direccion_sg"));
            sg.setTelefono_sg(rs.getString("telefono_sg"));   
        }
        return sg;
    }
     
     public List<ServicioGeneralDTO> consultarServicioGeneral() throws SQLException {

        List<ServicioGeneralDTO> listaSg = new ArrayList<ServicioGeneralDTO>();

        String sql = "SELECT * FROM serviciogeneral ORDER BY nombre_sg";

        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        ServicioGeneralDTO sg = null;

        while (rs.next()) {
            sg = new ServicioGeneralDTO();
            sg.setIdentificacion_sg(rs.getInt("identificacion_sg"));
            sg.setTipodocumentoid_sg(rs.getString("tipodocumentoid_sg"));
            sg.setCodigo_sg(rs.getInt("codigo_sg"));
            sg.setNombre_sg(rs.getString("nombre_sg"));
            sg.setCorreo_sg(rs.getString("correo_sg"));
            sg.setFechanacimiento_sg(rs.getString("fechanacimiento_sg"));      
            sg.setGenero_sg(rs.getString("genero_sg"));
            sg.setEdad_sg(rs.getInt("edad_sg"));
            sg.setEstadocivil_sg(rs.getString("estadocivil_sg"));
            sg.setDireccion_sg(rs.getString("direccion_sg"));
            sg.setTelefono_sg(rs.getString("telefono_sg"));

            listaSg.add(sg);
        }

        return listaSg;

    }
     
      public ServicioGeneralDTO consultarServicioGeneralPorIdCodigo(int id, int codigo) throws SQLException {

        String sql = "SELECT * FROM serviciogeneral WHERE identificacion_sg = ? OR codigo_sg = ? ";

        PreparedStatement ps = con.prepareStatement(sql);               

        ps.setInt(1, id);
        ps.setInt(2, codigo);

        ResultSet rs = ps.executeQuery();                             

        ServicioGeneralDTO sg = null;

        if (rs.next()) {
            sg = new ServicioGeneralDTO();
            
            sg = new ServicioGeneralDTO();
            sg.setIdentificacion_sg(rs.getInt("identificacion_sg"));
            sg.setTipodocumentoid_sg(rs.getString("tipodocumentoid_sg"));
            sg.setCodigo_sg(rs.getInt("codigo_sg"));
            sg.setNombre_sg(rs.getString("nombre_sg"));
            sg.setCorreo_sg(rs.getString("correo_sg"));
            sg.setFechanacimiento_sg(rs.getString("fechanacimiento_sg"));      
            sg.setGenero_sg(rs.getString("genero_sg"));
            sg.setEdad_sg(rs.getInt("edad_sg"));
            sg.setEstadocivil_sg(rs.getString("estadocivil_sg"));
            sg.setDireccion_sg(rs.getString("direccion_sg"));
            sg.setTelefono_sg(rs.getString("telefono_sg"));                             
        }
        
        return sg;

    }
    
    public boolean modificarServicioGeneral(int identificacion_sg, String correo_sg, String fechanacimiento_sg, String genero_sg, String estadocivil_sg, String direccion_sg, String telefono_sg) throws SQLException{
          
            String sql = "UPDATE serviciogeneral SET correo_sg = ? , fechanacimiento_sg = ?, genero_sg = ?, estadocivil_sg = ? , direccion_sg =?, telefono_sg = ? "
                + "WHERE  identificacion_sg = ?";

        PreparedStatement ps = con.prepareStatement(sql);
                
        ps.setString(1, correo_sg);
        ps.setString(2, fechanacimiento_sg);        
        ps.setString(3, genero_sg);
        ps.setString(4, estadocivil_sg);  
        ps.setString(5, direccion_sg);
        ps.setString(6, telefono_sg);        
        ps.setInt(7, identificacion_sg);
        
        int rta = ps.executeUpdate();

        return rta > 0;
          
      }
}
