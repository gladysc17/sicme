/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.UsuarioDTO;
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
public class UsuarioDAO {

    private Connection con;

    public UsuarioDAO(Connection con) {
        this.con = con;
    }

    public boolean registrarUsuario(UsuarioDTO otro) throws SQLException {

        String sql = "INSERT INTO usuario (identificacion, tipo_identificacion, codigo, nombre, correo, "
                + "fecha_nacimiento, genero, edad, estado_civil, direccion, telefono, tipo_usuario)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, otro.getIdentificacion());
        ps.setString(2, otro.getTipo_identificacion());
        ps.setString(3, otro.getCodigo());
        ps.setString(4, otro.getNombre());
        ps.setString(5, otro.getCorreo());
        ps.setDate(6, Date.valueOf(otro.getFecha_nacimiento()));
        ps.setString(7, otro.getGenero());
        ps.setInt(8, otro.getEdad());
        ps.setString(9, otro.getEstado_civil());
        ps.setString(10, otro.getDireccion());
        ps.setString(11, otro.getTelefono());
        ps.setString(12, otro.getTipo_usuario());

        int resultado = ps.executeUpdate();

        return resultado == 1;

    }

    public UsuarioDTO consultarUsuarioPorId(int id) throws SQLException {

        String sql = "SELECT * FROM usuario WHERE identificacion = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        UsuarioDTO otro = null;

        if (rs.next()) {
            otro = new UsuarioDTO();
            otro.setIdentificacion(rs.getString("identificacion"));
            otro.setTipo_identificacion(rs.getString("tipo_identificacion"));
            otro.setCodigo(rs.getString("codigo"));
            otro.setNombre(rs.getString("nombre"));
            otro.setCorreo(rs.getString("correo"));
            otro.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
            otro.setGenero(rs.getString("genero"));
            otro.setEdad(rs.getInt("edad"));
            otro.setEstado_civil(rs.getString("estado_civil"));
            otro.setDireccion(rs.getString("direccion"));
            otro.setTelefono(rs.getString("telefono"));
            otro.setTipo_usuario(rs.getString("tipo_usuario"));

        }
        return otro;
    }

    public List<UsuarioDTO> consultarUsuarios() throws SQLException {

        List<UsuarioDTO> listaOtro = new ArrayList<UsuarioDTO>();

        String sql = "SELECT * FROM usuario ORDER BY nombre";

        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        UsuarioDTO otro = null;

        while (rs.next()) {
            otro = new UsuarioDTO();

            otro = new UsuarioDTO();
            otro.setIdentificacion(rs.getString("identificacion"));
            otro.setTipo_identificacion(rs.getString("tipo_identificacion"));
            otro.setCodigo(rs.getString("codigo"));
            otro.setNombre(rs.getString("nombre"));
            otro.setCorreo(rs.getString("correo"));
            otro.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
            otro.setGenero(rs.getString("genero"));
            otro.setEdad(rs.getInt("edad"));
            otro.setEstado_civil(rs.getString("estado_civil"));
            otro.setDireccion(rs.getString("direccion"));
            otro.setTelefono(rs.getString("telefono"));
            otro.setTipo_usuario(rs.getString("tipo_usuario"));

            listaOtro.add(otro);
        }

        return listaOtro;

    }

    public UsuarioDTO consultarUsuarioPorIdCodigo(String id, String codigo) throws SQLException {

        String sql = "SELECT * FROM usuario WHERE identificacion = ? OR codigo = ? ";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, id);
        ps.setString(2, codigo);

        ResultSet rs = ps.executeQuery();

        UsuarioDTO otro = null;

        if (rs.next()) {
            otro = new UsuarioDTO();

            otro = new UsuarioDTO();
            otro.setIdentificacion(rs.getString("identificacion"));
            otro.setTipo_identificacion(rs.getString("tipo_identificacion"));
            otro.setCodigo(rs.getString("codigo"));
            otro.setNombre(rs.getString("nombre"));
            otro.setCorreo(rs.getString("correo"));
            otro.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
            otro.setGenero(rs.getString("genero"));
            otro.setEdad(rs.getInt("edad"));
            otro.setEstado_civil(rs.getString("estado_civil"));
            otro.setDireccion(rs.getString("direccion"));
            otro.setTelefono(rs.getString("telefono"));
            otro.setTipo_usuario(rs.getString("tipo_usuario"));
        }

        return otro;

    }

    public boolean modificarUsuario(String identificacion, String correo, String fechanacimiento, String genero, String estadocivil, String direccion, String telefono) throws SQLException {

        String sql = "UPDATE usuario SET correo = ? , fecha_nacimiento = ?, genero = ?, estado_civil = ? , direccion =?, telefono = ? "
                + "WHERE  identificacion = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, correo);
        ps.setString(2, fechanacimiento);
        ps.setString(3, genero);
        ps.setString(4, estadocivil);
        ps.setString(5, direccion);
        ps.setString(6, telefono);
        ps.setString(7, identificacion);

        int rta = ps.executeUpdate();

        return rta > 0;

    }

    public int calcularedad(String fecha) throws SQLException {
        
        int edad =0;

        String sql = "select (current_date - ? )/365";

        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setString(1, fecha);
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
            edad = rs.getInt("edad");
            return edad;                        
        }
        return edad;
       
    }

}
