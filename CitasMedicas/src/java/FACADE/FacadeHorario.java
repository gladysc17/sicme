/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.HorarioDTO;
import NEGOCIO.NegocioHorario;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class FacadeHorario {

    public List<HorarioDTO> consultarHorasDisponibles(String id_medico, String fecha) throws Exception {
        return new NegocioHorario().consultarHorasDisponibles(id_medico, fecha);
    }

    public List<HorarioDTO> consultarHoras() throws Exception {
        return new NegocioHorario().listadoHoras();
    }

    public boolean cambiarEstadoHora(String id_medico_horariomedico, String fecha, int id_horario_horariomedico, String estado) {
        return new NegocioHorario().cambiarEstadoHora(id_medico_horariomedico, fecha, id_horario_horariomedico, estado);
    }

    public HorarioDTO listadoMedicosHora(int id) throws Exception {
        return new NegocioHorario().listadoHorasMedico(id);
    }

    public HorarioDTO consultarHora(String fecha) throws Exception {
        return new NegocioHorario().consultaHora(fecha);
    }

}
