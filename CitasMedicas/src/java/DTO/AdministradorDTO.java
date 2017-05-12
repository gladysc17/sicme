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
    
    private int identificacion_administrador;
    private String nombre_administrador ;
    private String correo_administrador;
    private String telefono_administrador;
    private int codigo_administrador;
    private String fechanacimiento_administrador;
    private String genero_administrador;    
    private String estadocivil_administrador;
    private String direccion_administrador;    
    private String contrasena_administrador;

    public AdministradorDTO() {
    }

    public AdministradorDTO(int identificacion_administrador, String nombre_administrador, String correo_administrador, String telefono_administrador, int codigo_administrador, String fechanacimiento_administrador, String genero_administrador, String estadocivil_administrador, String direccion_administrador, String contrasena_administrador) {
        this.identificacion_administrador = identificacion_administrador;
        this.nombre_administrador = nombre_administrador;
        this.correo_administrador = correo_administrador;
        this.telefono_administrador = telefono_administrador;
        this.codigo_administrador = codigo_administrador;
        this.fechanacimiento_administrador = fechanacimiento_administrador;
        this.genero_administrador = genero_administrador;
        this.estadocivil_administrador = estadocivil_administrador;
        this.direccion_administrador = direccion_administrador;
        this.contrasena_administrador = contrasena_administrador;
    }

    public int getIdentificacion_administrador() {
        return identificacion_administrador;
    }

    public void setIdentificacion_administrador(int identificacion_administrador) {
        this.identificacion_administrador = identificacion_administrador;
    }

    public String getNombre_administrador() {
        return nombre_administrador;
    }

    public void setNombre_administrador(String nombre_administrador) {
        this.nombre_administrador = nombre_administrador;
    }

    public String getCorreo_administrador() {
        return correo_administrador;
    }

    public void setCorreo_administrador(String correo_administrador) {
        this.correo_administrador = correo_administrador;
    }

    public String getTelefono_administrador() {
        return telefono_administrador;
    }

    public void setTelefono_administrador(String telefono_administrador) {
        this.telefono_administrador = telefono_administrador;
    }

    public int getCodigo_administrador() {
        return codigo_administrador;
    }

    public void setCodigo_administrador(int codigo_administrador) {
        this.codigo_administrador = codigo_administrador;
    }

    public String getFechanacimiento_administrador() {
        return fechanacimiento_administrador;
    }

    public void setFechanacimiento_administrador(String fechanacimiento_administrador) {
        this.fechanacimiento_administrador = fechanacimiento_administrador;
    }

    public String getGenero_administrador() {
        return genero_administrador;
    }

    public void setGenero_administrador(String genero_administrador) {
        this.genero_administrador = genero_administrador;
    }

    public String getEstadocivil_administrador() {
        return estadocivil_administrador;
    }

    public void setEstadocivil_administrador(String estadocivil_administrador) {
        this.estadocivil_administrador = estadocivil_administrador;
    }

    public String getDireccion_administrador() {
        return direccion_administrador;
    }

    public void setDireccion_administrador(String direccion_administrador) {
        this.direccion_administrador = direccion_administrador;
    }

    public String getContrasena_administrador() {
        return contrasena_administrador;
    }

    public void setContrasena_administrador(String contrasena_administrador) {
        this.contrasena_administrador = contrasena_administrador;
    }

    
    
    
}
