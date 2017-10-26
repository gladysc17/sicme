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
     * @param est
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
    
    public List<String> consultarProgramaAcademico() throws SQLException {
        List<String> list = new ArrayList<>();

        String sql = "select distinct(programa_academico) from estudiante";

        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            String res = rs.getString("programa_academico");
            list.add(res);
        }

        return list;
    }

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
