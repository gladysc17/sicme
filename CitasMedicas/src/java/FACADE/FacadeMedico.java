/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.MedicoDTO;
import NEGOCIO.NegocioMedico;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class FacadeMedico {
    
    public boolean registrarMedico(MedicoDTO med) throws SQLException {
        return new NegocioMedico().registrarMedico(med);
    }
    
    public MedicoDTO consultarMedicoPorId(String id){
        return new NegocioMedico().consultarMedicoPorId(id);
    }
    
    public List<MedicoDTO> consultarMedicos() throws SQLException{
        return new NegocioMedico().listarMedicos();
    }
    
    public ArrayList<MedicoDTO> consultarMedicosPorServicio(String servicio) throws SQLException{
        return new NegocioMedico().consultarMedicoPorServicio(servicio);
    }
    
    public boolean modificarMedico(int identificacion_med, String correo_med, String fechanacimiento_med, String genero_med, String estadocivil_med, String direccion_med, String telefono_med, String contrasena_med) throws SQLException{
        return new NegocioMedico().modificarMedico(identificacion_med, correo_med, fechanacimiento_med, genero_med, estadocivil_med, direccion_med, telefono_med, contrasena_med);
    }
    
     public boolean verificarMedico(String id, String clave) throws SQLException {
        return new NegocioMedico().verificarMedico(id, clave);

    }
}
