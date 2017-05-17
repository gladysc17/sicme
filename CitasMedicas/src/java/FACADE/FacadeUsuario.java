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
import java.util.List;


/**
 *
 * @author Gladys M
 */
public class FacadeUsuario {
    
    public boolean registrarUsuarios(UsuarioDTO otro) throws SQLException {
        return new NegocioUsuario().registrarUsuario(otro);
    }
    
    public UsuarioDTO consultarUsuarioPorId(String id){
        return new NegocioUsuario().consultarUsuarioId(id);
    }
    
    public List<UsuarioDTO> consultarUsuarios() throws SQLException{
        return new NegocioUsuario().listarOtrosUsuarios();
    }
    
    public boolean modificarUsuario(String identificacion_otro, String correo_otro, Date fechanacimiento_otro, String genero_otro, String estadocivil_otro, String direccion_otro, String telefono_otro) throws SQLException{
        return new NegocioUsuario().modificarUsuario(identificacion_otro, correo_otro, fechanacimiento_otro, genero_otro, estadocivil_otro, direccion_otro, telefono_otro);
        
    }
     public int calcularEdad(Date fecha){
        return new NegocioUsuario().calcularEdad(fecha);
    }
}
