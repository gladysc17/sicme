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
        
        String sql = "insert into horariomedico(fecha, id_horario, id_medico, estado)"
                + "values(?,?,?,?)";
        
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setDate(1, Date.valueOf(hm.getFecha()));
        ps.setInt(2, hm.getId_horario_horariomedico());
        ps.setString(3, hm.getId_medico_horariomedico());
        ps.setString(4, hm.getEstado_horariomedico());
        
        int res = ps.executeUpdate();
        
        if (res==1){
            return true;
        }else{
            return false;
        }
    }
    
    public HorarioMedicoDTO consultarHorarioMedico(int id_horariomedico) throws SQLException{
        
        String sql ="SELECT * FROM horariomedico WHERE id_horario = ?";
        
        PreparedStatement ps = con.prepareStatement(sql);          
        
        ps.setInt(1, id_horariomedico);        
                      
        ResultSet rs = ps.executeQuery();        
        
        HorarioMedicoDTO horam = null;
        
        while(rs.next()){
            
            horam = new HorarioMedicoDTO();
            
            horam.setId_horariomedico(rs.getInt("id_horario"));
            horam.setId_horario_horariomedico(rs.getInt("id_horario"));
            horam.setId_medico_horariomedico(rs.getString("id_medico"));
            horam.setEstado_horariomedico(rs.getString("estado"));
            horam.setFecha(rs.getString("fecha"));
        }

        return horam;
    }
    
    public List<HorarioMedicoDTO> listarHorasMedico(String idmedico) throws SQLException {
        
        String sql = "select * from horariomedico where id_medico = ? order by fecha";
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setString(1, idmedico);
        
        ResultSet rs = ps.executeQuery();
        List<HorarioMedicoDTO> lis = new ArrayList<HorarioMedicoDTO>();
        
        while(rs.next()){
            HorarioMedicoDTO ho = new HorarioMedicoDTO();
            ho.setId_horariomedico(rs.getInt(1));
            ho.setFecha(rs.getString(2));
            ho.setId_horario_horariomedico(rs.getInt(3));
            ho.setId_medico_horariomedico(rs.getString(4));
            ho.setEstado_horariomedico(rs.getString(5));
            lis.add(ho);
        }
        
        return lis;
    }
    
    public boolean eliminarHora(int id) throws SQLException {
        
        String sql = "delete from horariomedico where id = ? ";
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setInt(1, id);
        
        int rta = ps.executeUpdate();
        
        return rta > 0;
    }
    
    public String fechaActual() throws SQLException{
        String sql = "select current_date";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        String fe="";
        if(rs.next()){
            fe=rs.getString(1);
        }
        return fe;
    }
     
}
