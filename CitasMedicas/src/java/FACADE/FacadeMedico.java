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
    
    public ArrayList<MedicoDTO> consultarMedicosPorServicio(int servicio) throws SQLException{
        return new NegocioMedico().consultarMedicoPorServicio(servicio);
    }
    
     public boolean verificarMedico(String id, String clave) throws SQLException {
        return new NegocioMedico().verificarMedico(id, clave);
    }
     
     public ArrayList<String[]> listadoMedico() throws SQLException{
         return new NegocioMedico().listadoMedico();
     }
     
     public List<String> consultaServicios() throws SQLException {
         return new NegocioMedico().consultaServicios();
     }
}
