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
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author LEGADO
 */
public class RegistroeventoDAO {
    
    private Connection con;

    public RegistroeventoDAO(Connection con) {
        this.con = con;
    }
    /**
     * Metodo que registra los datos de las personas que se inscriben a un evento
     *
     * @param re, objeto tipo RegistroeventoDTO con los datos de la inscripción
     * @return boolean, con valor verdadero si hubo registro exitoso, falso si existe error dentro del procedimiento.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta algun campo de la base de datos por llenar.
     */
    
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
    
    /**
     * Metodo que retorna la cantidad de personas registradas a un evento
     *
     * @param idEvento, identificación del evento
     * @return int, Cantidad de personas registradas en el evento
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta algun campo de la base de datos por llenar.
     */
    
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
    
    /**
     * Metodo que consulta todas las personas registradas a un evento
     *
     * @param idEvento, identificacion del evento
     * @return list, Lista de Objetos tipo RegistroeventoDTO con los datos de las personas registradas al evento, si no exiten registros retorna la lista vacia.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta algun campo de la base de datos por llenar.
     */
    
     public List<RegistroeventoDTO> listaRegistrados (int idEvento) throws SQLException {
        
        List<RegistroeventoDTO> lista = new ArrayList<RegistroeventoDTO>();
        String sql = "select * from registroevento where id_evento = ? ";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idEvento);
        
        ResultSet rs = ps.executeQuery();        
        RegistroeventoDTO res = null;
        while (rs.next()) {
            res = new RegistroeventoDTO();
            res.setCodigo(rs.getString("codigo"));
            res.setNombre(rs.getString("nombre"));
            res.setIdentificacion(rs.getString("identificacion"));
            res.setCorreo(rs.getString("correo"));
            res.setPrograma(rs.getString("programa"));            

            lista.add(res);
        }

        return lista;
    }
    
}
