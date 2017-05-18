/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.HorarioMedicoDTO;
import NEGOCIO.NegocioHorarioMedico;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class FacadeHorarioMedico {
    
    public boolean registrarHorarioMedico(HorarioMedicoDTO hm) throws Exception{
        return new NegocioHorarioMedico().registrarHorario(hm);
    }
    public HorarioMedicoDTO consultarHorarioMedico(int id_horariomedico) throws Exception{
        return new NegocioHorarioMedico().consultarHorarioMedico(id_horariomedico);
    }
    
    
}
