/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.CitaDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;

/**
 *
 * @author Gladys M
 */
public class CitaDAO {

    private Connection con;

    public CitaDAO(Connection con) {
        this.con = con;
    }

    /**
     * Metodo que registra una cita en la Base de Datos
     *
     * @param cita
     * @return boolean con valor verdadero si hubo registro exitoso, falso si
     * existe error dentro del procedimiento.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public boolean registrarCita(CitaDTO cita) throws SQLException {

        String sql = "INSERT INTO cita (servicio_cita, num_recibo_cita, fecha_cita, hora_cita, id_usuario, id_medico, estado, nombre_usuario, nombre_medico, tipousuario_cita)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, cita.getServicio_cita());
        ps.setString(2, cita.getNum_recibo_cita());
        ps.setDate(3, Date.valueOf(cita.getFecha_cita()));
        ps.setTime(4, Time.valueOf(cita.getHora_cita()));
        ps.setString(5, cita.getId_usuario());
        ps.setString(6, cita.getId_medico());
        ps.setString(7, cita.getEstado());
        ps.setString(8, cita.getNombre_usuario());
        ps.setString(9, cita.getNombre_medico());
        ps.setString(10, cita.getTipousuario_cita());

        int resultado = ps.executeUpdate();

        if (resultado == 1) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * Metodo que se encarga de consultar en la base de datos las citas segun el
     * id del estudiante
     *
     * @param id_est
     * @return Listado de tipo CitaDTO con los datos de la cita que pertenece al
     * id del estudiante
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public ArrayList<CitaDTO> consultarCitasEst(int id_est) throws SQLException {

        ArrayList<CitaDTO> citas = new ArrayList<CitaDTO>();

        String sql = "SELECT * FROM cita WHERE id_est = ? ";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id_est);

        ResultSet rs = ps.executeQuery();

        CitaDTO cita = null;

        if (rs.next()) {

            cita = new CitaDTO();

            cita.setId_cita(rs.getInt("id_cita"));
            cita.setServicio_cita(rs.getString("servicio_cita"));
            cita.setNum_recibo_cita(rs.getString("num_recibo_cita"));
            cita.setFecha_cita(rs.getString("fecha_cita"));
            cita.setHora_cita(rs.getString("hora_cita"));
            cita.setId_usuario(rs.getString("id_usuario"));
            cita.setId_medico(rs.getString("id_medico"));
            cita.setEstado(rs.getString("estado"));
            cita.setNombre_usuario(rs.getString("nombre_usuario"));
            cita.setNombre_medico(rs.getString("nombre_medico"));
            cita.setTipousuario_cita(rs.getString("tipousuario_cita"));

            citas.add(cita);
        }

        rs.close();
        rs = null;

        ps.close();
        ps = null;

        return citas;

    }

    public ArrayList<CitaDTO> consultarCitasProfesional(int id_prof, String fecha) throws SQLException {

        ArrayList<CitaDTO> citas = new ArrayList<CitaDTO>();

        String sql = "SELECT * FROM cita WHERE id_medico = ? AND fecha_cita = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id_prof);
        ps.setDate(2, Date.valueOf(fecha));

        ResultSet rs = ps.executeQuery();

        CitaDTO cita = null;

        if (rs.next()) {

            cita = new CitaDTO();

            cita.setId_cita(rs.getInt("id_cita"));
            cita.setServicio_cita(rs.getString("servicio_cita"));
            cita.setNum_recibo_cita(rs.getString("num_recibo_cita"));
            cita.setFecha_cita(rs.getString("fecha_cita"));
            cita.setHora_cita(rs.getString("hora_cita"));
            cita.setId_usuario(rs.getString("id_usuario"));
            cita.setId_medico(rs.getString("id_medico"));
            cita.setEstado(rs.getString("estado"));
            cita.setNombre_usuario(rs.getString("nombre_usuario"));
            cita.setNombre_medico(rs.getString("nombre_medico"));
            cita.setTipousuario_cita(rs.getString("tipousuario_cita"));

            citas.add(cita);
        }

        rs.close();
        rs = null;

        ps.close();
        ps = null;

        return citas;

    }

    public ArrayList<CitaDTO> consultarCitasUsuario(String id_usuario) throws SQLException {

        ArrayList<CitaDTO> citas = new ArrayList<CitaDTO>();

        String sql = "SELECT * FROM cita WHERE id_usuario = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, id_usuario);

        ResultSet rs = ps.executeQuery();

        CitaDTO cita = null;

        while (rs.next()) {

            cita = new CitaDTO();

            cita.setId_cita(rs.getInt("id_cita"));
            cita.setServicio_cita(rs.getString("servicio_cita"));
            cita.setNum_recibo_cita(rs.getString("num_recibo_cita"));
            cita.setFecha_cita(rs.getString("fecha_cita"));
            cita.setHora_cita(rs.getString("hora_cita"));
            cita.setId_usuario(rs.getString("id_usuario"));
            cita.setId_medico(rs.getString("id_medico"));
            cita.setEstado(rs.getString("estado"));
            cita.setNombre_usuario(rs.getString("nombre_usuario"));
            cita.setNombre_medico(rs.getString("nombre_medico"));
            cita.setTipousuario_cita(rs.getString("tipousuario_cita"));

            citas.add(cita);
        }

        return citas;

    }

    public ArrayList<CitaDTO> consultarCitasMedicoDia(String id_medico, String fecha_cita) throws SQLException {

        ArrayList<CitaDTO> citas = new ArrayList<CitaDTO>();

        String sql = "SELECT * FROM cita WHERE id_medico = ? AND fecha_cita = ? ORDER BY hora_cita";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, id_medico);
        ps.setDate(2, Date.valueOf(fecha_cita));

        ResultSet rs = ps.executeQuery();
        System.out.println("ps " + ps.toString());
        CitaDTO cita = null;

        while (rs.next()) {

            cita = new CitaDTO();

            cita.setId_cita(rs.getInt("id_cita"));
            cita.setServicio_cita(rs.getString("servicio_cita"));
            cita.setNum_recibo_cita(rs.getString("num_recibo_cita"));
            cita.setFecha_cita(rs.getString("fecha_cita"));
            cita.setHora_cita(rs.getString("hora_cita"));
            cita.setId_usuario(rs.getString("id_usuario"));
            cita.setId_medico(rs.getString("id_medico"));
            cita.setEstado(rs.getString("estado"));
            cita.setNombre_usuario(rs.getString("nombre_usuario"));
            cita.setNombre_medico(rs.getString("nombre_medico"));
            cita.setTipousuario_cita(rs.getString("tipousuario_cita"));

            citas.add(cita);
        }

        return citas;

    }

    public boolean modificarCita(int id_cita, String fecha, Time hora_cita, String id_medico) throws SQLException {

        String sql = "UPDATE cita SET fecha_cita = ? , hora_cita = ?, id_medico = ? "
                + "WHERE  id_cita = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setDate(1, Date.valueOf(fecha));
        ps.setTime(2, hora_cita);
        ps.setString(3, id_medico);
        ps.setInt(4, id_cita);

        int rta = ps.executeUpdate();

        if (rta > 0) {
            return true;
        } else {
            return false;
        }

    }

    public CitaDTO consultarCitasId(int id_cita) throws SQLException {

        String sql = "SELECT * FROM cita WHERE id_cita = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id_cita);

        ResultSet rs = ps.executeQuery();

        CitaDTO cita = null;

        while (rs.next()) {

            cita = new CitaDTO();

            cita.setId_cita(rs.getInt("id_cita"));
            cita.setServicio_cita(rs.getString("servicio_cita"));
            cita.setNum_recibo_cita(rs.getString("num_recibo_cita"));
            cita.setFecha_cita(rs.getString("fecha_cita"));
            cita.setHora_cita(rs.getString("hora_cita"));
            cita.setId_usuario(rs.getString("id_usuario"));
            cita.setId_medico(rs.getString("id_medico"));
            cita.setEstado(rs.getString("estado"));
            cita.setNombre_usuario(rs.getString("nombre_usuario"));
            cita.setNombre_medico(rs.getString("nombre_medico"));
            cita.setTipousuario_cita(rs.getString("tipousuario_cita"));
            System.out.println("nombre " + cita.getNombre_usuario());
        }

        return cita;
    }

    public ArrayList<CitaDTO> consultarCitasPorRango(String id_medico, String fecha, String fechaF) throws SQLException {

        ArrayList<CitaDTO> lis = new ArrayList<>();

        String sql = "select * from cita where id_medico = ? and fecha_cita between ? and ? order by hora_cita";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, id_medico);
        ps.setDate(2, Date.valueOf(fecha));
        ps.setDate(3, Date.valueOf(fechaF));

        ResultSet rs = ps.executeQuery();

        CitaDTO cita = null;

        while (rs.next()) {
            cita = new CitaDTO();
            cita.setId_cita(rs.getInt("id_cita"));
            cita.setServicio_cita(rs.getString("servicio_cita"));
            cita.setNum_recibo_cita(rs.getString("num_recibo_cita"));
            cita.setFecha_cita(rs.getString("fecha_cita"));
            cita.setHora_cita(rs.getString("hora_cita"));
            cita.setId_usuario(rs.getString("id_usuario"));
            cita.setId_medico(rs.getString("id_medico"));
            cita.setEstado(rs.getString("estado"));
            cita.setNombre_usuario(rs.getString("nombre_usuario"));
            cita.setNombre_medico(rs.getString("nombre_medico"));
            cita.setTipousuario_cita(rs.getString("tipousuario_cita"));

            lis.add(cita);
        }

        return lis;
    }
    
    public boolean actualizarEstadoAtendida(int id_cita) throws SQLException {

        String sql = "UPDATE cita SET estado = 'atendido' WHERE  id_cita = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id_cita);

        int rta = ps.executeUpdate();

        if (rta > 0) {
            return true;
        } else {
            return false;
        }

    }
    public boolean actualizarEstadoNoAsistida(int id_cita) throws SQLException {

        String sql = "UPDATE cita SET estado = 'no asistida' WHERE  id_cita = ?";

        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setInt(1, id_cita);

        int rta = ps.executeUpdate();

        if (rta > 0) {
            return true;
        } else {
            return false;
        }

    }

    public int cantidadCitas(String fechaI, String fechaF) throws SQLException{
        int cant = 0;
        String sql = "select count(*) from cita where fecha_cita between ? and ?";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDate(1, Date.valueOf(fechaI));
        ps.setDate(2, Date.valueOf(fechaF));
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
            cant = rs.getInt(1);
        }
        
        return cant;
    }
    
    public int cantidadCitasAsistidas(String fechaI, String fechaF)throws SQLException {
        int cant = 0;
        String sql = "select count(*) from cita where estado = 'atendido' and fecha_cita between ? and ?";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDate(1, Date.valueOf(fechaI));
        ps.setDate(2, Date.valueOf(fechaF));
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
            cant = rs.getInt(1);
        }
        
        return cant;
    }
    
    public int cantidadCitasNoAsistidas(String fechaI, String fechaF)throws SQLException {
        int cant = 0;
        String sql = "select count(*) from cita where estado = 'inasistido' and fecha_cita between ? and ?";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDate(1, Date.valueOf(fechaI));
        ps.setDate(2, Date.valueOf(fechaF));
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
            cant = rs.getInt(1);
        }
        
        return cant;
    }
    
    public int cantidadCitasEstudiante(String id_usuario, String fechaI, String fechaF) throws SQLException {
        int cant = 0;
        String sql = "select count(*) from cita where id_usuario = ? and fecha_cita between ? and ?";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, id_usuario);
        ps.setDate(2, Date.valueOf(fechaI));
        ps.setDate(3, Date.valueOf(fechaF));
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
            cant = rs.getInt(1);
        }
        return cant;
    }
    
    public int cantidadCitasPendientes(String fechaI, String fechaF) throws SQLException {
        int cant = 0;
        String sql = "select count(*) from cita where estado = 'pendiente' and fecha_cita between ? and ?";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDate(1, Date.valueOf(fechaI));
        ps.setDate(2, Date.valueOf(fechaF));
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
            cant = rs.getInt(1);
        }
        
        return cant;
    }
    
    public int cantidadCitasUsuario(String id_usuario) throws SQLException {
        int cant = 0;
        String sql = "select count(*) from cita where id_usuario = ? ";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, id_usuario);
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
            cant = rs.getInt(1);
        }
        return cant;
    }
    
    public int cantidadCitasServicio(String servicio, String fechaI, String fechaF) throws SQLException {
        int cant = 0;
        String sql = "select count(*) from cita where servicio_cita = ? and fecha_cita between ? and ?";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, servicio);
        ps.setDate(2, Date.valueOf(fechaI));
        ps.setDate(3, Date.valueOf(fechaF));
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
            cant = rs.getInt(1);
        }
        return cant;
    }
}
