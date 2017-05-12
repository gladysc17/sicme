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
public class VicerrectorDTO {

    private int identificacion_vice;
    private String nombre_vice;
    private String correo_vice;
    private String telefono_vice;
    private int codigo_vice;
    private String contrasena_vice;

    public VicerrectorDTO() {
    }

    public VicerrectorDTO(int identificacion_vice, String nombre_vice, String correo_vice, String telefono_vice, int codigo_vice, String contrasena_vice) {
        this.identificacion_vice = identificacion_vice;
        this.nombre_vice = nombre_vice;
        this.correo_vice = correo_vice;
        this.telefono_vice = telefono_vice;
        this.codigo_vice = codigo_vice;
        this.contrasena_vice = contrasena_vice;
    }

    public int getIdentificacion_vice() {
        return identificacion_vice;
    }

    public void setIdentificacion_vice(int identificacion_vice) {
        this.identificacion_vice = identificacion_vice;
    }

    public String getNombre_vice() {
        return nombre_vice;
    }

    public void setNombre_vice(String nombre_vice) {
        this.nombre_vice = nombre_vice;
    }

    public String getCorreo_vice() {
        return correo_vice;
    }

    public void setCorreo_vice(String correo_vice) {
        this.correo_vice = correo_vice;
    }

    public String getTelefono_vice() {
        return telefono_vice;
    }

    public void setTelefono_vice(String telefono_vice) {
        this.telefono_vice = telefono_vice;
    }

    public int getCodigo_vice() {
        return codigo_vice;
    }

    public void setCodigo_vice(int codigo_vice) {
        this.codigo_vice = codigo_vice;
    }

    public String getContrasena_vice() {
        return contrasena_vice;
    }

    public void setContrasena_vice(String contrasena_vice) {
        this.contrasena_vice = contrasena_vice;
    }
    
    
}
