/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.EventoDTO;
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
 * @author LEGADO
 */
public class EventoDAO {
    
    private Connection con;

    public EventoDAO(Connection con) {
        this.con = con;
    }
    
    public boolean registrarEvento(EventoDTO evento)throws SQLException{
        
        String sql="INSERT INTO evento(nombre, fecha, hora, lugar, descripcion, director, creado, estado)"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setString(1, evento.getNombreEvento());
        ps.setDate(2, Date.valueOf(evento.getFechaEvento()));
        ps.setTime(3, Time.valueOf(evento.getHoraEvento()));
        ps.setString(4, evento.getLugarEvento());
        ps.setString(5, evento.getDescrEvento());
        ps.setString(6, evento.getDirector());  
        ps.setString(7, evento.getCreado());
        ps.setString(8, evento.getEstado());
        
        int res = ps.executeUpdate();
        
        if (res==1){
            return true;
        }else{
            return false;
        }
    }
    
    
    public double[] diasMes() throws SQLException{
        
        String sql = "select extract (day from (select date_trunc('month',current_date))), extract (day from (select date_trunc('month',current_date) +'1month' ::interval -'1sec' ::interval))";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
        double [] vec = new double[2];
        if(rs.next()){
            vec[0]= rs.getDouble(1);
            vec[1]= rs.getDouble(2);
        }
        
        return vec;
    } 
    
    public double obtenerMes() throws SQLException{
        
        String sql="select date_part('month',current_date)";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
        double mes=0;
        if(rs.next()){
            mes = rs.getDouble(1);
        }
        
        return mes;
    }
    
    public double obtenerAño() throws SQLException{
        
        String sql="select date_part('year',current_date)";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
        double año=0;
        
        if(rs.next()){
            año = rs.getDouble(1);
        }
        
        return año;
    }
    
    public List<EventoDTO> eventoPorMes(String fechaInicio, String fechaFinal, String activo) throws SQLException{
        
        String sql = "select * from evento where fecha between ? and ? and  estado = ? ";
        
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setDate(1, Date.valueOf(fechaInicio));
        ps.setDate(2, Date.valueOf(fechaFinal));
        ps.setString(3, activo);
        
        ResultSet rs = ps.executeQuery();
        List<EventoDTO> ls = new ArrayList<EventoDTO>();
        
        
        
        while (rs.next()){
            EventoDTO eve = new EventoDTO();
            eve.setIdEvento(rs.getInt(1));
            eve.setNombreEvento(rs.getString(2));
            eve.setFechaEvento(rs.getString(3));
            eve.setHoraEvento(rs.getTime(4).toString());
            eve.setLugarEvento(rs.getString(5));
            eve.setDescrEvento(rs.getString(6));
            eve.setDirector(rs.getString(7));
            eve.setCreado(rs.getString(8));
            eve.setEstado(rs.getString(9));
            
            ls.add(eve);
        }
        
        rs.close();
        ps.close();
        
        ps=null; rs = null;
        
        return ls;
    }
    
    public List<EventoDTO> listarEvento(String identificacion) throws SQLException{
        
        List<EventoDTO> ls = new ArrayList<EventoDTO>();
        String sql = "select * from evento where creado = ?";
        
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setString(1, identificacion);
        
        ResultSet rs = ps.executeQuery();
        
        while(rs.next()){
            EventoDTO eve = new EventoDTO();
            eve.setIdEvento(rs.getInt(1));
            eve.setNombreEvento(rs.getString(2));
            eve.setFechaEvento(String.valueOf(rs.getDate(3)));
            eve.setHoraEvento(String.valueOf(rs.getTime(4)));
            eve.setLugarEvento(rs.getString(5));
            eve.setDescrEvento(rs.getString(6));
            eve.setDirector(rs.getString(7));
            eve.setCreado(rs.getString(8));
            eve.setEstado(rs.getString(9));
            ls.add(eve);
        }
        rs.close();
        ps.close();
        rs = null; ps = null;
        
        return ls;
    }
    
    public boolean modificarEvento(int idEvento, String fecha, String hora, String lugar) throws SQLException {
       
        String sql = "UPDATE evento set fecha = ?, hora = ?, lugar = ? where id_evento = ?";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDate(1, Date.valueOf(fecha));
        ps.setTime(2, Time.valueOf(hora));
        ps.setString(3, lugar);
        ps.setInt(4, idEvento);
        
        int res = ps.executeUpdate();
        if(res==1)
            return true;
        return false;
    }
    
    public EventoDTO consultaPorId(int id) throws SQLException {
        String sql = "select * from evento where id_evento = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        
        ResultSet rs = ps.executeQuery();
        EventoDTO eve = null;
        while(rs.next()){
            eve = new EventoDTO();
            eve.setIdEvento(rs.getInt(1));
            eve.setNombreEvento(rs.getString(2));
            eve.setFechaEvento(String.valueOf(rs.getDate(3)));
            eve.setHoraEvento(String.valueOf(rs.getTime(4)));
            eve.setLugarEvento(rs.getString(5));
            eve.setDescrEvento(rs.getString(6));
            eve.setDirector(rs.getString(7));
            eve.setCreado(rs.getString(8));
            eve.setEstado(rs.getString(9));
        }
        
        return eve;        
    }
    
    public List<EventoDTO> listarEventos(String fechaI, String fechaF) throws SQLException {
        List<EventoDTO> ls = new ArrayList<EventoDTO>();
        String sql = "select * from evento where fecha between ? and ? ";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDate(1, Date.valueOf(fechaI));
        ps.setDate(2, Date.valueOf(fechaF));   
        
        ResultSet rs = ps.executeQuery();
        
        while(rs.next()){
            EventoDTO eve = new EventoDTO();
            eve.setIdEvento(rs.getInt(1));
            eve.setNombreEvento(rs.getString(2));
            eve.setFechaEvento(String.valueOf(rs.getDate(3)));
            eve.setHoraEvento(String.valueOf(rs.getTime(4)));
            eve.setLugarEvento(rs.getString(5));
            eve.setDescrEvento(rs.getString(6));
            eve.setDirector(rs.getString(7));
            eve.setCreado(rs.getString(8));
            eve.setEstado(rs.getString(9));
            ls.add(eve);
        }
        rs.close();
        ps.close();
        rs = null; ps = null;
        
        return ls;
    }
    
    public List<EventoDTO> consultarEventos() throws SQLException {
        List<EventoDTO> ls = new ArrayList<EventoDTO>();
        String sql = "select * from evento" ;
        
        PreparedStatement ps = con.prepareStatement(sql);  
        
        ResultSet rs = ps.executeQuery();
        
        while(rs.next()){
            EventoDTO eve = new EventoDTO();
            eve.setIdEvento(rs.getInt(1));
            eve.setNombreEvento(rs.getString(2));
            eve.setFechaEvento(String.valueOf(rs.getDate(3)));
            eve.setHoraEvento(String.valueOf(rs.getTime(4)));
            eve.setLugarEvento(rs.getString(5));
            eve.setDescrEvento(rs.getString(6));
            eve.setDirector(rs.getString(7));
            eve.setCreado(rs.getString(8));
            eve.setEstado(rs.getString(9));
            ls.add(eve);
        }
        rs.close();
        ps.close();
        rs = null; ps = null;
        
        return ls;
    }
}
