/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.OtroUsuarioDTO;
import NEGOCIO.NegocioEstudiante;
import NEGOCIO.NegocioOtroUsuario;
import java.sql.SQLException;
import java.util.List;


/**
 *
 * @author Gladys M
 */
public class FacadeOtrosUsuarios {
    
    public boolean registrarOtrosUsuarios(OtroUsuarioDTO otro) throws SQLException {
        return new NegocioOtroUsuario().registrarOtroUsuario(otro);
    }
    
    public OtroUsuarioDTO consultarOtroUsuarioPorId(int id){
        return new NegocioOtroUsuario().consultarOtroUsuarioId(id);
    }
    
    public List<OtroUsuarioDTO> consultarOtros() throws SQLException{
        return new NegocioOtroUsuario().listarOtrosUsuarios();
    }
    
    public boolean modificarOtroUsuario(int identificacion_otro, String correo_otro, String fechanacimiento_otro, String genero_otro, String estadocivil_otro, String direccion_otro, String telefono_otro) throws SQLException{
        return new NegocioOtroUsuario().modificarOtroUsuario(identificacion_otro, correo_otro, fechanacimiento_otro, genero_otro, estadocivil_otro, direccion_otro, telefono_otro);
        
    }
    
}
