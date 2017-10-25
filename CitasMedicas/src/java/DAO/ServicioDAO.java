/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Programa_academicoDTO;
import DTO.ServicioDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class ServicioDAO {

    private Connection con;

    public ServicioDAO(Connection con) {
        this.con = con;
    }

    public boolean registrarServicio(ServicioDTO ser) throws SQLException {

        String sql = "INSERT INTO servicio(nombre, informacion) VALUES (?,?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, ser.getNombre());
        ps.setString(2, ser.getInformacion());

        int resultado = ps.executeUpdate();

        return resultado == 1;

    }

    public ServicioDTO consultarServicio(int id) throws SQLException {

        String sql = "SELECT * FROM servicio WHERE id = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        ServicioDTO ser = null;
        
        if (rs.next()) {
            
            ser = new ServicioDTO();
            
            ser.setId(rs.getInt("id"));
            ser.setNombre(rs.getString("nombre"));
            ser.setInformacion(rs.getString("informacion"));
            
        }
        return ser;

    }
    
    public List<ServicioDTO> consultarServicios() throws SQLException {

        List<ServicioDTO> listaServicios = new ArrayList<ServicioDTO>();

        String sql = "SELECT * FROM servicio ORDER BY nombre";

        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        ServicioDTO ser = null;

        while (rs.next()) {            
            
            ser = new ServicioDTO();
            
            ser.setId(rs.getInt("id"));
            ser.setNombre(rs.getString("nombre"));
            ser.setInformacion(rs.getString("informacion"));

            listaServicios.add(ser);
        }

        return listaServicios;

    }
    
    public boolean actualizarServicio(int id, String serv, String info) throws SQLException {
        
        String sql = "update servicio set nombre = ?, informacion = ? where id = ? ";
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setString(1, serv);
        ps.setString(2, info);
        ps.setInt(3, id);
        
        int rta = ps.executeUpdate();
        
        return rta>0;
    }
    
    public boolean eliminarServicio(int id) throws SQLException {
        
        String sql = "delete from servicio where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setInt(1, id);
        
        int rta = ps.executeUpdate();
        
        if(rta>0)
            return true;
        return false;
    }
    
    public int cantidadCitasAsistidas(String fechaI, String fechaF, String servicio_cita) throws SQLException {
        int cant = 0;
        String sql = "select count(*) from cita where estado = 'atendido' and fecha_cita between ? and ? and servicio_cita = ? ";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDate(1, Date.valueOf(fechaI));
        ps.setDate(2, Date.valueOf(fechaF));
        ps.setString(3, servicio_cita);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            cant = rs.getInt(1);
        }

        return cant;
    }

    public int cantidadCitasNoAsistidas(String fechaI, String fechaF, String servicio_cita) throws SQLException {
        int cant = 0;
        String sql = "select count(*) from cita where estado = 'inasistido' and fecha_cita between ? and ? and servicio_cita = ? ";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDate(1, Date.valueOf(fechaI));
        ps.setDate(2, Date.valueOf(fechaF));
        ps.setString(3, servicio_cita);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            cant = rs.getInt(1);
        }
        
        return cant;

    }

    public int cantidadCitasPendientes(String fechaI, String fechaF, String servicio_cita) throws SQLException {
        int cant = 0;
        String sql = "select count(*) from cita where estado = 'pendiente' and fecha_cita between ? and ? and servicio_cita = ? ";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDate(1, Date.valueOf(fechaI));
        ps.setDate(2, Date.valueOf(fechaF));
        ps.setString(3, servicio_cita);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            cant = rs.getInt(1);
        }

        return cant;
    }

    public ServicioDTO consultarServicio(String nombre) throws SQLException {
        String sql = "select * from servicio where nombre = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setString(1, nombre);
        ResultSet rs = ps.executeQuery();

        ServicioDTO ser = null;
        
        if (rs.next()) {
            
            ser = new ServicioDTO();
            
            ser.setId(rs.getInt("id"));
            ser.setNombre(rs.getString("nombre"));
            ser.setInformacion(rs.getString("informacion"));
            
        }
        return ser;
    }
}
