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

        String sql = "INSERT INTO docente (identificacion_doc, tipodocumentoid_doc, codigo_doc, nombre_doc, correo_doc, "
                + "fechanacimiento_doc, genero_doc, edad_doc, estadocivil_doc, direccion_doc, telefono_doc)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, doc.getIdentificacion_doc());
        ps.setString(2, doc.getTipodocumentoid_doc());
        ps.setInt(3, doc.getCodigo_doc());
        ps.setString(4, doc.getNombre_doc());
        ps.setString(5, doc.getCorreo_doc());
        ps.setString(6, doc.getFechanacimiento_doc());
        ps.setString(7, doc.getGenero_doc());
        ps.setInt(8, doc.getEdad_doc());
        ps.setString(9, doc.getEstadocivil_doc());
        ps.setString(10, doc.getDireccion_doc());
        ps.setString(11, doc.getTelefono_doc());
        

        int resultado = ps.executeUpdate();               

        return resultado == 1;

    }

    public DocenteDTO consultarDocentePorId(int id) throws SQLException {

        String sql = "SELECT * FROM docente WHERE identificacion_doc = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        DocenteDTO doc = null;

        if (rs.next()) {
            doc = new DocenteDTO();
            doc.setIdentificacion_doc(rs.getInt("identificacion_doc"));
            doc.setTipodocumentoid_doc(rs.getString("tipodocumentoid_doc"));
            doc.setCodigo_doc(rs.getInt("codigo_doc"));
            doc.setNombre_doc(rs.getString("nombre_doc"));
            doc.setCorreo_doc(rs.getString("correo_doc"));
            doc.setFechanacimiento_doc(rs.getString("fechanacimiento_doc"));      
            doc.setGenero_doc(rs.getString("genero_doc"));
            doc.setEdad_doc(rs.getInt("edad_doc"));
            doc.setEstadocivil_doc(rs.getString("estadocivil_doc"));
            doc.setDireccion_doc(rs.getString("direccion_doc"));
            doc.setTelefono_doc(rs.getString("telefono_doc"));                        
            
        }
        return doc;
    }

    public List<DocenteDTO> consultarDocentes() throws SQLException {

        List<DocenteDTO> listaDoc = new ArrayList<DocenteDTO>();

        String sql = "SELECT * FROM docente ORDER BY nombre_doc";

        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        DocenteDTO doc = null;

        while (rs.next()) {
            doc = new DocenteDTO();

           doc.setIdentificacion_doc(rs.getInt("identificacion_doc"));
            doc.setTipodocumentoid_doc(rs.getString("tipodocumentoid_doc"));
            doc.setCodigo_doc(rs.getInt("codigo_doc"));
            doc.setNombre_doc(rs.getString("nombre_doc"));
            doc.setCorreo_doc(rs.getString("correo_doc"));
            doc.setFechanacimiento_doc(rs.getString("fechanacimiento_doc"));      
            doc.setGenero_doc(rs.getString("genero_doc"));
            doc.setEdad_doc(rs.getInt("edad_doc"));
            doc.setEstadocivil_doc(rs.getString("estadocivil_doc"));
            doc.setDireccion_doc(rs.getString("direccion_doc"));
            doc.setTelefono_doc(rs.getString("telefono_doc"));

            listaDoc.add(doc);
        }

        return listaDoc;

    }
    public DocenteDTO consultarDocentePorIdCodigo(int id, int codigo) throws SQLException {

        String sql = "SELECT * FROM docente WHERE identificacion_doc = ? OR codigo_doc = ? ";

        PreparedStatement ps = con.prepareStatement(sql);               

        ps.setInt(1, id);
        ps.setInt(2, codigo);

        ResultSet rs = ps.executeQuery();                             

        DocenteDTO doc = null;

        if (rs.next()) {
            doc = new DocenteDTO();

            doc.setIdentificacion_doc(rs.getInt("identificacion_doc"));
            doc.setTipodocumentoid_doc(rs.getString("tipodocumentoid_doc"));
            doc.setCodigo_doc(rs.getInt("codigo_doc"));
            doc.setNombre_doc(rs.getString("nombre_doc"));
            doc.setCorreo_doc(rs.getString("correo_doc"));
            doc.setFechanacimiento_doc(rs.getString("fechanacimiento_doc"));      
            doc.setGenero_doc(rs.getString("genero_doc"));
            doc.setEdad_doc(rs.getInt("edad_doc"));
            doc.setEstadocivil_doc(rs.getString("estadocivil_doc"));
            doc.setDireccion_doc(rs.getString("direccion_doc"));
            doc.setTelefono_doc(rs.getString("telefono_doc"));                           
        }
        
        return doc;

    }
    public boolean modificarDocente(int identificacion_doc, String correo_doc, String fechanacimiento_doc, String genero_doc, String estadocivil_doc, String direccion_doc, String telefono_doc ) throws SQLException{
          
            String sql = "UPDATE docente SET correo_doc = ? , fechanacimiento_doc = ?, genero_doc = ?, estadocivil_doc = ? , direccion_doc =?, telefono_doc = ?  "
                + "WHERE  identificacion_doc = ?";

        PreparedStatement ps = con.prepareStatement(sql);
                
        ps.setString(1, correo_doc);
        ps.setString(2, fechanacimiento_doc);        
        ps.setString(3, genero_doc);
        ps.setString(4, estadocivil_doc);  
        ps.setString(5, direccion_doc);
        ps.setString(6, telefono_doc);
        ps.setInt(7, identificacion_doc);
        
        int rta = ps.executeUpdate();

        return rta > 0;
          
      }

}
