/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.HorarioDTO;
import DTO.HorarioMedicoDTO;
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
public class HorarioMedicoDAO {
    
    private Connection con;

    public HorarioMedicoDAO(Connection con) {
        this.con = con;
    }
    
    public boolean registrarHorarioMedico(HorarioMedicoDTO hm) throws SQLException{
        
        String sql = "insert into horariomedico(fecha, id_horario_horariomedico, id_medico_horariomedico, estado_horariomedico)"
                + "values(?,?,?,?)";
        
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setDate(1, Date.valueOf(hm.getFecha()));
        ps.setInt(2, hm.getId_horario_horariomedico());
        ps.setInt(3, hm.getId_medico_horariomedico());
        ps.setString(4, hm.getEstado_horariomedico());
        
        int res = ps.executeUpdate();
        
        if (res==1){
            return true;
        }else{
            return false;
        }
    }
    
    public HorarioMedicoDTO consultarHorarioMedico(int id_horariomedico) throws SQLException{
        
        String sql ="SELECT * FROM horariomedico WHERE id_horariomedico = ?";
        
        PreparedStatement ps = con.prepareStatement(sql);          
        
        ps.setInt(1, id_horariomedico);        
                      
        ResultSet rs = ps.executeQuery();        
        
        HorarioMedicoDTO horam = null;
        
        while(rs.next()){
            
            horam = new HorarioMedicoDTO();
            
            horam.setId_horariomedico(rs.getInt("id_horariomedico"));
            horam.setId_horario_horariomedico(rs.getInt("id_horario_horariomedico"));
            horam.setId_medico_horariomedico(rs.getInt("id_medico_horariomedico"));
            horam.setEstado_horariomedico(rs.getString("estado_horariomedico"));
            horam.setFecha(rs.getString("fecha"));
        }

        return horam;
    }
     
}
