/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.EstudianteDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Gladys M
 * @version 1.0
 */
public class EstudianteDAO {

    private Connection con;

    public EstudianteDAO(Connection con) {
        this.con = con;
    }

    /**
     * Metodo que registra los datos del estudiante en la Base de datos
     *
     * @param est, objeto tipo EstudianteDTO con identificación, programa
     * académio y estado
     * @return boolean, con valor verdadero si hubo registro exitoso, falso si
     * existe error dentro del procedimiento.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public boolean registrarEstudiante(EstudianteDTO est) throws SQLException {

        String sql = "INSERT INTO estudiante (identificacion_usuario, programa_academico, estado_estudiante )"
                + " VALUES (?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, est.getIdentificacion_usuario());
        ps.setInt(2, est.getPrograma_academico());
        ps.setString(3, est.getEstado_estudiante());

        int resultado = ps.executeUpdate();

        return resultado == 1;

    }

    /**
     * Metodo que consulta todos los datos de un estudiante
     *
     * @param id, identificacion del estudiante
     * @return EstudianteDTO, Objeto con los datos del estudiante, si no exite,
     * retorna null.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */

    public EstudianteDTO consultarEstudiante(String id) throws SQLException {

        String sql = "select * from estudiante where identificacion_usuario = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, id);

        ResultSet rs = ps.executeQuery();

        EstudianteDTO est = null;

        if (rs.next()) {

            est = new EstudianteDTO();

            est.setId(rs.getInt(1));
            est.setIdentificacion_usuario(rs.getString(2));
            est.setPrograma_academico(rs.getInt(3));
            est.setEstado_estudiante(rs.getString(4));
        }

        return est;
    }

    /**
     * Metodo que consulta todos los datos de los estudiantes de un programa
     * academico registrados en la Base de datos
     *
     * @param programa, identificacion del programa academico
     * @return list , Lista de Objetos tipo EstudianteDTO con los datos de los
     * estudiantes de un programa academico, si no exite retorna la lista vacia.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public List<EstudianteDTO> consultarEstudiantePrograma(int programa) throws SQLException {

        List<EstudianteDTO> list = new ArrayList<>();

        String sql = "select * from estudiante where programa_academico = ?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, programa);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            EstudianteDTO est = new EstudianteDTO();
            est.setId(rs.getInt(1));
            est.setIdentificacion_usuario(rs.getString(2));
            est.setPrograma_academico(rs.getInt(3));
            est.setEstado_estudiante(rs.getString(4));
            list.add(est);
        }

        return list;
    }

    /**
     * Metodo que consulta la cantidad de Citas a las que asistió un usuario en
     * un rango de fechas
     *
     * @param fechaI: fecha de inicio de consulta
     * @param fechaF: fecha de fin de la consulta
     * @param id_usuario: identificacion del usuario
     * @return int, Cantidad de citas de un usuario en las fechas seleccionadas.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public int cantidadCitasAsistidas(String fechaI, String fechaF, String id_usuario) throws SQLException {
        int cant = 0;
        String sql = "select count(*) from cita where estado = 'atendido' and fecha_cita between ? and ? and id_usuario = ? ";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDate(1, Date.valueOf(fechaI));
        ps.setDate(2, Date.valueOf(fechaF));
        ps.setString(3, id_usuario);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            cant = rs.getInt(1);
        }

        return cant;
    }

    /**
     * Metodo que consulta la cantidad de Citas a las que no asistió un usuario
     * en un rango de fechas
     *
     * @param fechaI: fecha de inicio de consulta
     * @param fechaF: fecha de fin de la consulta
     * @param id_usuario: identificacion del usuario
     * @return int, Cantidad de citas inasistidas de un usuario en las fechas
     * seleccionadas.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public int cantidadCitasNoAsistidas(String fechaI, String fechaF, String id_usuario) throws SQLException {
        int cant = 0;
        String sql = "select count(*) from cita where estado = 'inasistido' and fecha_cita between ? and ? and id_usuario = ? ";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDate(1, Date.valueOf(fechaI));
        ps.setDate(2, Date.valueOf(fechaF));
        ps.setString(3, id_usuario);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            cant = rs.getInt(1);
        }

        return cant;

    }

    /**
     * Metodo que consulta la cantidad de Citas pendientes de un usuario en un
     * rango de fechas
     *
     * @param fechaI: fecha de inicio de consulta
     * @param fechaF: fecha de fin de la consulta
     * @param id_usuario: identificacion del usuario
     * @return int, Cantidad de citas pendientes de un usuario en las fechas
     * seleccionadas.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public int cantidadCitasPendientes(String fechaI, String fechaF, String id_usuario) throws SQLException {

        int cant = 0;

        String sql = "select count(*) from cita where estado = 'pendiente' and fecha_cita between ? and ? and id_usuario = ? ";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDate(1, Date.valueOf(fechaI));
        ps.setDate(2, Date.valueOf(fechaF));
        ps.setString(3, id_usuario);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            cant = rs.getInt(1);
        }

        return cant;
    }
}
