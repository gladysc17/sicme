/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.SesionOdontologiaDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Mauricio U
 */
public class SesionOdontologiaDAO {
    
    private Connection con;

    public SesionOdontologiaDAO(Connection con) {
        this.con = con;
    }

    public boolean registrarSesionOdontologia(SesionOdontologiaDTO sesionOdontologia) throws SQLException {

        String sql = "INSERT INTO sesion_odontologia(diagnostico, control_placa, odontograma, id_cita, id_hc_odontograma, motivo) "
                + " VALUES (?, ?, ?, ?, ?, ?) ";                

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, sesionOdontologia.getDiagnostico());
        ps.setString(2, sesionOdontologia.getControlPlaca());
        ps.setString(3, sesionOdontologia.getOdontograma());
        ps.setInt(4, sesionOdontologia.getId_cita());
        ps.setInt(5, sesionOdontologia.getId_hcodontologia());
        ps.setString(6, sesionOdontologia.getMotivo());        
        
        int resultado = ps.executeUpdate();

        return resultado == 1;

    } 
    
    public List<SesionOdontologiaDTO> consultarSesionesPorHcOdontologia(int idHcOdontologia) throws SQLException{
        
        String sql = "SELECT * FROM sesion_odontologia WHERE id_hc_odontograma = ?";
        
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setInt(1, idHcOdontologia);
        System.out.println("sql --> "+ps.toString());
        ResultSet data = ps.executeQuery();
        List<SesionOdontologiaDTO> sesiones = new ArrayList();
        
        while(data.next()){
            SesionOdontologiaDTO sesion = new SesionOdontologiaDTO();
            sesion.setControlPlaca(data.getString("control_placa"));
            sesion.setDiagnostico(data.getString("diagnostico"));
            sesion.setId(data.getInt("id"));
            sesion.setId_cita(data.getInt("id_cita"));
            sesion.setId_hcodontologia(data.getInt("id_hc_odontograma"));
            sesion.setMotivo(data.getString("motivo"));
            sesion.setOdontograma(data.getString("odontograma"));
                        
            sesiones.add(sesion);
        }
        
        return sesiones;        
    }
    
}
