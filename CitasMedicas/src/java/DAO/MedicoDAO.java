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

        String sql = "INSERT INTO medico (identificacion_med, tipodocumentoid_med, codigo_med, nombre_med, correo_med, "
                + "fechanacimiento_med, genero_med, edad_med, estadocivil_med, direccion_med, telefono_med, contrasena_med, servicio_med)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, med.getIdentificacion_med());        
        ps.setString(2, med.getTipodocumentoid_med());
        ps.setInt(3, med.getCodigo_med());
        ps.setString(4, med.getNombre_med());
        ps.setString(5, med.getCorreo_med());
        ps.setString(6, med.getFechanacimiento_med());
        ps.setString(7, med.getGenero_med());
        ps.setInt(8, med.getEdad_med());
        ps.setString(9, med.getEstadocivil_med());
        ps.setString(10, med.getDireccion_med());
        ps.setString(11, med.getTelefono_med());
        ps.setString(12, med.getContrasena_med() );
        ps.setString(13, med.getServicio_med());

        int resultado = ps.executeUpdate();

        return resultado == 1;

    }

    public MedicoDTO consultarMedicoPorId(int id) throws SQLException {

        String sql = "SELECT * FROM medico WHERE identificacion_med = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        MedicoDTO med = null;

        if (rs.next()) {
            med = new MedicoDTO();
            med.setIdentificacion_med(rs.getInt("identificacion_med"));
            med.setTipodocumentoid_med(rs.getString("tipodocumentoid_med"));
            med.setCodigo_med(rs.getInt("codigo_med"));
            med.setNombre_med(rs.getString("nombre_med"));
            med.setCorreo_med(rs.getString("correo_med"));
            med.setFechanacimiento_med(rs.getString("fechanacimiento_med"));      
            med.setGenero_med(rs.getString("genero_med"));
            med.setEdad_med(rs.getInt("edad_med"));
            med.setEstadocivil_med(rs.getString("estadocivil_med"));
            med.setDireccion_med(rs.getString("direccion_med"));
            med.setTelefono_med(rs.getString("telefono_med")); 
            med.setContrasena_med(rs.getString("contrasena_med"));
            med.setServicio_med(rs.getString("servicio_med"));
        }
        return med;
    }

    public List<MedicoDTO> consultarMedico() throws SQLException {

        List<MedicoDTO> listaMed = new ArrayList<MedicoDTO>();

        String sql = "SELECT * FROM medico ORDER BY nombre_med";

        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        MedicoDTO med = null;

        while (rs.next()) {
            med = new MedicoDTO();

           med.setIdentificacion_med(rs.getInt("identificacion_med"));
            med.setTipodocumentoid_med(rs.getString("tipodocumentoid_med"));
            med.setCodigo_med(rs.getInt("codigo_med"));
            med.setNombre_med(rs.getString("nombre_med"));
            med.setCorreo_med(rs.getString("correo_med"));
            med.setFechanacimiento_med(rs.getString("fechanacimiento_med"));      
            med.setGenero_med(rs.getString("genero_med"));
            med.setEdad_med(rs.getInt("edad_med"));
            med.setEstadocivil_med(rs.getString("estadocivil_med"));
            med.setDireccion_med(rs.getString("direccion_med"));
            med.setTelefono_med(rs.getString("telefono_med")); 
            med.setContrasena_med(rs.getString("contrasena_med"));
            med.setServicio_med(rs.getString("servicio_med"));

            listaMed.add(med);
        }

        return listaMed;

    }

    public MedicoDTO consultarMedicoPorIdCodigo(int id, int codigo) throws SQLException {

        String sql = "SELECT * FROM medico WHERE identificacion_med = ? OR codigo_med = ? ";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);
        ps.setInt(2, codigo);

        ResultSet rs = ps.executeQuery();

        MedicoDTO med = null;

        if (rs.next()) {
            med = new MedicoDTO();

            med.setIdentificacion_med(rs.getInt("identificacion_med"));
            med.setTipodocumentoid_med(rs.getString("tipodocumentoid_med"));
            med.setCodigo_med(rs.getInt("codigo_med"));
            med.setNombre_med(rs.getString("nombre_med"));
            med.setCorreo_med(rs.getString("correo_med"));
            med.setFechanacimiento_med(rs.getString("fechanacimiento_med"));      
            med.setGenero_med(rs.getString("genero_med"));
            med.setEdad_med(rs.getInt("edad_med"));
            med.setEstadocivil_med(rs.getString("estadocivil_med"));
            med.setDireccion_med(rs.getString("direccion_med"));
            med.setTelefono_med(rs.getString("telefono_med")); 
            med.setContrasena_med(rs.getString("contrasena_med"));
            med.setServicio_med(rs.getString("servicio_med"));
        }

        return med;

    }

    public ArrayList<MedicoDTO> consultarMedicoPorServicio(String servicio_med) throws SQLException {

        ArrayList<MedicoDTO> medicos = new ArrayList<MedicoDTO>();

        String sql = "SELECT * FROM medico WHERE servicio_med = ?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, servicio_med);

        ResultSet rs = ps.executeQuery();

        MedicoDTO med = null;

        while (rs.next()) {

            med = new MedicoDTO();

            med.setIdentificacion_med(rs.getInt("identificacion_med"));
            med.setTipodocumentoid_med(rs.getString("tipodocumentoid_med"));
            med.setCodigo_med(rs.getInt("codigo_med"));
            med.setNombre_med(rs.getString("nombre_med"));
            med.setCorreo_med(rs.getString("correo_med"));
            med.setFechanacimiento_med(rs.getString("fechanacimiento_med"));      
            med.setGenero_med(rs.getString("genero_med"));
            med.setEdad_med(rs.getInt("edad_med"));
            med.setEstadocivil_med(rs.getString("estadocivil_med"));
            med.setDireccion_med(rs.getString("direccion_med"));
            med.setTelefono_med(rs.getString("telefono_med")); 
            med.setContrasena_med(rs.getString("contrasena_med"));
            med.setServicio_med(rs.getString("servicio_med"));

            medicos.add(med);
        }
        return medicos;
    }
    
    public boolean modificarMedico(int identificacion_med, String correo_med, String fechanacimiento_med, String genero_med, String estadocivil_med, String direccion_med, String telefono_med, String contrasena_med) throws SQLException{
          
            String sql = "UPDATE medico SET correo_med = ? , fechanacimiento_med = ?, genero_med = ?, estadocivil_med = ? , direccion_med =?, telefono_med = ?, contrasena_med = ?"
                + "WHERE  identificacion_med = ?";

        PreparedStatement ps = con.prepareStatement(sql);
                
        ps.setString(1, correo_med);
        ps.setString(2, fechanacimiento_med);        
        ps.setString(3, genero_med);
        ps.setString(4, estadocivil_med);  
        ps.setString(5, direccion_med);
        ps.setString(6, telefono_med);
        ps.setString(7, contrasena_med);
        ps.setInt(8, identificacion_med);
        
        int rta = ps.executeUpdate();

        return rta > 0;
          
      }
}
