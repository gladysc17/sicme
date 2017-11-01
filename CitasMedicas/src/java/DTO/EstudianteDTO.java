/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author Gladys M
 *
 * La clase EstudianteDTO contiene los atributos que
 */
public class EstudianteDTO {

    private int id;
    private String identificacion_usuario;
    private int programa_academico;
    private String estado_estudiante;

    public EstudianteDTO() {
    }

    public EstudianteDTO(int id, String identificacion_usuario, int programa_academico, String estado_estudiante) {
        this.id = id;
        this.identificacion_usuario = identificacion_usuario;
        this.programa_academico = programa_academico;
        this.estado_estudiante = estado_estudiante;
    }
    
    public EstudianteDTO(String identificacion_usuario, int programa_academico, String estado_estudiante){
        this.identificacion_usuario = identificacion_usuario;
        this.programa_academico = programa_academico;
        this.estado_estudiante = estado_estudiante;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIdentificacion_usuario() {
        return identificacion_usuario;
    }

    public void setIdentificacion_usuario(String identificacion_usuario) {
        this.identificacion_usuario = identificacion_usuario;
    }

    public int getPrograma_academico() {
        return programa_academico;
    }

    public void setPrograma_academico(int programa_academico) {
        this.programa_academico = programa_academico;
    }

    public String getEstado_estudiante() {
        return estado_estudiante;
    }

    public void setEstado_estudiante(String estado_estudiante) {
        this.estado_estudiante = estado_estudiante;
    }

    @Override
    public String toString() {
        return "EstudianteDTO{" + "id=" + id + ", identificacion_usuario=" + identificacion_usuario + ", programa_academico=" + programa_academico + ", estado_estudiante=" + estado_estudiante + '}';
    }
    
    
    
   
    
    
}