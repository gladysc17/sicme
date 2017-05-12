/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.DocenteDTO;
import NEGOCIO.NegocioDocente;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class FacadeDocente {
    
    public boolean registrarDocente(DocenteDTO doc) throws SQLException {
        return new NegocioDocente().registrarDocente(doc);
    }
    
    public DocenteDTO consultarDocenteporId(int id){
        return new NegocioDocente().consultarDocentePorId(id);
    }
        
    public List<DocenteDTO> consultarDocentes() throws SQLException{
        return new NegocioDocente().listarDocentes();
    }
    
    public boolean modificarDocente(int  identificacion_doc, String correo_doc, String fechanac_doc, String genero_doc, String estadocivil_doc, String direccion_doc, String telefono_doc) throws SQLException{
        return new NegocioDocente().modificarDocente(identificacion_doc, correo_doc, fechanac_doc, genero_doc, estadocivil_doc, direccion_doc, telefono_doc);
    }
}
