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
    private String programa_academico;

    public EstudianteDTO() {
    }

    public EstudianteDTO(int id, String identificacion_usuario, String programa_academico) {
        this.id = id;
        this.identificacion_usuario = identificacion_usuario;
        this.programa_academico = programa_academico;
    }
    
    public EstudianteDTO(String identificacion_usuario, String programa_academico){
        this.identificacion_usuario = identificacion_usuario;
        this.programa_academico = programa_academico;
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

    public String getPrograma_academico() {
        return programa_academico;
    }

    public void setPrograma_academico(String programa_academico) {
        this.programa_academico = programa_academico;
    }
    
    
    
   
    
    
}