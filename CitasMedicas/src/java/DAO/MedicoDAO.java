/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.MedicoDTO;
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
public class MedicoDAO {

    private Connection con;

    public MedicoDAO(Connection con) {
        this.con = con;
    }
      
    public boolean registrarMedico(MedicoDTO med) throws SQLException {

        String sql = "INSERT INTO medico (identificacion, tipodocumentoid, codigo, nombre, correo, "
                + "fechanacimiento, genero, edad, estadocivil, direccion, telefono, contrasena, servicio)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, med.getIdentificacion());        
        ps.setString(2, med.getTipodocumentoid());
        ps.setInt(3, med.getCodigo());
        ps.setString(4, med.getNombre());
        ps.setString(5, med.getCorreo());
        ps.setString(6, med.getFechanacimiento());
        ps.setString(7, med.getGenero());
        ps.setInt(8, med.getEdad());
        ps.setString(9, med.getEstadocivil());
        ps.setString(10, med.getDireccion());
        ps.setString(11, med.getTelefono());
        ps.setString(12, med.getContrasena() );
        ps.setString(13, med.getServicio());

        int resultado = ps.executeUpdate();

        return resultado == 1;

    }

    public MedicoDTO consultarMedicoPorId(int id) throws SQLException {

        String sql = "SELECT * FROM medico WHERE identificacion = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        MedicoDTO med = null;

        if (rs.next()) {
            med = new MedicoDTO();
            med.setIdentificacion(rs.getInt("identificacion"));
            med.setTipodocumentoid(rs.getString("tipodocumentoid"));
            med.setCodigo(rs.getInt("codigo"));
            med.setNombre(rs.getString("nombre"));
            med.setCorreo(rs.getString("correo"));
            med.setFechanacimiento(rs.getString("fechanacimiento"));      
            med.setGenero(rs.getString("genero"));
            med.setEdad(rs.getInt("edad"));
            med.setEstadocivil(rs.getString("estadocivil"));
            med.setDireccion(rs.getString("direccion"));
            med.setTelefono(rs.getString("telefono")); 
            med.setContrasena(rs.getString("contrasena"));
            med.setServicio(rs.getString("servicio"));
        }
        return med;
    }

    public List<MedicoDTO> consultarMedico() throws SQLException {

        List<MedicoDTO> listaMed = new ArrayList<MedicoDTO>();

        String sql = "SELECT * FROM medico ORDER BY nombre";

        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        MedicoDTO med = null;

        while (rs.next()) {
            med = new MedicoDTO();

           med.setIdentificacion(rs.getInt("identificacion"));
            med.setTipodocumentoid(rs.getString("tipodocumentoid"));
            med.setCodigo(rs.getInt("codigo"));
            med.setNombre(rs.getString("nombre"));
            med.setCorreo(rs.getString("correo"));
            med.setFechanacimiento(rs.getString("fechanacimiento"));      
            med.setGenero(rs.getString("genero"));
            med.setEdad(rs.getInt("edad"));
            med.setEstadocivil(rs.getString("estadocivil"));
            med.setDireccion(rs.getString("direccion"));
            med.setTelefono(rs.getString("telefono")); 
            med.setContrasena(rs.getString("contrasena"));
            med.setServicio(rs.getString("servicio"));

            listaMed.add(med);
        }

        return listaMed;

    }

    public MedicoDTO consultarMedicoPorIdCodigo(int id, int codigo) throws SQLException {

        String sql = "SELECT * FROM medico WHERE identificacion = ? OR codigo = ? ";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);
        ps.setInt(2, codigo);

        ResultSet rs = ps.executeQuery();

        MedicoDTO med = null;

        if (rs.next()) {
            med = new MedicoDTO();

            med.setIdentificacion(rs.getInt("identificacion"));
            med.setTipodocumentoid(rs.getString("tipodocumentoid"));
            med.setCodigo(rs.getInt("codigo"));
            med.setNombre(rs.getString("nombre"));
            med.setCorreo(rs.getString("correo"));
            med.setFechanacimiento(rs.getString("fechanacimiento"));      
            med.setGenero(rs.getString("genero"));
            med.setEdad(rs.getInt("edad"));
            med.setEstadocivil(rs.getString("estadocivil"));
            med.setDireccion(rs.getString("direccion"));
            med.setTelefono(rs.getString("telefono")); 
            med.setContrasena(rs.getString("contrasena"));
            med.setServicio(rs.getString("servicio"));
        }

        return med;

    }

    public ArrayList<MedicoDTO> consultarMedicoPorServicio(String servicio) throws SQLException {

        ArrayList<MedicoDTO> medicos = new ArrayList<MedicoDTO>();

        String sql = "SELECT * FROM medico WHERE servicio = ?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, servicio);

        ResultSet rs = ps.executeQuery();

        MedicoDTO med = null;

        while (rs.next()) {

            med = new MedicoDTO();

            med.setIdentificacion(rs.getInt("identificacion"));
            med.setTipodocumentoid(rs.getString("tipodocumentoid"));
            med.setCodigo(rs.getInt("codigo"));
            med.setNombre(rs.getString("nombre"));
            med.setCorreo(rs.getString("correo"));
            med.setFechanacimiento(rs.getString("fechanacimiento"));      
            med.setGenero(rs.getString("genero"));
            med.setEdad(rs.getInt("edad"));
            med.setEstadocivil(rs.getString("estadocivil"));
            med.setDireccion(rs.getString("direccion"));
            med.setTelefono(rs.getString("telefono")); 
            med.setContrasena(rs.getString("contrasena"));
            med.setServicio(rs.getString("servicio"));

            medicos.add(med);
        }
        return medicos;
    }
    
    public boolean modificarMedico(int identificacion, String correo, String fechanacimiento, String genero, String estadocivil, String direccion, String telefono, String contrasena) throws SQLException{
          
            String sql = "UPDATE medico SET correo = ? , fechanacimiento = ?, genero = ?, estadocivil = ? , direccion =?, telefono = ?, contrasena = ?"
                + "WHERE  identificacion = ?";

        PreparedStatement ps = con.prepareStatement(sql);
                
        ps.setString(1, correo);
        ps.setString(2, fechanacimiento);        
        ps.setString(3, genero);
        ps.setString(4, estadocivil);  
        ps.setString(5, direccion);
        ps.setString(6, telefono);
        ps.setString(7, contrasena);
        ps.setInt(8, identificacion);
        
        int rta = ps.executeUpdate();

        return rta > 0;
          
      }
}
