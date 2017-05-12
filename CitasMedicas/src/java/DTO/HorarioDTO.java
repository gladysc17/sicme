/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.sql.Time;

/**
 *
 * @author Gladys M
 */
public class HorarioDTO {
    
  private int id_horario;
  private Time hora_inicio;
  private Time hora_final;

    public HorarioDTO() {
    }

    public HorarioDTO(int id_horario, Time hora_inicio, Time hora_final) {
        this.id_horario = id_horario;
        this.hora_inicio = hora_inicio;
        this.hora_final = hora_final;
    }

    

    public int getId_horario() {
        return id_horario;
    }

    public void setId_horario(int id_horario) {
        this.id_horario = id_horario;
    }

    public Time getHora_inicio() {
        return hora_inicio;
    }

    public void setHora_inicio(Time hora_inicio) {
        this.hora_inicio = hora_inicio;
    }

    public Time getHora_final() {
        return hora_final;
    }

    public void setHora_final(Time hora_final) {
        this.hora_final = hora_final;
    }

    
    
}
