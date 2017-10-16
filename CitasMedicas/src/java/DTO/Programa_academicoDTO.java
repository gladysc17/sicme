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
public class Programa_academicoDTO {
    
    private int id;
    private String nombre_programa;
    private String codigo_programa;

    public Programa_academicoDTO() {
    }

    public Programa_academicoDTO(String nombre_programa, String codigo_programa) {
        this.nombre_programa = nombre_programa;
        this.codigo_programa = codigo_programa;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre_programa() {
        return nombre_programa;
    }

    public void setNombre_programa(String nombre_programa) {
        this.nombre_programa = nombre_programa;
    }

    public String getCodigo_programa() {
        return codigo_programa;
    }

    public void setCodigo_programa(String codigo_programa) {
        this.codigo_programa = codigo_programa;
    }

    @Override
    public String toString() {
        return "Programa_academicoDTO{" + "id=" + id + ", nombre_programa=" + nombre_programa + ", codigo_programa=" + codigo_programa + '}';
    }
    
    
    
    
}
