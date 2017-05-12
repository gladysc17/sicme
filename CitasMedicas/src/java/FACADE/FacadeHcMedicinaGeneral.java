/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.HcMedicinaGeneralDTO;
import NEGOCIO.NegocioHcMedicinaGeneral;
import java.sql.SQLException;
import java.util.List;



/**
 *
 * @author Gladys M
 */
public class FacadeHcMedicinaGeneral {
    
    
    public boolean registrarHCMedicinaGeneral(HcMedicinaGeneralDTO hcmed) throws SQLException {
        return new NegocioHcMedicinaGeneral().registrarHCMedicinaGeneral(hcmed);
    }
    public List<HcMedicinaGeneralDTO> consultarHCMedicinaGeneral(int id_usuario) throws SQLException {
        return new NegocioHcMedicinaGeneral().consultarHCMedicinaGeneral(id_usuario);
    }
    public HcMedicinaGeneralDTO consultarHCMedicinaGeneralCita(int id_usuario, int id_cita) throws SQLException {
        return new NegocioHcMedicinaGeneral().consultarHCMedicinaGeneralCita(id_usuario, id_cita);
    }
}
