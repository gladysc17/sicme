/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.UsuarioDTO;
import NEGOCIO.NegocioEstudiante;
import NEGOCIO.NegocioUsuario;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class FacadeUsuario {

    public boolean registrarUsuarios(UsuarioDTO otro) throws SQLException {
        return new NegocioUsuario().registrarUsuario(otro);
    }

    public UsuarioDTO consultarUsuarioPorId(String id) {
        return new NegocioUsuario().consultarUsuarioId(id);
    }

    public List<UsuarioDTO> consultarUsuarios() throws SQLException {
        return new NegocioUsuario().listarOtrosUsuarios();
    }

    public List<UsuarioDTO> consultarUsuariosPorFecha(String fecha1, String fecha2) throws SQLException {
        return new NegocioUsuario().consultarUsuariosPorFecha(fecha1, fecha2);
    }
    
    public boolean modificarUsuario(String identificacion_otro, String correo_otro, Date fechanacimiento_otro, String genero_otro, String estadocivil_otro, String direccion_otro, String telefono_otro, int edad) throws SQLException {
        return new NegocioUsuario().modificarUsuario(identificacion_otro, correo_otro, fechanacimiento_otro, genero_otro, estadocivil_otro, direccion_otro, telefono_otro, edad);

    }
     public boolean modificarAdmin(String identificacion, String contrasena ) throws SQLException {
        return new NegocioUsuario().modificarAdmin(identificacion, contrasena);
    }
      public boolean modificarVice(String identificacion, String contrasena ) throws SQLException {
        return new NegocioUsuario().modificarVice(identificacion, contrasena);
    }
       public boolean modificarMedico(String identificacion, String contrasena ) throws SQLException {
        return new NegocioUsuario().modificarMedico(identificacion, contrasena);
    }
       
      

    public int calcularEdad(Date fecha) {
        return new NegocioUsuario().calcularEdad(fecha);
    }

    public boolean recueperarContrasena(String id) throws SQLException {
        return new NegocioUsuario().recuperarContrasena(id);
    }

    public ArrayList<UsuarioDTO> consultarMedicosPorServicio(String tipo_usuario, String servicio) throws SQLException {
        return new NegocioUsuario().consultarMedicoPorServicio(tipo_usuario, servicio);

    }
    
    public List<UsuarioDTO> listarUsuarioPorTipo(String tipo, String fecha1, String fecha2) throws SQLException {
        return new NegocioUsuario().listarUsuarioPorTipo(tipo, fecha1, fecha2);
    }
}
