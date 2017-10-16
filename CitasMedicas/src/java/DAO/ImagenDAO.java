/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.ImagenDTO;
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
public class ImagenDAO {

    private Connection con;

    public ImagenDAO(Connection con) {
        this.con = con;
    }
    
    public boolean registrarImagen(ImagenDTO ima) throws SQLException {
        
        String sql = "insert into imagen (nombre, estado) values (?,?)";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, ima.getNombre());
        ps.setString(2, ima.getEstado());
        
        int resultado = ps.executeUpdate();

        if (resultado == 1) {
            return true;
        } else {
            return false;
        }
    }
    
    public List<ImagenDTO> listaImagenes() throws SQLException {
        
        String sql = "select * from imagen order by id";
        
        List<ImagenDTO> lis = new ArrayList<>();
        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();
        
        while(rs.next()){
            ImagenDTO ima = new ImagenDTO();
            ima.setId(rs.getInt(1));
            ima.setNombre(rs.getString(2));
            ima.setEstado(rs.getString(3));
            lis.add(ima);
        }
        ps.close();
        rs.close();
        rs = null;
        ps = null;
        
        return lis;
    }
    
    public boolean actualizarEstadoBanner(String estado, int id) throws SQLException {
        
        String sql = "UPDATE imagen SET estado = ? where id = ?";
        
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setString(1, estado);
        ps.setInt(2, id);
        
        int rta = ps.executeUpdate();

        if (rta > 0) {
            return true;
        } else {
            return false;
        }
    }
    
    public boolean eliminarImagen(int id) throws SQLException {
        
        String sql = "DELETE FROM imagen where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setInt(1, id);
        
        
        int rta = ps.executeUpdate();
        
        if(rta>0)
            return true;
        return false;
    }
    
    public List<ImagenDTO> obtenerImagenesActivas() throws SQLException {
        
        String sql = "select * from imagen where estado = 'Activo'";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
        List<ImagenDTO> lis = new ArrayList<ImagenDTO>();
        
        while(rs.next()){
            ImagenDTO ima = new ImagenDTO();
            ima.setId(rs.getInt(1));
            ima.setNombre(rs.getString(2));
            ima.setEstado(rs.getString(3));
            lis.add(ima);
        }
        return lis;
    }
}
