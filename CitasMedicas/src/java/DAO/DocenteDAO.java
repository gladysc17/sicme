/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.DocenteDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class DocenteDAO {

    private Connection con;

    public DocenteDAO(Connection con) {
        this.con = con;
    }

    public boolean registrarDocente(DocenteDTO doc) throws SQLException {

        String sql = "INSERT INTO docente (identificacion, tipodocumentoid, codigo, nombre, correo, "
                + "fechanacimiento, genero, edad, estadocivil, direccion, telefono)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, doc.getIdentificacion());
        ps.setString(2, doc.getTipodocumentoid());
        ps.setInt(3, doc.getCodigo());
        ps.setString(4, doc.getNombre());
        ps.setString(5, doc.getCorreo());
        ps.setString(6, doc.getFechanacimiento());
        ps.setString(7, doc.getGenero());
        ps.setInt(8, doc.getEdad());
        ps.setString(9, doc.getEstadocivil());
        ps.setString(10, doc.getDireccion());
        ps.setString(11, doc.getTelefono());
        

        int resultado = ps.executeUpdate();               

        return resultado == 1;

    }

    public DocenteDTO consultarDocentePorId(int id) throws SQLException {

        String sql = "SELECT * FROM docente WHERE identificacion = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        DocenteDTO doc = null;

        if (rs.next()) {
            doc = new DocenteDTO();
            doc.setIdentificacion(rs.getInt("identificacion"));
            doc.setTipodocumentoid(rs.getString("tipodocumentoid"));
            doc.setCodigo(rs.getInt("codigo"));
            doc.setNombre(rs.getString("nombre"));
            doc.setCorreo(rs.getString("correo"));
            doc.setFechanacimiento(rs.getString("fechanacimiento"));      
            doc.setGenero(rs.getString("genero"));
            doc.setEdad(rs.getInt("edad"));
            doc.setEstadocivil(rs.getString("estadocivil"));
            doc.setDireccion(rs.getString("direccion"));
            doc.setTelefono(rs.getString("telefono"));                        
            
        }
        return doc;
    }

    public List<DocenteDTO> consultarDocentes() throws SQLException {

        List<DocenteDTO> listaDoc = new ArrayList<DocenteDTO>();

        String sql = "SELECT * FROM docente ORDER BY nombre";

        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        DocenteDTO doc = null;

        while (rs.next()) {
            doc = new DocenteDTO();

           doc.setIdentificacion(rs.getInt("identificacion"));
            doc.setTipodocumentoid(rs.getString("tipodocumentoid"));
            doc.setCodigo(rs.getInt("codigo"));
            doc.setNombre(rs.getString("nombre"));
            doc.setCorreo(rs.getString("correo"));
            doc.setFechanacimiento(rs.getString("fechanacimiento"));      
            doc.setGenero(rs.getString("genero"));
            doc.setEdad(rs.getInt("edad"));
            doc.setEstadocivil(rs.getString("estadocivil"));
            doc.setDireccion(rs.getString("direccion"));
            doc.setTelefono(rs.getString("telefono"));

            listaDoc.add(doc);
        }

        return listaDoc;

    }
    public DocenteDTO consultarDocentePorIdCodigo(int id, int codigo) throws SQLException {

        String sql = "SELECT * FROM docente WHERE identificacion = ? OR codigo = ? ";

        PreparedStatement ps = con.prepareStatement(sql);               

        ps.setInt(1, id);
        ps.setInt(2, codigo);

        ResultSet rs = ps.executeQuery();                             

        DocenteDTO doc = null;

        if (rs.next()) {
            doc = new DocenteDTO();

            doc.setIdentificacion(rs.getInt("identificacion"));
            doc.setTipodocumentoid(rs.getString("tipodocumentoid"));
            doc.setCodigo(rs.getInt("codigo"));
            doc.setNombre(rs.getString("nombre"));
            doc.setCorreo(rs.getString("correo"));
            doc.setFechanacimiento(rs.getString("fechanacimiento"));      
            doc.setGenero(rs.getString("genero"));
            doc.setEdad(rs.getInt("edad"));
            doc.setEstadocivil(rs.getString("estadocivil"));
            doc.setDireccion(rs.getString("direccion"));
            doc.setTelefono(rs.getString("telefono"));                           
        }
        
        return doc;

    }
    public boolean modificarDocente(int identificacion, String correo, String fechanacimiento, String genero, String estadocivil, String direccion, String telefono ) throws SQLException{
          
            String sql = "UPDATE docente SET correo = ? , fechanacimiento = ?, genero = ?, estadocivil = ? , direccion =?, telefono = ?  "
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
