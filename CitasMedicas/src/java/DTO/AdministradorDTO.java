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
public class AdministradorDTO {
    
    private String identificacion_usuario;  
    private String contrasena;

    public AdministradorDTO() {
    }

    public AdministradorDTO(String identificacion_usuario, String contrasena) {
        this.identificacion_usuario = identificacion_usuario;
        this.contrasena = contrasena;
    }

    public String getIdentificacion_usuario() {
        return identificacion_usuario;
    }

    public void setIdentificacion_usuario(String identificacion_usuario) {
        this.identificacion_usuario = identificacion_usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

   
    
}
