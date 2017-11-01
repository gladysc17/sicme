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

    /**
     * metodo que permite registrar el servicio.
     * @param ser Objeto de tipo ServicioDTO con la informacion suministrada
     * @return Valor booleano que confirma el registro
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public boolean registrarServicio(ServicioDTO ser) throws SQLException {

        String sql = "INSERT INTO servicio(nombre, informacion) VALUES (?,?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, ser.getNombre());
        ps.setString(2, ser.getInformacion());

        int resultado = ps.executeUpdate();

        return resultado == 1;

    }

    /**
     * metodo que obtiene el servicio dado un identificador
     * @param id Identificador en la base de datos
     * @return Objeto ServicioDTO con la información registrada
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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
    
    /**
     * metodo que obtiene todos los servicios ordenados por el nombre
     * @return Listado de los servicios que hay registrados en la base de datos
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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
    
    /**
     * metodo que permite actualizar un servicio
     * @param id Identificador del servicio en la base de datos
     * @param serv Nombre del servicio 
     * @param info Informacion básica del servicio
     * @return Valor booleano que confirma la operación de actualización
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public boolean actualizarServicio(int id, String serv, String info) throws SQLException {
        
        String sql = "update servicio set nombre = ?, informacion = ? where id = ? ";
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setString(1, serv);
        ps.setString(2, info);
        ps.setInt(3, id);
        
        int rta = ps.executeUpdate();
        
        return rta>0;
    }
    
    /**
     * metodo que permite eliminar un servicio dado un identificador
     * @param id Identificador del servicio en la base de datos
     * @return Valor booleano que confirma la operación de eliminación
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public boolean eliminarServicio(int id) throws SQLException {
        
        String sql = "delete from servicio where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setInt(1, id);
        
        int rta = ps.executeUpdate();
        
        if(rta>0)
            return true;
        return false;
    }
    
    /**
     * metodo que obtiene la cantidad de citas asistidas atendidas de acuedo al servicio.
     * @param fechaI Fecha inicial
     * @param fechaF Fecha final
     * @param servicio_cita Identificador del servicio
     * @return Valor entero con la cantidad de citas asistidas por servicio.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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

    /**
     * metodo que obtiene la cantidad de citas inasistidas de acuerdo al servicio.
     * @param fechaI Fecha inicial
     * @param fechaF Fecha final
     * @param servicio_cita Identificador del servicio
     * @return Valor entero con la cantidad de citas inasistidas por servicio
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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

    /**
     * metodo que obtiene la cantidad de citas pendientes de acuerdo al servicio
     * @param fechaI fecha inicial
     * @param fechaF fecha final
     * @param servicio_cita Identificador del servicio
     * @return Valor entero con la cantidad de citas pendientes por servicio
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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

    /**
     * metodo que obtiene un objeto de ServicioDTO con la información registrada
     * @param nombre Nombre del servicio que se encuentre en la base de datos
     * @return Objeto de tipo ServicioDTO con la información que se encuentra en la base de datos
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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
