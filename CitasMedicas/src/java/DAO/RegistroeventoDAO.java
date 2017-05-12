/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.RegistroeventoDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author LEGADO
 */
public class RegistroeventoDAO {
    
    private Connection con;

    public RegistroeventoDAO(Connection con) {
        this.con = con;
    }
    
    public boolean inscripcionEvento(RegistroeventoDTO re) throws SQLException {
        
        String sql = "inser into registroevento(codigo, nombre, identificacion, correo, programa, id_evento)"
                + "values (?, ?, ?, ?, ?, ?)";
        
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setInt(1, re.getCodigo());
        ps.setString(2, re.getNombre());
        ps.setInt(3, re.getIdentificacion());
        ps.setString(4, re.getCorreo());
        ps.setString(5, re.getPrograma());
        ps.setInt(6, re.getIdEvento());
        
        int res = ps.executeUpdate();
        if(res==1)
            return true;
        
        return false;
    }
}
