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
     * @param cita De tipo CitaDTO que contiene la información de lo digitado en el formulario.
     * @return boolean con valor verdadero si hubo registro exitoso, falso si
     * existe error dentro del procedimiento.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public boolean registrarCita(CitaDTO cita) throws SQLException {

        String sql = "INSERT INTO cita (servicio_cita, num_recibo_cita, fecha_cita, hora_cita, id_usuario, id_medico, estado, nombre_usuario, nombre_medico, tipousuario_cita)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try{
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
        
        }catch(SQLException e){
            return false;
        }
        //return false;
    }

    /**
     * Metodo que se encarga de consultar en la base de datos las citas segun el
     * id del estudiante
     *
     * @param id_est Número entero que me permitirá buscar en la base de datos para obtener el listado 
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

    /**
     * Método que permitira obtener las citas que tiene un profesional de la salud de 
     * acuerdo a una fecha dada
     * @param id_prof Número entero que contendra la identificación del profesional de la salud
     * @param fecha Dato String que contendra la fecha con la que se podra comparar en la base de datos
     * @return Listado de las citas que tiene el profesional de la salud para dicha fecha solicitada.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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

    /**
     * Método que permitira obtener las citas que tiene un usuario de acuerdo a una fecha dada
     * @param id_usuario Dato principal que identifica al usuario del sistema.
     * @return Listado de Citas del usuario que ha realizado.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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

    /**
     * Mpetodo que me permite obtener las citas médicas que tiene un profesional de la salud
     * de acuerdo a la fecha, que para este caso es el día que este de servicio.
     * @param id_medico Dato que identifica al médico en la base de datos
     * @param fecha_cita Dato que usaremos para poder comparar en la base de datos
     * @return Listado de las cita que tiene el médico asignado para el dia actual ordenado por la hora.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar. 
     */
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

    /**
     * Método que permite modificar datos de la cita
     * @param id_cita Identificador de la cita
     * @param fecha Nueva fecha a la que se desea cambiar
     * @param hora_cita Nueva hora a la que se desea cambiar
     * @param id_medico Identificación del médico 
     * @return Valor booleano para conocer si los cambios fueron realizados en la base de datos
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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

    /**
     * Método que me permite consultar una cita por su identificador
     * @param id_cita Identificador de la cita en la base de datos
     * @return Objeto de tipo CitaDTO con toda la información que se encuentre en este registro
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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

    /**
     * Método que me permite consultar las citas que hay registradas dado un rango de fechas.
     * @param id_medico Identificación del médico
     * @param fecha Fecha inicial
     * @param fechaF Fecha Final
     * @return Listado de las citas médicas que se realizaron entre una fecha inicial y final.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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
    
    /**
     * Método que permite actualizar el estado de la cita a atendida
     * @param id_cita Identificador de la cita médica
     * @return Valor booleano que indica si se realizo el cambio del estado de la cita
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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
    
    /**
     * Método que me actualiza el estado de la cita a inasistida
     * @param id_cita Identificador de la cita
     * @return Valor booleano que indica si se realizo el cambio de estado de la cita
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public boolean actualizarEstadoNoAsistida(int id_cita) throws SQLException {

        String sql = "UPDATE cita SET estado = 'inasistido' WHERE  id_cita = ?";

        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setInt(1, id_cita);

        int rta = ps.executeUpdate();

        if (rta > 0) {
            return true;
        } else {
            return false;
        }

    }

    /**
     * Método que devuelve la cantidad de citas en un rango de fechas
     * @param fechaI Fecha inicial
     * @param fechaF Fecha Final
     * @return Valor entero con la cantidad de citas en dichas fechas. 
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar. 
     */
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
    
    /**
     * Método que devuelve la cantidad de citas con estado asistidas en un rango de fechas
     * @param fechaI Fecha inicial
     * @param fechaF Fecha final
     * @return Valor entero con la cantidad de citas en dichas fechas. 
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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
    
    /**
     * Método que devuelve la cantidad de citas con estado no asistidas en un rango de fechas
     * @param fechaI Fecha inicial
     * @param fechaF Fecha final
     * @return Valor entero con la cantidad de citas en dichas fechas. 
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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
    
    /**
     * Método que devuelve la cantidad de citas de un estudiante en un rango de fechas
     * @param id_usuario identificador del usuario en la base de datos
     * @param fechaI Fecha inicial
     * @param fechaF Fecha final
     * @return Valor entero con la cantidad de citas en dichas fechas
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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
    
    /**
     * Método que devuelve la cantidad de citas pendientes en un rango de fechas.
     * @param fechaI Fecha inicial
     * @param fechaF Fecha final
     * @return Valor entero con la cantidad de citas pendientes en dichas fechas.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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
    
    /**
     * Método que devuelve la cantidad de citas de un usuario
     * @param id_usuario identificador del usuario en la base de datos
     * @return Valor entero con la cantidad de citas del usuario
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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
    
    /**
     * Metodo que devuelve la cantidad de citas de dicho servicio en un rango de fechas
     * @param servicio Identificador del servicio en la base de datos
     * @param fechaI fecha inicial
     * @param fechaF fecha final
     * @return Valor entero que devuelve la cantidad de citas
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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
    
    /**
     * Método que devuelve la cantidad de citas realizadas por los estudiantes de un programa academico
     * con relación a un servicio prestado en un rango de fechas
     * @param servicio Identificador del servicio
     * @param fechaI Fecha inicial
     * @param fechaF Fecha final
     * @param programa Identificador del programa academico
     * @return Valor entero con la cantidad de citas solicitadas.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public int cantidadCitasPro_Ser(String servicio, String fechaI, String fechaF, int programa) throws SQLException {
        int cant = 0;
        String sql = "select count(*) from cita c, estudiante e where servicio_cita = ? "
                + "and fecha_cita between ? and ? "
                + "and c.id_usuario = e.identificacion_usuario "
                + "and e.programa_academico = ?";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, servicio);
        ps.setDate(2, Date.valueOf(fechaI));
        ps.setDate(3, Date.valueOf(fechaF));
        ps.setInt(4, programa);
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
            cant = rs.getInt(1);
        }
        return cant;
    }  
    
}
