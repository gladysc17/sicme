/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Programa_academicoDTO;
import DTO.ServicioDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class ServicioDAO {

    private Connection con;

    public ServicioDAO(Connection con) {
        this.con = con;
    }

    public boolean registrarServicio(ServicioDTO ser) throws SQLException {

        String sql = "INSERT INTO sesion(nombre) VALUES (?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, ser.getNombre());

        int resultado = ps.executeUpdate();

        return resultado == 1;

    }

    public ServicioDTO consultarServicio(int id) throws SQLException {

        String sql = "SELECT * FROM servicio WHERE id = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        ServicioDTO ser = null;
        
        if (rs.next()) {
            
            ser = new ServicioDTO();
            
            ser.setId(rs.getInt("id"));
            ser.setNombre(rs.getString("nombre"));
            
        }
        return ser;

    }
    
    public List<ServicioDTO> consultarServicios() throws SQLException {

        List<ServicioDTO> listaServicios = new ArrayList<ServicioDTO>();

        String sql = "SELECT * FROM servicio ORDER BY nombre";

        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        ServicioDTO ser = null;

        while (rs.next()) {            
            
            ser = new ServicioDTO();
            
            ser.setId(rs.getInt("id"));
            ser.setNombre(rs.getString("nombre"));

            listaServicios.add(ser);
        }

        return listaServicios;

    }
    
}
