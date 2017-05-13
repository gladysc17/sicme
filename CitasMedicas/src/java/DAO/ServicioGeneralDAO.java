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

        String sql = "INSERT INTO serviciogeneral (identificacion, tipodocumentoid, codigo, nombre, correo, "
                + "fechanacimiento, genero, edad, estadocivil, direccion, telefono)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, sg.getIdentificacion());
        ps.setString(2, sg.getTipodocumentoid());
        ps.setInt(3, sg.getCodigo());
        ps.setString(4, sg.getNombre());
        ps.setString(5, sg.getCorreo());
        ps.setString(6, sg.getFechanacimiento());
        ps.setString(7, sg.getGenero());
        ps.setInt(8, sg.getEdad());
        ps.setString(9, sg.getEstadocivil());
        ps.setString(10, sg.getDireccion());
        ps.setString(11, sg.getTelefono());  

        int resultado = ps.executeUpdate();

        if (resultado == 1) {
            return true;
        } else {
            return false;
        }

    }
     public ServicioGeneralDTO consultarServicioGeneralPorId(int id) throws SQLException {

        String sql = "SELECT * FROM serviciogeneral WHERE identificacion = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        ServicioGeneralDTO sg = null;

        if (rs.next()) {
            sg = new ServicioGeneralDTO();
            
            sg.setIdentificacion(rs.getInt("identificacion"));
            sg.setTipodocumentoid(rs.getString("tipodocumentoid"));
            sg.setCodigo(rs.getInt("codigo"));
            sg.setNombre(rs.getString("nombre"));
            sg.setCorreo(rs.getString("correo"));
            sg.setFechanacimiento(rs.getString("fechanacimiento"));      
            sg.setGenero(rs.getString("genero"));
            sg.setEdad(rs.getInt("edad"));
            sg.setEstadocivil(rs.getString("estadocivil"));
            sg.setDireccion(rs.getString("direccion"));
            sg.setTelefono(rs.getString("telefono"));   
        }
        return sg;
    }
     
     public List<ServicioGeneralDTO> consultarServicioGeneral() throws SQLException {

        List<ServicioGeneralDTO> listaSg = new ArrayList<ServicioGeneralDTO>();

        String sql = "SELECT * FROM serviciogeneral ORDER BY nombre";

        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        ServicioGeneralDTO sg = null;

        while (rs.next()) {
            sg = new ServicioGeneralDTO();
            sg.setIdentificacion(rs.getInt("identificacion"));
            sg.setTipodocumentoid(rs.getString("tipodocumentoid"));
            sg.setCodigo(rs.getInt("codigo"));
            sg.setNombre(rs.getString("nombre"));
            sg.setCorreo(rs.getString("correo"));
            sg.setFechanacimiento(rs.getString("fechanacimiento"));      
            sg.setGenero(rs.getString("genero"));
            sg.setEdad(rs.getInt("edad"));
            sg.setEstadocivil(rs.getString("estadocivil"));
            sg.setDireccion(rs.getString("direccion"));
            sg.setTelefono(rs.getString("telefono"));

            listaSg.add(sg);
        }

        return listaSg;

    }
     
      public ServicioGeneralDTO consultarServicioGeneralPorIdCodigo(int id, int codigo) throws SQLException {

        String sql = "SELECT * FROM serviciogeneral WHERE identificacion = ? OR codigo = ? ";

        PreparedStatement ps = con.prepareStatement(sql);               

        ps.setInt(1, id);
        ps.setInt(2, codigo);

        ResultSet rs = ps.executeQuery();                             

        ServicioGeneralDTO sg = null;

        if (rs.next()) {
            sg = new ServicioGeneralDTO();
            
            sg = new ServicioGeneralDTO();
            sg.setIdentificacion(rs.getInt("identificacion"));
            sg.setTipodocumentoid(rs.getString("tipodocumentoid"));
            sg.setCodigo(rs.getInt("codigo"));
            sg.setNombre(rs.getString("nombre"));
            sg.setCorreo(rs.getString("correo"));
            sg.setFechanacimiento(rs.getString("fechanacimiento"));      
            sg.setGenero(rs.getString("genero"));
            sg.setEdad(rs.getInt("edad"));
            sg.setEstadocivil(rs.getString("estadocivil"));
            sg.setDireccion(rs.getString("direccion"));
            sg.setTelefono(rs.getString("telefono"));                             
        }
        
        return sg;

    }
    
    public boolean modificarServicioGeneral(int identificacion, String correo, String fechanacimiento, String genero, String estadocivil, String direccion, String telefono) throws SQLException{
          
            String sql = "UPDATE serviciogeneral SET correo = ? , fechanacimiento = ?, genero = ?, estadocivil = ? , direccion =?, telefono = ? "
                + "WHERE  identificacion = ?";

        PreparedStatement ps = con.prepareStatement(sql);
                
        ps.setString(1, correo);
        ps.setString(2, fechanacimiento);        
        ps.setString(3, genero);
        ps.setString(4, estadocivil);  
        ps.setString(5, direccion);
        ps.setString(6, telefono);        
        ps.setInt(7, identificacion);
        
        int rta = ps.executeUpdate();

        return rta > 0;
          
      }
}
