/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.VicerrectorDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Gladys M
 */
public class VicerrectorDAO {

    private Connection con;

    public VicerrectorDAO(Connection con) {
        this.con = con;
    }

    public boolean registrarAdministrador(VicerrectorDTO vc) throws SQLException {

        String sql = "INSERT INTO administrador (identificacion_usuario, programa_academico )"
                + " VALUES (?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, vc.getIdentificacion_usuario());
        ps.setString(2, vc.getContrasena());

        int resultado = ps.executeUpdate();

        return resultado == 1;

    }

    public VicerrectorDTO consultarViceId(String id) throws SQLException {

        String sql = "SELECT * FROM vicerrector WHERE identificacion_usuario = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, id);

        ResultSet rs = ps.executeQuery();

        VicerrectorDTO med = null;

        if (rs.next()) {
            med = new VicerrectorDTO();
            med.setIdentificacion_usuario(rs.getString("identificacion_usuario"));
            med.setContrasena(rs.getString("contrasena"));

        }
        return med;
    }
   
}
