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

    /**
     * metodo que permite registrar un usuario
     *
     * @param otro Objeto de tipo UsuarioDTO con la información suministrada
     * @return valor booleano que confirma si la operación se realizo con éxito
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public boolean registrarUsuario(UsuarioDTO otro) throws SQLException {

        String sql = "INSERT INTO usuario (identificacion, tipo_identificacion, codigo, nombre, correo, "
                + "fecha_nacimiento, genero, edad, estado_civil, direccion, telefono, tipo_usuario, fecharegistro, contrasena)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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
        ps.setDate(13, Date.valueOf(otro.getFecharegistro()));
        ps.setString(14, otro.getContrasena());

        int resultado = ps.executeUpdate();

        return resultado == 1;

    }

    /**
     * metodo que consultar un usuario por su identificación
     *
     * @param id Identificador del usuario en la base de datos
     * @return Objeto de tipo UsuarioDTO con la información registrada en la
     * base de datos
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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
            otro.setFecharegistro(rs.getString("fecharegistro"));
            otro.setContrasena(rs.getString("contrasena"));

        }
        return otro;
    }

    /**
     * metodo que permite obtener todos los usuarios que estan registrados en la
     * base de datos
     *
     * @return Listado de los usuarios con la información que se encuentra en la
     * base de datos
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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
            otro.setFecharegistro(rs.getString("fecharegistro"));
            otro.setContrasena(rs.getString("contrasena"));

            listaOtro.add(otro);
        }

        return listaOtro;

    }

    /**
     * metodo que permite consultar un usuario, bien sea por su identificación o
     * codigo
     *
     * @param id Identificación del usuario
     * @param codigo Codigo dentro de la universidad
     * @return Usuario que corresponde a la identificación o codigo
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
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
            otro.setFecharegistro(rs.getString("fecharegistro"));
            otro.setContrasena(rs.getString("contrasena"));
        }

        return otro;

    }

    /**
     * metodo que permite modificar los datos de un usuario
     *
     * @param identificacion Identificación del usuario
     * @param correo Correo del usuario
     * @param fechanacimiento Fecha de nacimiento del usuario
     * @param genero Genero del usuario
     * @param estadocivil Estado civil del usuario
     * @param direccion Dirección de la residencia del usuario
     * @param telefono Telefono del usuario
     * @param edad Edad del usuario
     * @return Valor booleano con la respuesta de la modificación
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public boolean modificarUsuario(String identificacion, String correo, Date fechanacimiento, String genero, String estadocivil, String direccion, String telefono, int edad) throws SQLException {

        String sql = "UPDATE usuario SET correo = ? , fecha_nacimiento = ?, genero = ?, estado_civil = ? , direccion =?, telefono = ?, edad = ? "
                + "WHERE  identificacion = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, correo);
        ps.setDate(2, fechanacimiento);
        ps.setString(3, genero);
        ps.setString(4, estadocivil);
        ps.setString(5, direccion);
        ps.setString(6, telefono);
        ps.setInt(7, edad);
        ps.setString(8, identificacion);

        int rta = ps.executeUpdate();

        return rta > 0;

    }

    /**
     * metodo que permite modificar la contraseña del profesional de la salud
     *
     * @param identificacion Identificación del profesional de la salud
     * @param contrasena nueva contraseña del profesional de la salud
     * @return valor booleano con la respuesta de la actualización
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public boolean modificarMedico(String identificacion, String contrasena) throws SQLException {

        String sql = "UPDATE medico SET contrasena = ? "
                + "WHERE  identificacion = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, contrasena);
        ps.setString(2, identificacion);

        int rta = ps.executeUpdate();

        return rta > 0;

    }

    /**
     * Metodo que permite calcular la edad.
     *
     * @param fecha Fecha de nacimiento
     * @return Valor entero con la edad de la persona
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public int calcularedad(Date fecha) throws SQLException {

        int edad = 0;

        String sql = "select (current_date - ? )/365 AS edad";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setDate(1, fecha);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            edad = rs.getInt("edad");
            return edad;
        }
        return edad;

    }

    /**
     * metodo que permite consultar los medicos por el servicio
     *
     * @param tipo_usuario Valor del tipo de usuario
     * @param servicio Valor del servicio
     * @return Listado de los usuarios que cumplen las condiciones en la
     * consulta.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public ArrayList<UsuarioDTO> consultarMedicosPorServicio(String tipo_usuario, int servicio) throws SQLException {

        ArrayList<UsuarioDTO> medicos = new ArrayList<UsuarioDTO>();

        String sql = "SELECT * FROM usuario u INNER JOIN medico m ON u.identificacion = m.identificacion WHERE tipo_usuario = ? AND m.servicio = ?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, tipo_usuario);
        ps.setInt(2, servicio);

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
            med.setFecharegistro(rs.getString("fecharegistro"));
            med.setContrasena(rs.getString("contrasena"));

            medicos.add(med);
        }
        return medicos;
    }

    /**
     * metodo que permite consultar a los usuarios por su tipo de usuario
     *
     * @param tipo Tipo de usuario
     * @param fecha1 Fecha inicial
     * @param fecha2 Fecha final
     * @return Listado de los usuarios de acuerdo al tipo de usuario que se
     * desea consultar.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public List<UsuarioDTO> consultarUsuarioPorTipo(String tipo, String fecha1, String fecha2) throws SQLException {

        List<UsuarioDTO> listaOtro = new ArrayList<UsuarioDTO>();

        String sql = "SELECT * FROM usuario WHERE   tipo_usuario = ? "
                + "AND fecharegistro between ? and  ? ORDER BY identificacion";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, tipo);
        ps.setDate(2, Date.valueOf(fecha1));
        ps.setDate(3, Date.valueOf(fecha2));

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
            otro.setFecharegistro(rs.getString("fecharegistro"));
            otro.setContrasena(rs.getString("contrasena"));

            listaOtro.add(otro);
        }

        return listaOtro;

    }

    /**
     * metodo que permite consultar a los usuarios registrados dentro un rango de fechas
     * @param fecha1 Fecha inicial
     * @param fecha2 Fecha final
     * @return Listado de los usuarios registrados ordenado por el nombre.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public List<UsuarioDTO> consultarUsuariosPorFecha(String fecha1, String fecha2) throws SQLException {

        List<UsuarioDTO> listaOtro = new ArrayList<UsuarioDTO>();

        String sql = "SELECT * FROM usuario WHERE  fecharegistro between ? and  ? ORDER BY nombre";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setDate(1, Date.valueOf(fecha1));
        ps.setDate(2, Date.valueOf(fecha2));

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
            otro.setFecharegistro(rs.getString("fecharegistro"));
            otro.setContrasena(rs.getString("contrasena"));

            listaOtro.add(otro);
        }

        return listaOtro;

    }

    /**
     * metodo que permite modificar la contraseña del usuario
     * @param identificacion Identificador del usuario
     * @param contrasena nueva contraseña del usuario
     * @return Valor booleano que confirma la actualización 
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public boolean modificarContrasena(String identificacion, String contrasena) throws SQLException {

        String sql = "UPDATE usuario SET contrasena = ? "
                + "WHERE  identificacion = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, contrasena);
        ps.setString(2, identificacion);

        int rta = ps.executeUpdate();

        return rta > 0;

    }
}
