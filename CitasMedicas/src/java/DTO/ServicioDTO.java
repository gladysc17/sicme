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
public class ServicioDTO {
    
    private int id;
    private String nombre;
    private String informacion;

    public ServicioDTO() {
    }
    
    
    
    public ServicioDTO(String nombre, String informacion) {        
        this.nombre = nombre;
        this.informacion = informacion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getInformacion() {
        return informacion;
    }

    public void setInformacion(String informacion) {
        this.informacion = informacion;
    }

    @Override
    public String toString() {
        return "ServicioDTO{" + "id=" + id + ", nombre=" + nombre + ", informacion=" + informacion + '}';
    }

    
}
