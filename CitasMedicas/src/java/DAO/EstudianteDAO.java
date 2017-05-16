    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.EstudianteDTO;
import java.sql.Connection;
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
     * @param est
     * @return boolean, con valor verdadero si hubo registro exitoso, falso si existe error dentro del procedimiento.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta algun campo de la base de datos por llenar.
     */
    public boolean registrarEstudiante(EstudianteDTO est) throws SQLException {
                       
        String sql = "INSERT INTO estudiante (identificacion_usuario, programa_academico )"
                + " VALUES (?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setString(1, est.getIdentificacion_usuario());                
        ps.setString(2, est.getPrograma_academico());               

        int resultado = ps.executeUpdate();

        return resultado == 1;

    }

}
