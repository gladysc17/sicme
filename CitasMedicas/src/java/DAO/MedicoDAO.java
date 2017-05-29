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

        String sql = "INSERT INTO medico (identificacion, servicio, contrasena)"
                + " VALUES (?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, med.getIdentificacion());        
        ps.setString(2, med.getContrasena());
        ps.setString(3, med.getServicio());

        int resultado = ps.executeUpdate();

        return resultado == 1;

    }

    public MedicoDTO consultarMedicoPorId(String id) throws SQLException {

        String sql = "SELECT * FROM medico WHERE identificacion = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, id);

        ResultSet rs = ps.executeQuery();

        MedicoDTO med = null;

        if (rs.next()) {
            med = new MedicoDTO();
            med.setIdentificacion(rs.getString("identificacion")); 
            med.setServicio(rs.getString("servicio"));
            med.setContrasena(rs.getString("contrasena"));
            
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

           med.setIdentificacion(rs.getString("identificacion")); 
            med.setServicio(rs.getString("servicio"));
            med.setContrasena(rs.getString("contrasena"));

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

            med.setIdentificacion(rs.getString("identificacion")); 
            med.setServicio(rs.getString("servicio"));
            med.setContrasena(rs.getString("contrasena"));
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

           med.setIdentificacion(rs.getString("identificacion")); 
            med.setServicio(rs.getString("servicio"));
            med.setContrasena(rs.getString("contrasena"));

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
    
    public ArrayList<String[]>listadoMedico() throws SQLException{
        
        String sql = "select u.nombre, u.identificacion, u.codigo, m.servicio from usuario u inner join medico m ON u.identificacion = m.identificacion";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<String[]> lista = new ArrayList<>();
        
        
        while (rs.next()){
            String [] lis = new String[4];
            lis[0]=rs.getString("nombre");
            lis[1]=rs.getString("identificacion");
            lis[2]=rs.getString("codigo");
            lis[3]=rs.getString("servicio");
            lista.add(lis);
        }
        return lista;
    }
}
