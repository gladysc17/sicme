/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.SesionDTO;
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
public class SesionDAO {
    
    private Connection con;

    public SesionDAO(Connection con) {
        this.con = con;
    }
    
    /**
     * Metodo que registra los datos de una Sesion de Psicologia en la Base de datos
     *
     * @param sesion, objeto tipo SesionDTO con los datos de la Sesion
     * @return boolean, con valor verdadero si hubo registro exitoso, falso si existe error dentro del procedimiento.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta algun campo de la base de datos por llenar.
     */

    public boolean registrarSesion(SesionDTO sesion) throws SQLException {

        String sql = "INSERT INTO sesion(id_usuario, num_sesion, diagnostico, fecha, "
                + "hora, id_cita, id_hcpsicologia) VALUES (?, ?, ?, ?, ?, ?, ?)";                

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, sesion.getIdUsuario());
        ps.setInt(2, sesion.getNumSesion());
        ps.setString(3, sesion.getDiagnostico());
        ps.setDate(4, Date.valueOf(sesion.getFecha()));        
        ps.setTime(5, Time.valueOf(sesion.getHora()));
        ps.setInt(6, sesion.getIdCita());
        ps.setInt(7, sesion.getIdHcPsicologia());
        
        int resultado = ps.executeUpdate();

        return resultado == 1;

    } 
    
    /**
     * Metodo que consulta todos los datos de las sesiones de la historia clinica de psicologia de un usuario 
     *
     * @param idHcPsicologia, identificacion de la Historia clinica de Psicologia
     * @return list, Lista de Objetos tipo SesionDTO con las sesiones de la historia clinica de psicologia, si no exite retorna la lista vacia.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta algun campo de la base de datos por llenar.
     */
    
    public List<SesionDTO> consultarSesionesPorHcPsicologia(int idHcPsicologia) throws SQLException{
        
        String sql = "SELECT * FROM sesion WHERE id_hcpsicologia = ?";
        
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setInt(1, idHcPsicologia);
        System.out.println("sql --> "+ps.toString());
        ResultSet data = ps.executeQuery();
        List<SesionDTO> sesiones = new ArrayList();
        
        while(data.next()){
            SesionDTO sesion = new SesionDTO();
            sesion.setId(data.getInt("id"));
            sesion.setIdUsuario(data.getString("id_usuario"));
            sesion.setNumSesion(data.getInt("num_sesion"));
            sesion.setDiagnostico(data.getString("diagnostico"));
            sesion.setFecha(data.getString("fecha"));
            sesion.setHora(data.getString("hora"));
            sesion.setIdCita(data.getInt("id_cita"));
            sesion.setIdHcPsicologia(idHcPsicologia);
            
            sesiones.add(sesion);
        }
        
        return sesiones;        
    }
    
}
