/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author Gladys M
 */
public class HorarioMedicoDTO {
    
  int id_horariomedico;
  String fecha;
  int id_horario_horariomedico;
  String id_medico_horariomedico;
  String estado_horariomedico;

    public HorarioMedicoDTO() {
    }

    public HorarioMedicoDTO(String fecha, int id_horario_horariomedico, String id_medico_horariomedico, String estado_horariomedico) {
        this.fecha = fecha;
        this.id_horario_horariomedico = id_horario_horariomedico;
        this.id_medico_horariomedico = id_medico_horariomedico;
        this.estado_horariomedico = estado_horariomedico;
    }
    
    public HorarioMedicoDTO(int id_horariomedico, String fecha, int id_horario_horariomedico, String id_medico_horariomedico, String estado_horariomedico) {
        this.id_horariomedico = id_horariomedico;
        this.fecha = fecha;
        this.id_horario_horariomedico = id_horario_horariomedico;
        this.id_medico_horariomedico = id_medico_horariomedico;
        this.estado_horariomedico = estado_horariomedico;
    }

    public int getId_horariomedico() {
        return id_horariomedico;
    }

    public void setId_horariomedico(int id_horariomedico) {
        this.id_horariomedico = id_horariomedico;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getId_horario_horariomedico() {
        return id_horario_horariomedico;
    }

    public void setId_horario_horariomedico(int id_horario_horariomedico) {
        this.id_horario_horariomedico = id_horario_horariomedico;
    }

    public String getId_medico_horariomedico() {
        return id_medico_horariomedico;
    }

    public void setId_medico_horariomedico(String id_medico_horariomedico) {
        this.id_medico_horariomedico = id_medico_horariomedico;
    }

    public String getEstado_horariomedico() {
        return estado_horariomedico;
    }

    public void setEstado_horariomedico(String estado_horariomedico) {
        this.estado_horariomedico = estado_horariomedico;
    }
  
  
  
}
