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
        
        String sql = "insert into registroevento(nombre, correo, programa, id_evento, codigo, identificacion)"
                + "values (?, ?, ?, ?, ?, ?)";
        
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setString(1, re.getNombre());
        ps.setString(2, re.getCorreo());
        ps.setString(3, re.getPrograma());
        ps.setInt(4, re.getIdEvento());
        ps.setString(5, re.getCodigo());
        ps.setString(6, re.getIdentificacion());
        
        int res = ps.executeUpdate();
        if(res==1)
            return true;
        
        return false;
    }
    
    public int cantidadPorEvento(int idEvento) throws SQLException {
        String sql = "select count(*) from registroevento where id_evento = ? ";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idEvento);
        
        ResultSet rs = ps.executeQuery();
        int cant = 0;
        
        if(rs.next()){
            cant = rs.getInt(1);
        }
        return cant;
    }
}
