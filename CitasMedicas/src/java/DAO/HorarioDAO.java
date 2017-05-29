/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.HorarioDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.ConexionPostgres;

/**
 *
 * @author Gladys M
 */
public class HorarioDAO {

    private Connection con;

    public HorarioDAO(Connection con) {
        this.con = con;
    }

    public List<HorarioDTO> consultarHorasDisponibles(int id_medico, String fecha) throws SQLException {

        List<HorarioDTO> lista = new ArrayList<HorarioDTO>();

        String cons = "SELECT id_horariomedico, hora_inicio FROM horariomedico, horario WHERE id_horario_horariomedico = id_horario "
                + "AND id_medico_horariomedico = ? AND fecha = ? AND estado_horariomedico = 'disponible' ORDER BY hora_inicio";

        PreparedStatement ps = con.prepareStatement(cons);

        ps.setInt(1, id_medico);
        ps.setDate(2, Date.valueOf(fecha));

        ResultSet rs = ps.executeQuery();

        HorarioDTO ho = null;
        while (rs.next()) {
            ho = new HorarioDTO();
            ho.setId_horario(rs.getInt("id_horariomedico"));
            ho.setHora_inicio(rs.getTime("hora_inicio"));

            lista.add(ho);
        }
        return lista;
    }

    public List<HorarioDTO> listadoHoras() throws SQLException {

        List<HorarioDTO> ls = new ArrayList<HorarioDTO>();

        String sql = "select * from horario order by id";

        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            HorarioDTO ho = new HorarioDTO();
            ho.setId_horario(rs.getInt(1));
            ho.setHora_inicio(rs.getTime(2));
            ho.setHora_final(rs.getTime(3));
            ls.add(ho);
        }
        ps.close();
        rs.close();
        rs = null;
        ps = null;

        return ls;
    }

    public boolean cambiarEstadoHora(int id_medico_horariomedico, String fecha, int id_horario_horariomedico ) throws SQLException {

        String sql = "UPDATE horariomedico SET estado_horariomedico = 'ocupado' "
                + "WHERE id_medico_horariomedico = ? AND fecha = ? AND id_horario_horariomedico = ?";

        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setInt(1, id_medico_horariomedico);
        ps.setDate(2, Date.valueOf(fecha));
        ps.setInt(3, id_horario_horariomedico);

        int rta = ps.executeUpdate();

        if (rta > 0) {
            return true;
        } else {
            return false;
        }

    }
    
    public List<HorarioDTO> consultarHorasPorServicio(int id_medico, String fecha, String hora) throws SQLException {

        List<HorarioDTO> lista = new ArrayList<HorarioDTO>();

        String cons = "SELECT id_horario, hora_inicio FROM horariomedico, horario WHERE id_horario_horariomedico = id_horario "
                + "AND id_medico_horariomedico = ? AND fecha = ? AND estado_horariomedico = 'disponible' ORDER BY hora_inicio";

        PreparedStatement ps = con.prepareStatement(cons);
        
        ps.setInt(1, id_medico);
        ps.setDate(2, Date.valueOf(fecha));
        ps.setString(3, hora);

        ResultSet rs = ps.executeQuery();

        HorarioDTO ho = null;
        while (rs.next()) {
            ho = new HorarioDTO();
            ho.setId_horario(rs.getInt("id_horario"));
            ho.setHora_inicio(rs.getTime("hora_inicio"));

            lista.add(ho);
        }
        return lista;
    }
    
     public HorarioDTO consultarHorarioId(int id_horario) throws SQLException{
        
        String sql ="SELECT * FROM horario WHERE id_horario = ?";
        
        PreparedStatement ps = con.prepareStatement(sql);          
        
        ps.setInt(1, id_horario);        
                      
        ResultSet rs = ps.executeQuery();        
        
        HorarioDTO horario = null;
        
        while(rs.next()){
            
            horario = new HorarioDTO();
            
            horario.setId_horario(rs.getInt("id_horario"));
            horario.setHora_inicio(rs.getTime("hora_inicio"));            
            
        }

        return horario;
    }

}
