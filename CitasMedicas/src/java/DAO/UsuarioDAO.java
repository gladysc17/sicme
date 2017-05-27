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

    public UsuarioDTO consultarUsuarioPorId(String id) throws SQLException {

        String sql = "SELECT * FROM usuario WHERE identificacion = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, id);

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

    public boolean modificarUsuario(String identificacion, String correo, Date fechanacimiento, String genero, String estadocivil, String direccion, String telefono) throws SQLException {

        String sql = "UPDATE usuario SET correo = ? , fecha_nacimiento = ?, genero = ?, estado_civil = ? , direccion =?, telefono = ? "
                + "WHERE  identificacion = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, correo);
        ps.setDate(2, fechanacimiento);
        ps.setString(3, genero);
        ps.setString(4, estadocivil);
        ps.setString(5, direccion);
        ps.setString(6, telefono);
        ps.setString(7, identificacion);

        int rta = ps.executeUpdate();

        return rta > 0;

    }
    
    public boolean modificarAdmin(String identificacion, String contrasena) throws SQLException {

        String sql = "UPDATE administrador SET contrasena = ? "
                + "WHERE  identificacion_usuario = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, contrasena);
        ps.setString(2, identificacion);

        int rta = ps.executeUpdate();

        return rta > 0;

    }
    public boolean modificarVice(String identificacion, String contrasena) throws SQLException {

        String sql = "UPDATE vicerrector SET contrasena = ? "
                + "WHERE  identificacion_usuario = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, contrasena);
        ps.setString(2, identificacion);

        int rta = ps.executeUpdate();

        return rta > 0;

    }
    public boolean modificarMedico(String identificacion, String contrasena) throws SQLException {

        String sql = "UPDATE medico SET contrasena = ? "
                + "WHERE  identificacion = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, contrasena);
        ps.setString(2, identificacion);

        int rta = ps.executeUpdate();

        return rta > 0;

    }

    public int calcularedad(Date fecha) throws SQLException {
        
        int edad =0;

        String sql = "select (current_date - ? )/365 AS edad";

        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setDate(1, fecha);
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
            edad = rs.getInt("edad");
            return edad;                        
        }
        return edad;
       
    }
    
    public ArrayList<UsuarioDTO> consultarMedicosPorServicio(String tipo_usuario, String servicio) throws SQLException {

        ArrayList<UsuarioDTO> medicos = new ArrayList<UsuarioDTO>();

        String sql = "SELECT * FROM usuario u INNER JOIN medico m ON u.identificacion = m.identificacion WHERE tipo_usuario = ? AND m.servicio = ?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, tipo_usuario);
        ps.setString(2, servicio);

        ResultSet rs = ps.executeQuery();

        UsuarioDTO med = null;

        while (rs.next()) {

            med = new UsuarioDTO();

            med.setIdentificacion(rs.getString("identificacion"));
            med.setTipo_identificacion(rs.getString("tipo_identificacion"));
            med.setCodigo(rs.getString("codigo"));
            med.setNombre(rs.getString("nombre"));
            med.setCorreo(rs.getString("correo"));
            med.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
            med.setGenero(rs.getString("genero"));
            med.setEdad(rs.getInt("edad"));
            med.setEstado_civil(rs.getString("estado_civil"));
            med.setDireccion(rs.getString("direccion"));
            med.setTelefono(rs.getString("telefono"));
            med.setTipo_usuario(rs.getString("tipo_usuario"));

            medicos.add(med);
        }
        return medicos;
    }

}
